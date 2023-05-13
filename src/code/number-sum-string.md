---
layout: layouts/plain.njk
title: Sum of digits as string
description: In this tutorial we will create a program in C that will find the sum of digits of a number taken as a string.
summary: In this tutorial we will create a program in C that will find the sum of digits of a number taken as a string.
tags:
  - c
  - coding
date: 2022-07-27
---

# C program to find sum of digits of a number taken as a string

This C program will find the sum of digits of a number taken as a string.

## Algorithm

1. We begin with asking the user to enter the string (here a number which we'll accept as a string).
2. Then we extract every character from the string and while finding its value as a digit, we add it to the sum.
3. We return the sum.

## Problem description

Given a string, find the sum of digits of the string.

### Methods used

* `int sum(char*)` - This function will find the sum of digits of the string.

### Approach

1. Take the string as input.
2. Store the string in a variable.
3. Inside for loop, take the string and extract every character and while finding its value as a digit, add it to the sum.
4. If the character is not a digit, then we ignore it.
5. If the character is a digit, then we add it to the sum.
6. Return the sum.
7. Print the sum.

### Examples

Input: 82346y8d83
Output: 32

Input: de29382h
Output: 24

Input: 32378
Output: 23

### Program/Source code

```c
/* C program to find sum of digits of a number taken as a string */

#include <stdio.h>
#include <string.h>

int sum(char *str)
{
    int sum = 0;
    size_t i;
    size_t l = strlen(str);
    for (i = 0; i < l; i++) {
        if (str[i] >= '0' && str[i] <= '9') {
            sum = sum + (str[i] - '0');
        }
    }
    return sum;
}

int main(void)
{
    char str[100];
    printf("Enter the string: ");
    scanf("%s", str);
    printf("The sum of digits of numbers in the string is: %d", sum(str));
    return 0;
}
```

### Explanation

The program begins with asking the user to enter the string. The string is stored in a variable `str` and then passed to the function `sum()`. 

In the function `sum()`, we begin with initializing the variable `sum` to 0. Then we extract every character from the string and while finding its value as a digit, we add it to the sum. If the character is not a digit, then we ignore it. If the character is a digit, then we add it to the sum and finally we return the sum.

### Output

```
> ./sum-of-dig-str 
Enter the string: 371638
The sum of digits of the string is: 28

> ./sum-of-dig-str
Enter the string: 98317hsxiwq98
The sum of digits of the string is: 45
```
