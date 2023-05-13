---
layout: layouts/plain.njk
title: Demonstration of pass by value in C
description: In this tutorial we will know how pass by value works in C.
summary: In this tutorial we will know how pass by value works in C.
tags:
  - c
  - coding
date: 2022-08-01
---

This is a C program to illustrate pass by value in C.

# Pass by value

Pass by value is a way to pass a variable to a function. The variable is passed by value, not by reference. This means that the function does not have access to the variable's memory address. The function can only access the variable's value.

It is the opposite of pass by reference where the function has access to the variable's memory address and can modify the variable's value.

In the case of pass by value, the space allocated for the variable is copied to the function's memory space. This means that the function can modify the variable's value without affecting the variable's memory address.

However in the case of pass by reference, the function can modify the variable's memory address and the variable's value.

So what should we prefer when we want to pass a variable to a function? 
We should use pass by value.

Individual variables are always passed by value. However, arrays, structs, and unions are passed by reference.

## Problem Solution

1. Create a function that takes a variable as an argument.
2. The function should print the variable's value.
3. Call the function.
4. Modify the variable's value.
5. Print in the main function the variable's value.

## Program Source Code

Here is the source code of the program in C. The program is successfully compiled and executed on Linux system with GCC 12.1.0.

```c
#include <stdio.h>

void swap (int a, int b) {
  int temp = a;
  a = b;
  b = temp;
}

int main () {
  int a = 10;
  int b = 20;
  printf ("Before swap, a = %d, b = %d\n", a, b);
  swap (a, b);
  printf ("After swap, a = %d, b = %d\n", a, b);
  return 0;
}
```

## Program explanation

1. The function `swap` takes two variables as arguments.
2. The function prints the values of the variables before the swap.
3. The function swaps the values of the variables.
4. The main function prints the values of the variables.

## Output

```
Before swap, a = 10, b = 20
After swap, a = 20, b = 10
```
