---
layout: layouts/plain.njk
title: Floyd's Triangle in C
description: In this tutorial we will create a program in C which will ask the user to enter the number of rows and will return a floyd's triangle for the same height.
summary: In this tutorial we will create a program in C that will ask the user to enter the number of rows and will return a floyd's triangle for the same height.
tags:
  - c
  - coding
date: 2022-07-30
---

This C program will ask the user to enter the number of rows and will return a floyd's triangle for the same height.

# Floyd's Triangle

A Floyd's triangle is a triangle in which each number is the sum of the two numbers above it. For example, the first row of the Floyd's triangle is 1, the second row is 2 + 1 = 3, the third row is 4 + 5 = 9, and so on. The following is a diagram of the Floyd's triangle:

    1
   2 3
  4 5 6
 7 8 9 10

## Algorithm

1. Take the number of rows as input.
2. Store the number of rows in a variable.
3. Create a for loop to loop through the number of rows.
4. Print the elements for every row.

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

To approach this problem, we'll use a for loop to loop through the number of rows and print the elements for every row by incrementing the number of rows by 1.

### Methods used


### Approach

1. Take the number of rows as input.
2. Store the number of rows in a variable.
3. Create a for loop to loop through the number of rows.
4. Print the elements for every row.

### Program/Source code

```c

/* Program to print the floyd's triangle */

#include <stdio.h>

void floyds_triangle(int rows)
{
	int i, j, k = 1;

	for (i = 1; i <= rows; i++) {
		for (j = 1; j <= i; j++) {
			printf("%4.d ", k ++);
		}
		printf("\n");
	}
}

int main(void)
{
	int rows;

	printf("Enter the number of rows: ");
	scanf("%d", &rows);

	floyds_triangle(rows);

	return 0;
}

```
### Explanation

The program will ask the user to enter the number of rows and will return a floyd's triangle for the same height. The program will print the elements for every row by incrementing the number of rows by 1.

### Time complexity

The time complexity of this program is O(n).

### Space Complexity

The space complexity of this program is O(1).

### Output

```
> ./floyds_triangle      
Enter the number of rows: 5
   1 
   2    3 
   4    5    6 
   7    8    9   10 
  11   12   13   14   15 

  > ./floyds_triangle
Enter the number of rows: 12
   1 
   2    3 
   4    5    6 
   7    8    9   10 
  11   12   13   14   15 
  16   17   18   19   20   21 
  22   23   24   25   26   27   28 
  29   30   31   32   33   34   35   36 
  37   38   39   40   41   42   43   44   45 
  46   47   48   49   50   51   52   53   54   55 
  56   57   58   59   60   61   62   63   64   65   66 
  67   68   69   70   71   72   73   74   75   76   77   78 
  ```
