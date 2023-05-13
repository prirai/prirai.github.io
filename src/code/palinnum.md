---
layout: layouts/post.njk
title: Palindrome number program in C
description: In this tutorial we will be creating a C program which can differentiate between whether a given number is a palindrome
summary: In this tutorial we will be creating a C program which can differentiate between whether a given number is a palindrome
tags: 
    - coding
    - c 
date: 2022-07-12
---

In this tutorial we will be creating a C program which can check whether a given number is a palindrome.

## Palindrome number

A palindrome number is one which is read the same backwards or forwards.

Eg. 121, 1, 5, 1441, 73437, 99999, etc.

There can actually be a whole lot of them.

## Problem Description
This program accepts a number and checks whether a given number is a palindrome.

## Problem Solution
1. Take a number as input and store it.
2. Reverse the number and store it in another variable.
3. Compare both the numbers.

## Program Source Code

The source of the program is as follows. Here we define the `main` function and subsequently we define the `isPalindromeNum(int)` function which accepts the number, reverses it using the commonly used remainder and division operations inside a while loop which continues till the number is zero and the reverse of the original number is also generated simultaneously.

```c
/*
* C program which asks for a number and checks whether 
* the given number is a palindrome or not.
*/

#include <stdio.h>

void isPalindromeNum(int a)
{
	int copy = a;
	int rev = 0;
	int r = 0;
	/* This loops executes until the copy is not zero.
	 It proceeds by assigning the last digit to a variable
	 r, appending it behind the new variable rev. */
	while (copy != 0) {
		r = copy % 10;
		rev = rev * 10 + r;
		copy /= 10;
	}
	printf("%d reversed is %d therefore ", a, rev);
	/* Comparing the variable a and num for equality */
	if (a == rev)
		printf("%d is a palindrome number.", a);
	else
		printf("%d is not a palindrome number.", a);
}

int main(void)
{
	// Initialize an int variable. We'll use it to store the user input.
	int num = 0;
	puts("Enter a number : ");
	scanf("%d", &num);
	// Pass the number to the isPalindromeNum function
	isPalindromeNum(num);
}
```

## Program Explanation
1. Take the number as input and store it in an integer variable.
2. Pass the number into the `isPalindromeNum` function.
3. Make a copy of the original number and find its reverse.
4. If the reverse and the original number are the same then it is a palindrome number otherwise it is not.

## Runtime Test Cases
 
```bash
Enter a number : 
121
121 reversed is 121 therefore 121 is a palindrome number.

Enter a number : 
123
123 reversed is 321 therefore 123 is not a palindrome number.

Enter a number : 
1234321
1234321 reversed is 1234321 therefore 1234321 is a palindrome number.
```
