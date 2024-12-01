---
layout: layouts/post.njk
title: WINE best effort setup
tags:
    - linux
    - gaming
    - blog
date: 2022-01-29
---

Getting initial packages and dependencies for wine.

```bash
sudo pacman -Syu --needed wine-staging giflib lib32-giflib libpng lib32-libpng libldap lib32-libldap gnutls lib32-gnutls mpg123 lib32-mpg123 openal lib32-openal v4l-utils lib32-v4l-utils libpulse lib32-libpulse libgpg-error lib32-libgpg-error alsa-plugins lib32-alsa-plugins alsa-lib lib32-alsa-lib libjpeg-turbo lib32-libjpeg-turbo sqlite lib32-sqlite libxcomposite lib32-libxcomposite libxinerama lib32-libgcrypt libgcrypt lib32-libxinerama ncurses lib32-ncurses opencl-icd-loader lib32-opencl-icd-loader libxslt lib32-libxslt libva lib32-libva gtk3 lib32-gtk3 gst-plugins-base-libs lib32-gst-plugins-base-libs vulkan-icd-loader lib32-vulkan-icd-loader
```

Wine optional depencies for better performance.

```bash
sudo pacman -S --needed winetricks
winetricks -q d3dcompiler_43 d3dcompiler_47 d3dx9 corefonts cjkfonts faudio
```

That's it! Enjoy...


