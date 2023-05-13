---
layout: layouts/plain.njk
title: Diamond Pattern in C
description: In this tutorial we will create a program in C which will print a diamond pattern upon receiving number of rows as input.
summary: In this tutorial we will create a program in C which will print a diamond pattern upon receiving number of rows as input.
tags:
  - c
  - coding
date: 2022-08-02
---

This C program will print a diamond pattern upon receiving number of rows as input.

## Algorithm

1. Take number of rows as input.
2. Store the number in a variable.
3. Inside a loop, print the spaces and then the asterisks.
5. Repeat the process until the number is equal to 0.

## Problem description

This program will print a diamond pattern upon receiving number of rows as input.

## Examples

```
Input: 5
Output:
    *
   ***
  *****
 *******
*********
 *******
  *****
   ***
    *
```

```
Input: 3
Output:
  *
 ***
*****
 ***
  *
```

## Naive Approach

Use a for loop to print the spaces and then the asterisks.

### Approach

1. Take the number of rows as input.
2. Inside a for loop, print the spaces and then the asterisks.
3. Repeat the process until all the rows are printed.

### Program/Source code

```c

/* Program to print a diamond pattern using for loop */
#include <stdio.h>

int main(void)
{
    int i, number;
    printf("Enter the number: ");
    scanf("%d", &number);
    for (i = 1; i <= number; i++) {
        int j;
        for (j = 1; j <= number - i; j++)
            printf(" ");
        for (j = 1; j <= 2 * i - 1; j++)
            printf("*");
        printf("\n");
    }
    for (i = number - 1; i >= 1; i--) {
        int j;
        for (j = 1; j <= number - i; j++)
            printf(" ");
        for (j = 1; j <= 2 * i - 1; j++)
            printf("*");
        printf("\n");
    }
    return 0;
}
```
### Explanation

The program begins with asking the user to enter the number of rows. Inside a for loop there are two for loops for spaces and asterisks respectively which are decreased and increased respectively as the loop progresses to print the initial increasing diamond pattern.

For the decreasing part, the spaces are increased while the asterisks are decreased with every progress of the loop.

### Time complexity

The time complexity of this program is O(n^2).

### Space Complexity

The space complexity of this program is O(1).

### Output

```
> ./diamond-pattern0
Enter the number: 12
           *
          ***
         *****
        *******
       *********
      ***********
     *************
    ***************
   *****************
  *******************
 *********************
***********************
 *********************
  *******************
   *****************
    ***************
     *************
      ***********
       *********
        *******
         *****
          ***
           *

> ./diamond-pattern0
Enter the number: 8
       *
      ***
     *****
    *******
   *********
  ***********
 *************
***************
 *************
  ***********
   *********
    *******
     *****
      ***
       *
```

## While loop approach

In this approach, we will use a while loop to print the spaces and then the asterisks and also make a separate function for printing the diamond pattern.

### Methods used

* `int diamondPattern(int)` - This function will print the diamond pattern.

### Approach

1. Take the number of rows as input.
2. Pass it to the function `diamondPattern` which will print the diamond pattern.
3. Repeat the process until all the rows are printed.

### Program/Source code

```c
# include <stdio.h>

/* Function to print the diamond pattern using while loop */

void diamondPattern(int num)
{
    int str = 1;
	while(str <= num)
	{
		int i = 1;
		while(i ++ <= (num - str) * 2 + 1)
			printf(" ");
		i = 0;
		while(i ++ < 2 * str - 1)
			printf("* ");
		str ++;
		printf("\n");
	}
	str = num - 1;
	while(str != 0)
	{
		int i = 1;
		while(i ++ <= (num - str) * 2 + 1)
			printf(" ");
		i = 0;
		while(i ++ < 2 * str - 1)
			printf("* ");
		str --;
		printf("\n");
	}
}

int main(void)
{
    int number;
    printf("Enter the number: ");
    scanf("%d", &number);
    diamondPattern(number);
}
```

### Explanation

The program asks the user to enter the number of rows. The function `diamondPattern` prints the diamond pattern.

In the function `diamondPattern`, until the number of stars is less than equal to the argument a while loop executes which prints the spaces and stars according to the regular format. In another while loop, the process is the same but the loop termination condition is now when the stars are equal to zero. The spaces and stars are printed according to format.

### Time complexity

The time complexity for the above program is O(n^2).

### Space Complexity

The space complexity for the above program is O(1).

### Output

```
> ./diamond-pattern1
Enter the number: 6
           * 
         * * * 
       * * * * * 
     * * * * * * * 
   * * * * * * * * * 
 * * * * * * * * * * * 
   * * * * * * * * * 
     * * * * * * * 
       * * * * * 
         * * * 
           * 

> ./diamond-pattern1
Enter the number: 4
       * 
     * * * 
   * * * * * 
 * * * * * * * 
   * * * * * 
     * * * 
       * 
```

## Recursive approach

In this approach we use recursion to solve our problem along with a helping function to print multiple characters.

### Methods used

* `int printMul(char, int)` - Prints the specified character multiple times as specified by the argument.
* `int printDiamond(int)` - Prints the diamond pattern.

### Approach

1. Take the number of rows as input.
2. Pass it to the function `printDiamond` which will print the diamond pattern.
3. Print the spaces `a - 1` times and then the asterisks `2 * b + 1` times.
4. Give a line break and add the terminating condition here which will end the execution of the function again and return it upon a = 1.
5. Repeat step 3.
6. Give a line break.

### Program/Source code

```c
#include <stdio.h>

void printMul(char a, int n)
{
	for (int i = 0; i < n; i++)
		printf("%c ", a);
}

void printDiamond(int a, int b)
{
	printMul(' ', a - 1);
	printMul('*', 2 * b + 1);
	printf("\n");
	if (a == 1)
		return;
	printDiamond(a - 1, b + 1);
	printMul(' ', a - 1);
	printMul('*', 2 * b + 1);
	printf("\n");
}

int main(void)
{
	int num;
	printf("Enter the number of rows: ");
	scanf("%d", &num);
	printDiamond(num, 0);
}
```
### Explanation

The program starts with asking the user to enter the number of rows. The number is then passed to the function `printDiamond` which prints the diamond pattern.

In `printDiamond`, the function `printMul` is used to print the spaces and the asterisks.

In the `printDiamond` function, the number of spaces are a - 1 and the number of asterisks are 2 * b + 1. The terminating condition is when a = 1. The printing is done again here.

The function works like a stack, the second half of the first call of the function is executed at the last. Thus a nice diamond structure follows.
### Time complexity

The time complexity for the above program is O(n^2).

### Space Complexity

The space complexity for the above program is O(1).

### Output
```
> ./diamond-pattern-rec 
Enter the number of rows: 8
              * 
            * * * 
          * * * * * 
        * * * * * * * 
      * * * * * * * * * 
    * * * * * * * * * * * 
  * * * * * * * * * * * * * 
* * * * * * * * * * * * * * * 
  * * * * * * * * * * * * * 
    * * * * * * * * * * * 
      * * * * * * * * * 
        * * * * * * * 
          * * * * * 
            * * * 
              * 

> ./diamond-pattern-rec
Enter the number of rows: 5
        * 
      * * * 
    * * * * * 
  * * * * * * * 
* * * * * * * * * 
  * * * * * * * 
    * * * * * 
      * * * 
        * 
```
