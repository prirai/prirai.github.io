---
layout: layouts/post.njk
title: String Palindrome program in C
description: In this tutorial we will be creating a C program which can differentiate between whether the input string is a palindrome
summary: In this tutorial we will be creating a C program which can differentiate between whether the input string is a palindrome
tags: 
    - coding
    - c 
date: 2022-07-12
---

In this tutorial we will be creating a C program which can check whether the input string is a palindrome.

## Palindrome string

A palindrome string is one which is read the same backwards or forwards.

Eg. ada, c, malayalam, racecar, mom, etc.


## Problem Description
This program accepts a string and checks whether a given string is a palindrome.


## Naive approach

Making a copy of the user input character array and then comparing both.

### Program Source Code

The source of the program is as follows. Here we define the `main` function and subsequently we define the `isPalindromeStr(char [])` function which accepts the string, reverses it and then finally checked for equality with the original string.

```c
/*
 * C program to read a string and check if it's a 
 * palindrome. Display the result.
 */
#include <stdio.h>
#include <string.h>
#include <strings.h>

void isPalindromeStr(char str[], int len)
{
	char reverse_string[32] = { '\0' };
	for (int i = len - 1; i >= 0; i--) {
		reverse_string[len - i - 1] = str[i];
	}
	/* Compare the input string and its reverse. If both are equal
	 * then the input string is palindrome. */
	printf("%s reversed is %s therefore ", str, reverse_string);
	if (!strcasecmp(str, reverse_string))	// strcasecmp is defined in strings.h
		printf("%s is a palindrome. \n", str);
	else
		printf("%s is not a palindrome. \n", str);
}

int main(void)
{
	char str[32];

	puts("Enter a string : ");

	/* gets is depreciated in favor of fgets as fgets 
    * provides memory safety in terms of assigning the
    * variable with the maximum allowed size and from
    * the specified source, here stdin. */

	fgets(str, sizeof(str), stdin);
	strtok(str, "\n");
	int length = (int)strlen(str);
	isPalindromeStr(str, length);
	return 0;
}
```

### Program Explanation
1. Take the string as input and store it in a character array.
2. Pass the string into the `isPalindromeStr` function.
3. Make a copy of the original string and find its reverse.
4. If the reverse and the original string are the same ignoring case then it is a palindrome string otherwise it is not.

### Complexity Analysis

The Time complexity of the above code is O(n) while the space complexity is O(2n) = O(n).

## Optimized Approach

We do not create a copy of the character array but rather check for the array indices in order to decide whether the string is a palindrome.

### Program Source Code

The source of the program is as follows. Here we define the `main` function and subsequently we define the `isPalindromeStr(char [])` function which accepts the string, initializes two indices, compares at the two indices through the loop.

```c
/*
 * C program to read a string and check if it's a
 * palindrome. Display the result.
 */

#include <stdio.h>
#include <string.h>
#include <ctype.h>

void isPalindromeStr(char str[])
{
	/* We define two (not literal) pointers which will act as indices for the character at the beginning and at the end. Over the course of this program, pt1 will increase and vice versa until they become equal or in other words, reach the mid. */
	int pt1 = 0;
	int pt2 = (int)strlen(str) - 1;

	while (pt2 > pt1) {
		if (tolower(str[pt1++]) != tolower(str[pt2--]))	// Even if this condition fails only once, the inner code gets executed and the control goes back to the main function.
		{
			printf("%s is not a palindrome.\n", str);
			return;
		}
	}
	printf("%s is a palindrome.\n", str);
}

int main(void)
{
	char str[32];
    puts("Enter a string : ");
	/* gets is depreciated in favor of fgets as fgets
	 * provides memory safety in terms of assigning the
	 * variable with the maximum allowed size and from
	 * the specified source, here stdin. */

	fgets(str, sizeof(str), stdin);
	strtok(str, "\n");
	isPalindromeStr(str);
	return 0;
}
```

### Program Explanation
1. Take the string as input and store it in a character array.
2. Pass the string into the `isPalindromeStr` function.
3. Define index pointers (not literal) pt1 and pt2.
4. Over the course of this program, pt1 will increase and vice versa until they become equal or in other words, reach the mid.
5. Check whether the characters at indices pt1 and pt2 are unequal for every iteration of the loop and if they are unequal, print not palindrome and return to the main function.

### Complexity Analysis

The Time complexity of the above code is O(n) while the space complexity is also O(n).

## Recursive Approach

We do not create a copy of the character array but rather check for the array indices in order to decide whether the string is a palindrome by passing the two indices at every call. For optimization, we've defined the character array as a global variable so that it doesn't make its several copies throughout the course of the recursion.

### Program Source Code

The source of the program is as follows. Here we define the `main` function and subsequently we define the `isPalindromeStr(int, int)` function which accepts the two indices, compares at the two indices and then subsequently sends them to isPalindromeStr.

```c
/*
 * C program to read a string and check if it's a
 * palindrome. Display the result.
 */

#include <stdio.h>
#include <string.h>
#include <ctype.h>

char str[32];

void isPalindromeStr(int pt1, int pt2)
{
	if (pt2 <= pt1) {
		printf("%s is a palindrome.\n", str);
		return;
	} else if (tolower(str[pt1]) != tolower(str[pt2]))	// Even if this condition fails only once, the inner code gets executed and the control goes back to the main function.
	{
		printf("%s is not a palindrome.\n", str);
		return;
	}
	isPalindromeStr(pt1 + 1, pt2 - 1);
}

int main(void)
{
	puts("Enter a string : ");
	/* gets is depreciated in favor of fgets as fgets
	 * provides memory safety in terms of assigning the
	 * variable with the maximum allowed size and from
	 * the specified source, here stdin. */

	fgets(str, sizeof(str), stdin);
	strtok(str, "\n");
	isPalindromeStr(0, (int) strlen(str) - 1);
	return 0;
}
```

### Program Explanation
1. Take the string as input and store it in a character array.
2. Pass the indices, 0 and strlen(str) - 1 into the `isPalindromeStr` function.
3. Over the course of this program, pt1 will increase and vice versa until they become equal or in other words, reach the mid.
4. Check whether the characters at indices pt1 and pt2 are unequal for every recursion and if they are unequal, print not palindrome and return to the main function.

### Complexity Analysis

The Time complexity of the above code is O(n) while the space complexity is O(n^2).

## Runtime Test Cases
 
```bash
Enter a string : 
aba
aba reversed is aba therefore aba is a palindrome.

Enter a string : 
Malayalam
Malayalam reversed is malayalaM therefore Malayalam is a palindrome.

Enter a string : 
India
India reversed is aidnI therefore India is not a palindrome.
```
