---
layout: layouts/post.njk
title: C coding styles
cover: https://upload.wikimedia.org/wikipedia/en/e/e5/The_Elements_of_Programming_Style.jpg
tags: 
    - programming
    - c
    - blog
date: 2022-07-12
---


## Code Indentation and style guidelines

The indent program changes the appearance of a C program by inserting or deleting whitespace.
The indent program can be used to make code easier to read. It can also convert from one style of writing C to another.
`indent` understands a substantial amount about the syntax of C, but it also attempts to cope with incomplete and misformed syntax.

GNU indent is available for linux distributions and can be simply installed using the indent package.

The common syntax for it can be one among the following :-
```bash
indent [options] [input-files]
indent [options] [single-input-file] [-o output-file]
indent --version
```
The different style formats which we can format our code are :-

| Coding style | flags | details |
|----|----|----|
| GNU style | no flag/`-gnu` | The GNU coding style is that preferred by the GNU project. Available with no flag. |
| The Kernighan & Ritchie style | `-kr` | The Kernighan & Ritchie style is used throughout their well-known book _The C Programming Language._ |
| The Berkeley style | `-orig` | The original Berkeley coding style was featured in most of the code in the BSD Unix |
| The Linux Style | `-linux` | The Linux style is used in the linux kernel code and drivers. Includes saner formatting and is generally recommended. |

Apart from the predesigned code styles, you can generate your own code style or make it follow a specific pattern using the following options, read on.

### Blank lines

| Flag | Effect | Revert with |
|----|----|----|
| `-bad` | Forces a blank line after every block of declarations | `-nbad` |
| `-bap` | Forces a blank line after every procedure body | `-nbap` |
| `-bbb` | Forces a blank line before every boxed comment | `-nbbb` |
| `-sob` | Causes indent to swallow optional blank lines | `-nsob` |

### Comments

_To be continued..._