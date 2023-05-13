---
layout: layouts/plain.njk
title: Floyd's Triangle in C using recursion
description: In this tutorial we will create a program in C which will ask the user to enter the number of rows and will return a floyd's triangle for the same height using recursion.
summary: In this tutorial we will create a program in C that will ask the user to enter the number of rows and will return a floyd's triangle for the same height using recursion.
tags:
  - c
  - coding
date: 2022-07-31
---

This C program will ask the user to enter the number of rows and will recursively return a floyd's triangle for the same height.

# Floyd's Triangle

A Floyd's triangle is a triangle in which each number is the sum of the two numbers above it. For example, the first row of the Floyd's triangle is 1, the second row is 2 + 1 = 3, the third row is 4 + 5 = 9, and so on. The following is a diagram of the Floyd's triangle:

    1
   2 3
  4 5 6
 7 8 9 10

## Algorithm

1. Take the number of rows as input.
2. Store the number of rows in a variable.
3. Create a recursive function for printing the floyd's triangle.

## Problem description

Given the number of rows, this program will return a floyd's triangle for the same height.

## Examples

Input : 3
Output :
1
2 3
4 5 6

Input : 5
Output :
1
2 3
4 5 6
7 8 9 10
11 12 13 14 15

## Problem Solution

To approach this problem, we'll use a recursive function.

### Methods used

* `void floydTriangleRecursive(int, int)` - This function will print the floyd's triangle for the given number of rows. The parameters are the number of rows and the curent row index.

### Approach

1. Take the number of rows as input.
2. Store the number of rows in a variable.
3. Create a recursive function for printing the floyd's triangle.

### Program/Source code

```c

/* Program to print the floyd's triangle using a recursive function */

#include <stdio.h>

void floydTriangleRecursive(int a, int b)
{
    if (a == b)
        return;
    for (int j = b * (b + 1) / 2 + 1; j <= (b + 1) * (b + 2) / 2; j ++)
        printf("%4.d", j);
    printf("\n");
    return floydTriangleRecursive(a, b + 1);
}

int main(void)
{
    int n;
    printf("Enter the number of rows: ");
    scanf("%d", &n);
    floydTriangleRecursive(n, 0);
    return 0;
}

```

### Explanation

The program will ask the user to enter the number of rows and will return a floyd's triangle for the same height.

The recursive function accepts two parameters namely, the total rows and the current row. The starting element of the current row would then be the sum of elements of the previous rows. The ending element would similarly be just less than the sum of elements of all the rows upto the current row.

### Time complexity

The time complexity of the recursive function is O(n).

### Space Complexity

The space complexity of the recursive function is O(1).

### Output

```
> ./floyds_triangle_recursive     
Enter the number of rows: 4
   1
   2   3
   4   5   6
   7   8   9  10

> ./floyds_triangle_recursive
Enter the number of rows: 10
   1
   2   3
   4   5   6
   7   8   9  10
  11  12  13  14  15
  16  17  18  19  20  21
  22  23  24  25  26  27  28
  29  30  31  32  33  34  35  36
  37  38  39  40  41  42  43  44  45
  46  47  48  49  50  51  52  53  54  55
```
