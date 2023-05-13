---
layout: layouts/plain.njk
title: Reverse number using for loop
description: In this tutorial we will create a program in C that will ask for a number and then reverse it using for loop.
summary: In this tutorial we will create a program in C that will ask for a number and then reverse it using for loop.
tags:
  - c
  - coding
date: 2022-07-26
---

# C program to reverse a number using for loop

This is a C program that will find the reverse of a number provided by user using for loop.

## Algorithm

Ask for the number as user input. In thus case, as we are using for loop, it is essential to know the size of the number beforehand. Therefore we should make use of the log10 function to find the size of the number.

## Problem description

Given a number, find the reverse of the number using for loop.

### Methods used

* `long reverse(long)` - This function will reverse the number.

### Approach

1. Take the number as input. 
2. Store the number in a variable. 
3. Find the size of the number using log10() function. 
4. Inside for loop, take the number and divide it by 10 and store the remainder in a variable. 
5. Add the remainder to the sum where sum multiplies its previous value by 10. 
6. Repeat the process until the number is not 0 until the loop ends. 
7. Return the sum.

### Examples

Input: 98353
Output: 35398

### Program/Source code

```c
/* C program to reverse a number using for loop */
#include <stdio.h>
#include <math.h>

long reverse(long num)
{
	long reverse = 0;
	long temp;
	long remainder;
	long size = log10(num);
	for (int i = 0; i <= size; i++) {
		temp = num;
		remainder = temp % 10;
		reverse = reverse * 10 + remainder;
		num = num / 10;
	}
	return reverse;
}

int main(void)
{
	long num;
	printf("Enter the number\n");
	scanf("%ld", &num);
	printf("The reverse of the number is %ld\n", reverse(num));
	return 0;
}
```

Compiled with gcc 12.1.0 :

```
gcc num-reverse-for.c -o num-reverse-for -lm 
```
Note that here `-lm` is necessary to include math library otherwise the `ld` linker will not find the `log10()` function.

### Explanation

The program begins with asking the user for a number. The number is stored in a variable `num` and then passed to the function `reverse()`. 

In `reverse()` function, we find the log of the number which is the size of the number and then iterate through the for loop from zero to size and use the basic division algorithm to find the reverse of the number.

### Time complexity

The time complexity of the program is O(n).

### Space Complexity

The space complexity of the program is O(1) since we are not using any extra space.

### Output

```
> ./num-reverse-for 
Enter the number
24981
The reverse of the number is 18942

> ./num-reverse-for
Enter the number
172398
The reverse of the number is 893271
```
