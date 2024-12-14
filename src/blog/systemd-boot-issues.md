---
layout: layouts/post.njk
title: Common systemd-boot issues and how to fix them
tags:
    - linux
    - howto
    - blog
date: 2022-09-12
---

Systemd-boot is a boot loader for Linux systems. It is the default boot loader for Arch Linux and many other distributions. It is a very simple and easy to use boot loader. However, it is not without its issues. In this post, I will be going over some of the common issues that I have encountered with systemd-boot and how to fix them.

## Booting into the wrong OS

This is a very common issue that I have encountered with systemd-boot. It's that when you boot into your system, you are presented with a list of operating systems that you can boot into. However, the default option is not the one that you want to boot into. This commonly happens when you have multiple operating systems installed. The solution is to change the default boot option. To do this, you need to edit the file `/boot/loader/loader.conf`. This file contains the configuration for systemd-boot. Just add the following line to the file:

```
default arch.conf
```

Where you can replace arch.conf with the configuration file you made in the entries folder.

## Booting directly into the default selected OS without showing the menu

So, I was trying out different key-bindings for the systemd-boot menu. Doing that, I by mistake set the timeout to 0. This means that the menu will not show up and the system will boot directly into the default selected OS. In my case the default selected OS was the linux-stable kernel. 

At first I tried to change the name of the configuration file from `linux-secure.conf` to `linux-stable-secure.conf`. This also didn't do any good. The default one was selected regardless of the filename being changed.

```bash
╰─>$ bootctl list
Boot Loader Entries:
         type: Boot Loader Specification Type #1 (.conf)
        title: Arch Linux (secure)
           id: linux-stable-secure.conf
       source: /boot/loader/entries/linux-stable-secure.conf

         type: Boot Loader Specification Type #1 (.conf)
        title: Arch Linux LTS (secure)
           id: linux-lts-secure.conf
       source: /boot/loader/entries/linux-lts-secure.conf

         type: Boot Loader Specification Type #1 (.conf)
        title: Arch Linux Hardened (secure) (default) (selected)
           id: linux-hardened-secure.conf
       source: /boot/loader/entries/linux-hardened-secure.conf

         type: Boot Loader Specification Type #1 (.conf)
        title: keytool
           id: keytool.conf
       source: /boot/loader/entries/keytool.conf

         type: Automatic
        title: Reboot Into Firmware Interface
           id: auto-reboot-to-firmware-setup
       source: /sys/firmware/efi/efivars/LoaderEntries-4a67b082-0a4c-41cf-b6c7-440b29bb8c4f
```

Notice how the default and selected flags are set to the linux-hardened-secure.conf file.

After exploring a bit, I found out that in the file at `/sys/firmware/efi/efivars/LoaderConfigTimeout-4a67b082-0a4c-41cf-b6c7-440b29bb8c4f` had the value 0. This means that the timeout value was set to 0. Howecould not be edited. I tried to change the permissions of the file but that didn't work. I also tried to change the value of the file using `echo 10 > /sys/firmware/efi/efivars/LoaderConfigTimeout-4a67b082-0a4c-41cf-b6c7-440b29bb8c4f` but that didn't work either.

### Final solution

I entered the following command in a root shell:

```bash
chattr -i /sys/firmware/efi/efivars/LoaderConfigTimeout-4a67b082-0a4c-41cf-b6c7-440b29bb8c4f
rm /sys/firmware/efi/efivars/LoaderConfigTimeout-4a67b082-0a4c-41cf-b6c7-440b29bb8c4f
```

`chattr -i` removes the immutable flag from the file. `rm` removes the file. After this, I rebooted my system. Voila! the menu showed up and I was able to select the OS that I wanted to boot into.

`chattr` is a tool to change file attributes on a Linux file system. The `i` flag is the immutable flag. This flag prevents the file from being modified. This is useful for files that you don't want to be modified. For example, the file `/etc/shadow` is immutable. This is because you don't want to modify the file. If you do, you will not be able to login to your system.
