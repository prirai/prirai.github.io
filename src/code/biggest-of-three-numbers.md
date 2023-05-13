---
layout: layouts/plain.njk
title: Biggest of three numbers in C
description: In this tutorial we will create a program in C which will find the biggest of three numbers.
summary: In this tutorial we will create a program in C which will find the biggest of three numbers.
tags:
  - c
  - coding
date: 2022-08-07
---

This is a C program to find the biggest of three numbers.

## Algorithm

1. Ask the user to enter three numbers and store them in variables.
2. Find the biggest number and print it.

## Problem description

Given three numbers, this program will find the biggest number.

## Examples
```
Input: 1, 2, 3
Output: 3

Input: 17, 44, 36
Output: 44
```
## If approach

Calculate the biggest of three numbers using `if` statement.

### Program/Source code

```c
#include <stdio.h>

int main()
{
    int a, b, c;
    printf("Enter three numbers: \na: ");
    scanf("%d", &a);
    printf("b: ");
    scanf("%d", &b);
    printf("c: ");
    scanf("%d", &c);
    if (a > b && a > c)
        printf("%d", a);
    if (b > a && b > c)
        printf("%d", b);
    if (c > a && c > b)
        printf("%d", c);
    return 0;
}
```

### Explanation

The program first starts from checking whether `a` is the biggest number and proceeds to check for `b` and `c`.

### Output

```
./biggest_three_nums
Enter three numbers:
a: 47
b: 36
c: 36
a (47) is the biggest number.
```

## If-else approach

Calculate the biggest of three numbers using simple `if-else` statement.

### Program/Source code

```c
#include <stdio.h>

int main(void) {
    int a, b, c;
    printf("Enter three numbers: \na: ");
    scanf("%d", &a);
    printf("b: ");
    scanf("%d", &b);
    printf("c: ");
    scanf("%d", &c);
    if (a > b) {
        if (a > c) {
            printf("%d", a);
        } else {
            printf("%d", c);
        }
    } else {
        if (b > c) {
            printf("%d", b);
        } else {
            printf("%d", c);
        }
    }
    return 0;
}
```

### Explanation

The program will check if a is greater than b. If it is, it will check if a is greater than c. If it is, it will print a. Otherwise, it will print c.

### Output

```
> ./biggest_three_nums      
Enter three numbers: 
a: 34
b: 54
c: 65
c (65) is the biggest of all three numbers.

> ./biggest_three_nums
Enter three numbers:
a: 1
b: 2
c: 3
c (3) is the biggest of all three numbers.
```


## Ternary approach

In this approach, we will use ternary operator to find the biggest number.

### Program/Source code

```c
#include <stdio.h>

int main(void) {
    int a, b, c;
    printf("Enter three numbers: \na: ");
    scanf("%d", &a);
    printf("b: ");
    scanf("%d", &b);
    printf("c: ");
    scanf("%d", &c);
    printf("%d", a > b ? (a > c ? a : c) : (b > c ? b : c));
    return 0;
}
```

### Explanation

Ternary operator : 
    
The general form of ternary operator is :
(condition) ? (if true) : (if false)

Therefore in the above program, it signifies that if a is greater than b, then return a if a is greater than c, otherwise return c.

### Output

```
> ./biggest_three_nums
Enter three numbers:
a: 1
b: 9
c: 37
37
```

## Approach using functions

Calculate the biggest of three numbers using functions.

### Program/Source code

```c
#include <stdio.h>

int biggest(int a, int b) {
    if (a > b)
        return a;
    return b;
}

int main(void) {
    int a, b, c;
    printf("Enter three numbers: \na: ");
    scanf("%d", &a);
    printf("b: ");
    scanf("%d", &b);
    printf("c: ");
    scanf("%d", &c);
    printf("%d is the biggest of all three numbers.\n", biggest(biggest(a, b), c));
    return 0;
}
```

### Functions used

- `biggest(int, int)`: This function will find the biggest of two numbers.

### Explanation

The program will check if a is greater than b. If it is, it will check if a is greater than c. If it is, it will print a. Otherwise, it will print c.

### Output

```
> ./biggest_three_nums_func 
Enter three numbers: 
a: 99
b: 132
c: 88
132 is the biggest of all three numbers.

> ./biggest_three_nums_func
Enter three numbers: 
a: 29320
b: 41332
c: 42393
42393 is the biggest of all three numbers.
```
