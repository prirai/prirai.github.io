---
layout: layouts/post.njk
title: Introduction to C Programming
tags: 
    - programming
    - c
    - blog
date: 2021-08-15
---

> C is a general-purpose programming language with features economy of expression, modern flow control and data structures, and a rich set of operators. C is not a "very high level" language, nor a "big" one, and is not specialized to any particular area of application. But its absence of restrictions and its generality make it more convenient and effective for many tasks than supposedly more powerful languages.

## Why learn C?

C is a popular programming language that is known for its efficiency and versatility. It is used in a wide range of applications, including operating systems, embedded systems, and high-level programming languages like Perl, PHP, Python, and Ruby.

One of the main reasons to learn C is its widespread use in operating systems. Many popular operating systems, such as Unix and Linux, are written in C, and knowledge of C can give you a deeper understanding of how these systems work. C is also a good choice for low-level programming tasks, such as those that require direct interaction with hardware or need to be highly optimized for performance.

Another reason to learn C is its portability. C code can be compiled for a wide range of platforms, making it a good choice for applications that need to run on multiple devices. It is also a stable and mature language that is unlikely to disappear any time soon, which means that the skills you learn in C will remain useful for a long time.

## Why C and not any other language?

The primary design of C is to produce portable code while maintaining performance and minimizing footprint (CPU time, memory usage, disk I/O, etc.). This is useful for operating systems, embedded systems or other programs where performance matters a lot (“high-level” interface would affect performance). With C it’s relatively easy to keep a mental picture of what a given line really does, because most of the things are written explicitly in the code. C has a big codebase for low level applications. It is the “native” language of UNIX, which makes it flexible and portable. It is a stable and mature language which is unlikely to disappear for a long time and has been ported to most, if not all, platforms.

Let's start with the traditional hello world program:

```c
 #include <stdio.h>
 int main()
 {
     printf("Hello, World\n");
 }


* * *

OUTPUT

Hello, World
*** Exited normally ***
```

OK, so let's dive in and look at the first line in our program:

`#include <stdio.h>`


