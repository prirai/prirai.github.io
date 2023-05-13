---
layout: layouts/post.njk
title: Using 3DS with Citra
cover: https://upload.wikimedia.org/wikipedia/commons/d/d4/Citra_Logo.svg
tags:
    - gaming
    - howto
    - blog
date: 2022-12-17
---

The Nintendo 3DS is a handheld game console released by Nintendo in 2011. It is capable of displaying 3D effects without the need for special glasses. The console has seen several iterations, including the New Nintendo 3DS and the New Nintendo 2DS XL.

Some popular titles for the Nintendo 3DS include Super Mario 3D Land, Mario Kart 7, Animal Crossing: New Leaf, and Pokémon Sun and Moon. The console also has a large library of games from previous Nintendo systems available for download through its virtual console service.

Overall, the Nintendo 3DS has been well-received and has sold over 75 million units worldwide. It continues to be supported by Nintendo with new game releases and updates.



So, you downloaded this 3DS rom and while loading on the emulator, it shows that the rom is encrypted. What do you do?
Maybe read this for more clarity - [https://citra-emu.org/wiki/user-directory/](https://citra-emu.org/wiki/user-directory/).
If you are unable to follow or have less time, maybe read on for a solution.

You might be using an emulator like Citra or maybe something else so what are the alternatives or the solutions here:-

1. Decrypt the rom using
   [https://gbatemp.net/download/batch-cia-3ds-decryptor.35098/](https://gbatemp.net/download/batch-cia-3ds-decryptor.35098/) on
   a Windows PC.

Don't have access to a computer currently or not having Windows? Follow on...

2. Add the following AES keys to Citra AES Keys so that Citra can decrypt on the fly. Download the file from here - {{ '/cdn/aes_keys.txt' | url }}.
   Rename the file to - `aes_keys.txt`. On a linux or mac, move the file to `~/.local/share/citra-emu/sysdata/`. Restart Citra
   and see if it works.

3. Directly download unencrypted roms from -
   [https://archive.org/download/3dsdecrypted](https://archive.org/download/3dsdecrypted) and use them.

| **Name/Description**                                         | **Links**                                                                            |
  | ----------------------------------------------------------------- | ------------------------------------------------------------------------------------ |
  | No-Intro Nintendo 3DS Encrypted .3ds Part 1 (2021-12-31)          | [Link](https://archive.org/download/3ds-main-encrypted)                              |
  | No-Intro Nintendo 3DS Encrypted .3ds Part 2 (2021-12-31)          | [Link](https://archive.org/download/3ds-main-encrypted-p2)                           |
  | No-Intro Nintendo 3DS Encrypted .3ds Part 1 (2022-01-03)          | [Link](https://archive.org/download/no-intro-nintendo-nintendo-3ds-encrypted)        |
  | No-Intro Nintendo 3DS Encrypted .3ds Part 2 (2022-01-03)          | [Link](https://archive.org/download/no-intro-nintendo-nintendo-3ds-encrypted-part-2) |
  | Nintendo 3DS eShop Complete Collection .cia/.3ds                  | [Link](https://archive.org/download/nintendo-3ds-eshop-complete-collection)          |
  | Nintendo 3DS Complete Collection .3ds [1-1700]                    | [Link](https://archive.org/download/nintendo-3ds-complete-collection)                |
  | Nintendo 3DS Complete Collection .3ds [1701-1861]                 | [Link](https://archive.org/download/nintendo-3ds-complete-collection-pt2)            |
  | No-Intro Nintendo 3DS DLC and Updates Encrypted .cia (2021-10-16) | [Link](https://archive.org/download/3ds-dlc-and-updates-encrypted)                   |
  | hShop: 3DS Content in .cia Format and QR Codes                    | [Link](https://hshop.erista.me)                                                      |
