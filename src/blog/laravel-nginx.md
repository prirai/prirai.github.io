---
layout: layouts/post.njk
title: Setting up a Laravel 12x project and deploying using Nginx and Octane
tags:
    - web
    - deployment
    - nginx
    - blog
date: 2025-03-14
---

I highly recommend you to look at the official Laravel documentation for more information on setting up a Laravel project and deploying it using Nginx and Octane.

Look up these:

- [Laravel Documentation](https://laravel.com/docs/12.x)
- [Nginx Documentation](https://nginx.org/en/docs/)
- [Octane Documentation](https://laravel.com/docs/12.x/octane)

## Getting Started

Laravel provides with some very awesome starter kits, these are something which are pre-built and you're welcome to play with them.

For installing and working with your laravel projects, you need to have those installed. As we'll be using Nginx, we need to have that installed as well.
You need to refer to your operating system specific documentation and then you can figure that out easily, wait, can you?

There's also the option to use this script which instantly gets you php, composer and laravel installed in the same bundle.

```bash
/bin/bash -c "$(curl -fsSL https://php.new/install/linux/8.4)"
```

This is a herd-lite bundle and you're welcome to try out the full bundle [Laravel - Herd](https://herd.laravel.com/) which is free for basic usage and it makes setting up and maintaining your project very easy. I won't be covering that here as we're looking at a more minimal configuration.

So, onwards with the project creation, we'll be using a react starter kit here but you're free to choose the Vue or Livewire starter kits or start minimal, whatever suites your boat. Also, make sure to use an appropriate database system, here I chose postgreSQL. Have an appropriate version of that installed as well.

```bash
laravel new my-app #Replace my-app with an appropriate name
cd <my-app>
npm i
composer i
cp .env.example .env
php artisan key:generate
php artisan migrate
npm run build
composer run dev
```

This typically runs both the Laravel development server (using `php artisan serve`) and the Vite development server, allowing you to see your changes in real-time. It combines hot-reloading for both PHP (using artisan serve) and React (using Vite).
After doing this, you should have the server running up on port 8000 by default. Ran into issues? Ask me.

## Self-signed SSL Certificates

Before we actually deploy the project, we do need to look at a couple more things. First is having a certificate signed by a Trusted Certificate Authority (CA). Or you can use Let's Encrypt which is free and easy to use.

If these do not seem to work for you, you can also self-sign your own certificates and use them. Note that when a user visits your site, they will see a warning about the certificate being self-signed. This is expected and can be ignored.

Make sure you have openssl installed. Now, generate a self-signed key and certificate pair:

```bash
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt
```

You'll be asked a few questions about your organization and location. You can fill appropriately.

You can also create a strong DH (Diffie-Hellman) group for your server:

```bash
sudo openssl dhparam -out /etc/ssl/certs/dhparam.pem 2048
```

For the full process, you can refer to [How to Create a Self-Signed SSL Certificate ... - DigitalOcean](https://www.digitalocean.com/community/tutorials/how-to-create-a-self-signed-ssl-certificate-for-nginx-in-ubuntu-16-04#step-2-configure-nginx-to-use-ssl). This has some more explanation and a full nginx configuration which might work for a simple website but won't work in case of laravel. Truth be told, I was having some issues with `php-fpm`. So, I ended up using the beast, which is octane algonside nginx.

## Web server choices

We'll be installing `octane` here and will enable the `FrankenPHP` plugin. FrankenPHP uses the caddy web server and is lightning fasting in handling PHP-based projects, expecially laravel. The best part is, while PHP-FPM loads the entire application everytime a new user comes to make a request, in case of octane, the entire application is loaded once and then cached. This means we can serve requests much faster by getting rid of the booting up time.

In your laravel project's root directory:

```bash
composer require laravel/octane
php artisan octane:install
```

You might need to check in the `config/octane.php` file and make sure the `server` is set to `frankenphp`. Create a file in the project's root directory and name it `Caddyfile`.

```bash
{
        frankenphp
}

# The domain name of your server
localhost {
        # Set the webroot to the public/ directory
        root * public/
        # Enable compression (optional)
        encode zstd br gzip
        # Execute PHP files from the public/ directory and serve assets
        php_server {
                try_files {path} index.php
        }
}
```

Now, we start the server at port 8000 using octane:

```bash
php artisan octane:start --server=swoole --host=127.0.0.1 --port=8000
```
Note that this is not the webpage that your visitors will see, this is actually running as a user process while capturing a non-privileged port. Thus the web server itself can be handled by a user who doesn't require root access. Now, we can configure nginx to proxy requests to this server.

## Nginx Configuration

Create a configuration file at `/etc/nginx/sites-available/laravel-my-site`, keep the name as per your choice, add the following configuration:

```bash
server {
    listen 80;
    server_name <server_ip>;
    return 301 https://$host$request_uri; # Redirecting HTTP to HTTPS
}

server {
    listen 443 ssl;
    listen [::]:443 ssl;
    http2 on;  # Enable HTTP/2

    listen 443 quic reuseport;  # Enable HTTP/3
    listen [::]:443 quic reuseport;
    http3 on;  # Enable HTTP/3
    server_name <server_ip>;

    ssl_certificate /etc/ssl/certs/nginx-selfsigned.crt;
    ssl_certificate_key /etc/ssl/private/nginx-selfsigned.key;

    add_header Alt-Svc 'h3=":443"; ma=86400';  # Advertise HTTP/3
    add_header X-Content-Type-Options nosniff;

    location / {
        proxy_pass http://127.0.0.1:8000; # Pass requests to octane server
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto https;
    }
}
```

Now, we can symlink the configuration file to `/etc/nginx/sites-enabled/` and restart nginx:

```bash
sudo ln -s /etc/nginx/sites-available/laravel-my-site /etc/nginx/sites-enabled/
sudo systemctl restart nginx
```

Also, test the configuration file for syntax errors:

```bash
sudo nginx -t
```
You'll get some warnings related to ssl_stapling but you can ignore them safely as encryption will still work just fine.

Open your browser and visit `https://<server_ip>` to see your Laravel application running over HTTP/3.

Enjoy!