So, in order to understand what's happening here, you need to know that your machine comes with some already established utilities in order to relieve you from doing stuff from the bare basics. In this case we are invoking a standard library defined in the C language called the 'stdio' which is basically a utility for taking input from the user and flashing back the output. Having a library in hand always saves us from the burden of diving into the extreme low level code which we don't even have to go on and about tweaking.  
Therefore we tell the compiler beforehand to include library code by using [preprocessor directives](https://en.wikipedia.org/wiki/preprocessor_directive). One of the very first tasks your compiler will perform is to search through your source code for preprocessor directives which modify your source code in some way. In our case, the #include preprocessor directive tells the compiler to copy source code from a library and insert it directly into the code where the preprocessor directive is found. Since our directive is at the very top of the file, the library code will be inserted at the top of the source file. (Note that this all happens in the computer's memory, so the original file on your disk never actually gets altered.)

`int main()`


Here we create a **function** named `main` that is the starting point for all C programs. All C programs require a function called "main" or they will not compile. Our function name is surrounded by two mysterious symbols, **int** and **(void)**. The "int" bit tells the compiler what kind of value our function will return while the "(void)" bit tells our compiler what kind of values we will "pass" into our function. We'll skip over what exactly this means for now as these values will be covered in more detail later in the book. The most important thing to understand right now is that together, these symbols **declare** our function to the compiler and tell it that it exists.

So what is a function? In computer science, the term “function” is used a bit more loosely than in mathematics, since functions often express imperative ideas (as in the case of C) - that is, _how-to_ process, instead of declarations. For now, suffice it to say, functions define a set of computer statements that work together to carry out a specific task. In C, the statements associated with a function are placed between a set of curly braces, `{ }`, which mark the beginning and end of the statements. Together, the curly braces and the statements are called a **block.** Let's take a look at the first line in our function's block:

`printf("Hello, World\n");`


## What will you need

No one ever became a musician just by reading sheet music. Musicians have to constantly play and practice on their instruments to get good. Similarly, the only way to become a programmer is to write and execute lots of code. To do that, you will need two different pieces of software: a **compiler** and a **text editor**. Both can be had for no cost.

### Compilers

The compiler used in this course will be the GNU C Compiler (GCC).

### Text editors and IDEs

Aside from a compiler, the only other software requirement is a [text editor](https://en.wikipedia.org/wiki/Text_Editor) for writing and saving your C code. Note that a text editor is different from a [word processor](https://en.wikipedia.org/wiki/Word_Processor), a piece of software with many features for creating visually appealing documents. Unlike word processors, text editors are primarily designed to create plain text files. On Windows, the Notepad text editor can be used but it does not offer any advanced capabilities such as syntax highlighting and code completion. There are hundreds of text editors (see [List of Text Editors](https://en.wikipedia.org/wiki/List_of_text_editors)). Among the most popular are [Vim](https://en.wikipedia.org/wiki/Vim_(text_editor)) and [Emacs](https://en.wikipedia.org/wiki/Emacs) as well as [Notepad++](https://en.wikipedia.org/wiki/Notepad%2B%2B), [Atom](https://atom.io/), [Sublime Text](https://en.wikipedia.org/wiki/Sublime_Text), [gedit](https://en.wikipedia.org/wiki/gedit), which are also available on other operating systems (“cross-platform”). These text editors come with [syntax highlighting](https://en.wikipedia.org/wiki/syntax_highlighting) and line numbers, which makes code easier to read at a glance, and to spot syntax errors. Many text editors have features for increasing your coding speed, such as keystroke macros and code snippets, that you can take advantage of as you gain skill as a programmer.

### Some other popular IDEs/compilers include:

|Name|Website|Platform|License|
|----|----|----|----|
[Eclipse CDT](https://en.wikipedia.org/wiki/Eclipse_(software) "w:Eclipse (software)")|[Eclipse](https://www.eclipse.org/downloads/packages/all)|Windows, Mac OS X, GNU/Linux|Free/Libre and Open Source
[Netbeans](https://en.wikipedia.org/wiki/Netbeans "w:Netbeans")|[Netbeans](https://netbeans.org)|Cross-platform|[CDDL](https://en.wikipedia.org/wiki/Common_Development_and_Distribution_License "w:Common Development and Distribution License") and [GPL](https://en.wikipedia.org/wiki/GNU_General_Public_License "w:GNU General Public License")
[GNOME Builder](https://en.wikipedia.org/wiki/GNOME_Builder "w:GNOME Builder")|[Builder](https://wiki.gnome.org/Apps/Builder)|GNU/Linux|[GPL](https://en.wikipedia.org/wiki/GNU_General_Public_License "w:GNU General Public License")
[Anjuta](https://en.wikipedia.org/wiki/Anjuta "w:Anjuta")|[Anjuta](http://anjuta.org)|GNU/Linux|[GPL](https://en.wikipedia.org/wiki/GNU_General_Public_License "w:GNU General Public License")
[Geany](https://en.wikipedia.org/wiki/Geany "w:Geany")|[geany](http://www.geany.org)|Cross-platform|[GPL](https://en.wikipedia.org/wiki/GNU_General_Public_License "w:GNU General Public License")
[KDevelop](https://en.wikipedia.org/wiki/KDevelop "w:KDevelop")|[KDevelop](https://www.kdevelop.org/)|Cross-platform|[GPL](https://en.wikipedia.org/wiki/GNU_General_Public_License "w:GNU General Public License")
[Little C Compiler (LCC)](https://en.wikipedia.org/wiki/LCC_(compiler) "w:LCC (compiler)")|[lcc](https://www.cs.virginia.edu/\lcc-win32)|Windows|Open Source but not Libre
[Pelles C](https://en.wikipedia.org/wiki/Pelles_C "w:Pelles C")|[Pelles C](http://smorgasbordet.com/pellesc)|Windows, Pocket PC|Proprietary, free of charge
[Dev-C++](https://en.wikipedia.org/wiki/Dev-C%2B%2B "w:Dev-C++")|[Dev C++](https://sourceforge.net/projects/orwelldevcpp/)|Windows|[GPL](https://en.wikipedia.org/wiki/GNU_General_Public_License "w:GNU General Public License")
[CodeLite](https://en.wikipedia.org/wiki/CodeLite "w:CodeLite")|[CodeLite](https://codelite.org/)|Cross-platform|[GPL](https://en.wikipedia.org/wiki/GNU_General_Public_License "w:GNU General Public License")
[Code::Blocks](https://en.wikipedia.org/wiki/Code::Blocks "w:Code::Blocks")|[Code::Blocks](http://codeblocks.org/)|Cross-platform|[GPL](https://en.wikipedia.org/wiki/GNU_General_Public_License "w:GNU General Public License")




The next program uses the formula `C=(5/9)(F-32)` to print the following table of Fahrenheit temperatures and their centigrade or Celsius equivalents:

```c
 #include <stdio.h>

 /* print Fahrenheit-Celsius table
 for fahr = 0, 20, ..., 300 */

 int main()
 {
     int f, c;
     int lower, upper, step;
     lower = 0;  /* lower limit of temperature scale */
     upper = 300;    /* upper limit */
     step = 20;  /* step size */
     f = lower;
     while (f <= upper) {
         c = 5 * (f - 32) / 9;
         printf("%dt%dn", f, c);
         f = f + step;
     }
 }



* * *

OUTPUT

0	-17
20	-6
40	4
60	15
80	26
100	37
120	48
140	60
160	71
180	82
200	93
220	104
240	115
260	126
280	137
300	148
*** Exited normally ***
```






Program to simulate different logic gates and to contruct a new gate FIN_GATE using the given truth table condition:

```c
 #include <stdio.h>

 int AND(int a, int b)
 {
     if(a == 1 && b ==1)
         return 1;
     else return 0;
 }

 int OR(int a, int b)
 {
     if(a == 1 || b ==1)
         return 1;
     else return 0;
 }

 int NOT(int a)
 {
     if(a == 1)
         return 0;
     else
         return 1;
 }

 int NAND(int a, int b)
 {
     return(NOT(OR(a, b)));
 }

 int NOR(int a, int b)
 {
     return(NOT(AND(a, b)));
 }

 int FIN_GATE(int a, int b)
 {
     if(NOR(a, b) == NAND(a, b))
         return 1;
     return 0;
 }

 int main()
 {
     printf("%s\t%s\t%s\n%d\t%d\t%d\n%d\t%d\t%d\n%d\t%d\t%d\n%d\t%d\t%d", "A", "B", "Output", 0, 0, FIN_GATE(0,0), 0, 1, FIN_GATE(0,1), 1, 0, FIN_GATE(1,0), 1, 1, FIN_GATE(1,1));
 }



* * *

OUTPUT

A	B	Output
0	0	1
0	1	0
1	0	0
1	1	1
*** Exited normally ***


* * *
```