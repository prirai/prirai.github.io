---
layout: layouts/plain.njk
title: C program without main function
description: In this tutorial we will create a program in C with no main function.
summary: In this tutorial we will create a program in C with no main function.
tags:
  - c
  - coding
date: 2022-08-23
---

This tutorial will show you how to create a C program without main function.

## Problem description

We want to create a C program with no main function.

## Problem Solution

1. Design a macro to obfuscate the main function.
2. Define the function being used and call the macro which then append the word main by token pasting.


## Using a macro that defines main 

### Program/Source Code

```c
#include <stdio.h>

#define pseudo main

int pseudo(void)
{
    printf("Hello World\n");
    return 0;
}
```

### Explanation

A macro is defined which is called pseudo. The pseudo macro is then used to define the main function. The pseudo macro is then called which works as the main function.

### Output

```
./without-main
Hello World
```

## Using token pasting

### Program/Source Code

```c
#include <stdio.h>

#define pseudo m##a##i##n

int pseudo(void)
{
    printf("Hello World\n");
    return 0;
}
```

### Explanation

A macro is defined which appends the work main using token pasting in contrast to the previous example where we directly included the word main. The pseudo macro is then called which works as the main function.

### Output

```
./without-main
Hello World
```

## By obfuscation using token pasting

### Program/Source code

```c
#include <stdio.h>
#define pseudo(a, b, c, d, e, f) f##c##a##d
#define nomain pseudo(i, b, a , n, l, m)

int nomain(void)
{
    printf("Hello World\n");
    return 0;
}
```

### Explanation

This program actually runs main but with a disguise. This is acheived by replacing the main function with a macro. The macro here is `pseudo`. The macro is defined as follows:

```c
#define pseudo(a, b, c, d, e, f) f##c##a##d
#define nomain pseudo(i, b, a , n, l, m)
```

In the first line it tells the compiler to do token pasting. The tokens order is defined as `f##c##a##d`. Thus, in the next line, when the nomain function is defined as `pseudo(i, b, a , n, l, m)`, the compiler expands the argument such that the 6th argument is taken first, third argument is taken second, first argument is taken third and finally comes the fourth argument. Therefore the macro decodes the argument to `main`.

So, the argument simplifies to `#define nomain main`.


### Output

```
./without-main
Hello World
```

## Conclusion

No C program can work without main function. There has to be some way to disguise the main function as we did here by defining a macro function which then decodes itself to the word `main`.
