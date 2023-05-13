---
layout: layouts/post.njk
title: Swap two numbers in C
description: In this tutorial we will be creating a C program which will swap the values inside two variables taken as user input
summary: In this tutorial we will be creating a C program which will swap the values inside two variables
tags: 
    - coding
    - c 
date: 2022-07-18
---

In this tutorial we will be creating a C program which will swap the values inside two variables taken as user input

## Problem Description

This program will prompt user to input two integers & swap their values.

## The naive approach

### Algorithm

1. Prompt the user to input two integers
2. Pass their addresses to a function, here we call it swap and we don't need to return anything from it as by swapping the addresses, the values in the variables also get changed.
3. Use an another temporary variable to help in swapping (note: We'll be removing this extra variable later but lets see how we do this the naive way).
4. In the main function, print the values to show that yes, the values have definitely changed and then exit.

### Examples

* If m and n are 4.36 and 8.12 respectively, inside the swap function, the temp will store 4.36, ptr1 will store 8.12 and now the pt2 which is 8.12 will store temp and become 4.36. Hence the values are swapped.
* If m and n are 202 and 333 respectively, inside the swap function, the temp will store 202, ptr1 will store 333 and now the pt2 which is 333 will store temp and become 202. Hence the values are swapped.
  
### Program/Source Code

Here is source code of the C program will swap the values inside two variables taken as user input. The C program is successfully compiled and run on a Linux system. 
The program output is also shown below.

```c
/*
* C program to read two integers M and N and to swap their values.
* Use a user-defined function for swapping by accepting the addresses of the two variables. Output the values of M
* and N before and after swapping.
*/

#include <stdio.h>

/*  Function swap - to interchanges the contents of two items */

void swap(float *ptr1, float *ptr2)
{
	// Step 4. Create a temporary variable for storing the values
	float temp;
	temp = *ptr1;
	*ptr1 = *ptr2;
	*ptr2 = temp;
}

int main(void)
{
	float m, n;
	// Step 1. Take user input
	printf("Enter the value of M (accepted decimal values): ");
	scanf("%f", &m);
	printf("Enter the value of N (accepted decimal values): ");
	scanf("%f", &n);
	// Step 2. Show the values before passing their addresses to the function
	printf("Before swapping : M = %5.2f\tN = %5.2f\n", m, n);
	// Step 3. Pass the addresses to the function
	swap(&m, &n);
	// Step 5. Print the values after the swap function has executed
	printf("After swapping : M  = %5.2f\tN = %5.2f\n", m, n);
}
```

### Program Explanation

1. Take the two integers as input and store it in the variables m and n respectively.
2. Show the values before passing their addresses to the function.
3. Call function swap. Pass addresses of variables to the function swap.
4. Receive the addresses by the two pointers ptr1 and ptr2.
5. Create a temporary variable for storing the values.
6. First copy the address &m to the variable temp.
7. Copy the address at &n to &m.
8. Copy the address temp (which was &m previously) to &n.
9. Print the variables m and n as output after the swap function has executed and exit.

### Program Output

```bash
> ./swap1

Enter the value of M (accepted decimal values): 13
Enter the value of N (accepted decimal values): 12
Before swapping : M = 13.00	N = 12.00
After swapping : M  = 12.00	N = 13.00

> ./swap1
Enter the value of M (accepted decimal values): 4324.14311
Enter the value of N (accepted decimal values): 32331.5342
Before swapping : M = 4324.14	N = 32331.54
After swapping : M  = 32331.54	N = 4324.14
```

## The address swapping approach (aka no extra variable approach)

Swap two integers without using any temporary variable. We'll be using the trusted algebraic method of adding and subtracting to swap the numbers and get the desired result.

### Algorithm

1. Prompt the user to input two integers
2. Pass their addresses to a function, here we call it swap and we don't need to return anything from it as by swapping the addresses, the values in the variables also get changed.
3. Add the values and store the sum to one and their difference to another. This won't make sense now but see the program for more clarification and try it out yourself.
4. In the main function, print the values to show that yes, the values have definitely changed and then exit.

### Examples

* If m and n are 8.12 and 4.36 respectively, inside the swap function,  ptr1 will store 4.36 + 8.12 = 12.48 and now the pt2 which is 8.12 will store 12.48 - 4.36 = 8.12, finally ptr1 will store 12.48 - 8.12 = 4.36. Hence the values are swapped.
* If m and n are 8.12 and 4.36 respectively, inside the swap function,  ptr1 will store 4.36 + 8.12 = 12.48 and now the pt2 which is 8.12 will store 12.48 - 4.36 = 8.12, finally ptr1 will store 12.48 - 8.12 = 4.36. Hence the values are swapped.

### Program/Source Code

Here is source code of the C program will swap the values inside two variables taken as user input. The C program is successfully compiled and run on a Linux system. 
The program output is also shown below.

```c
/*
 * C Program to Swap two Integers without using Temporary Variables
 * and Bitwise Operations
 */
#include <stdio.h>

// function to swap the two numbers
void swap(float *ptr1, float *ptr2)
{
	// Step 4. As ptr1 gets the sum of both, in the next step obviously ptr2 gets the difference of the sum and ptr2 which is ptr1
	*ptr1 = *ptr1 + *ptr2;
	*ptr2 = *ptr1 - *ptr2;
	*ptr1 = *ptr1 - *ptr2;
}

int main(void)
{
	float m, n;
	// Step 1. Take user input
	printf("Enter the value of M (accepted decimal values): ");
	scanf("%f", &m);
	printf("Enter the value of N (accepted decimal values): ");
	scanf("%f", &n);
	// Step 2. Show the values before passing their addresses to the function
	printf("Before swapping : \t M = %5.2f\tN = %5.2f\n", m, n);
	// Step 3. Pass the addresses to the function
	swap(&m, &n);
	// Step 5. Print the values after the swap function has executed
	printf("After swapping : \t M  = %5.2f\tN = %5.2f\n", m, n);
}
```

### Program Explanation

1. Take the two integers as input and store it in the variables m and n respectively.
2. Show the values before passing their addresses to the function.
3. Call function swap. Pass addresses of variables to the function swap.
4. Receive the addresses by the two pointers ptr1 and ptr2.
5. Add ptr1 and ptr2 and store their result in ptr1.
6. Take the difference of ptr1 (ptr1 + ptr2) and ptr2, the difference is obviously ptr1, store it in ptr2.
7. Remeber that ptr1 is still the sum of original ptr1 and ptr2 so the difference between ptr1 and ptr2 will be ptr2 which gets stored in ptr1.
8. Print the variables m and n as output after the swap function has executed and exit.

### Program Output

```bash
> ./swap2              
Enter the value of M (accepted decimal values): 436.687
Enter the value of N (accepted decimal values): 76.98
Before swapping : 	M = 436.69	N = 76.98
After swapping : 	M  = 76.98	N = 436.69

> ./swap2
Enter the value of M (accepted decimal values): 34.4523
Enter the value of N (accepted decimal values): 213.0004
Before swapping : 	M = 34.45	N = 213.00
After swapping : 	M  = 213.00	N = 34.45
```


## Using the bitwise XOR operator

Swap two integers without using any temporary variable and using the XOR operator.

An XOR operator basically for a number of inputs, gives one/true only if the number of one's in the input is odd.

### Algorithm

1. Prompt the user to input two integers
2. Pass their addresses to a function, here we call it swap and we don't need to return anything from it as by swapping the addresses, the values in the variables also get changed.
3. Perform a series of bitwise XOR swapping
4. In the main function, print the values to show that yes, the values have definitely changed and then exit.

### Examples
Let's understand this using a simple example:

- Suppose the user enters m as 12 and n as 15.
- The values are then passed on to the `void swap(long, long)` function.
- Here, we need to take the binary representation of the numbers in account.
- So, 12 is 1100 and 15 is 1111.
- XOR on 12 and 15 gives 0011 = 3, stored in `ptr1`
- XOR on 3 and 15 gives 1100 = 12, stored in `ptr2`
- XOR on 3 and 12 gives 1111 = 15, stored in `ptr1`
- Thus the values get swapped by XOR, a nifty little tool for solving many problems really efficiently.
   
### Program/Source Code

Here is source code of the C program will swap the values inside two variables taken as user input. The C program is successfully compiled and run on a Linux system. 
The program output is also shown below.

```c
/*
* C program to read two integers M and N and to swap their values.
* Use a user-defined function for swapping by accepting the addresses of the two variables. Output the values of M
* and N before and after swapping.
*/

#include <stdio.h>

/*  Function swap - to interchanges the contents of two items */

void swap(long *ptr1, long *ptr2)
{
	// Step 4. Performing XOR operation on the values
	*ptr1 = *ptr1 ^ *ptr2;
	*ptr2 = *ptr1 ^ *ptr2;
	*ptr1 = *ptr1 ^ *ptr2;
}

int main(void)
{
	long m, n;
	// Step 1. Take user input
	printf("Enter the value of M (accepted decimal values): ");
	scanf("%ld", &m);
	printf("Enter the value of N (accepted decimal values): ");
	scanf("%ld", &n);
	// Step 2. Show the values before passing their addresses to the function
	printf("Before swapping : M = %5ld\tN = %5ld\n", m, n);
	// Step 3. Pass the addresses to the function
	swap(&m, &n);
	// Step 5. Print the values after the swap function has executed
	printf("After swapping : M  = %5ld\tN = %5ld\n", m, n);
}
```

### Program Explanation

1. Take the two integers as input and store it in the variables m and n respectively.
2. Show the values before passing their addresses to the function.
3. Call function swap. Pass addresses of variables to the function swap.
4. Receive the addresses by the two pointers ptr1 and ptr2.
5. Perform XOR operations.
6. Print the variables m and n as output after the swap function has executed and exit.

### Program Output

```bash
> ./swap3
Enter the value of M (accepted decimal values): 4234145445
Enter the value of N (accepted decimal values): 3241234534
Before swapping : M = 4234145445	N = 3241234534
After swapping : M  = 3241234534	N = 4234145445
```

## Time and Space complexity analysis

Time Complexity: O(1)

Auxiliary Space: O(1)

As there is no array or loops involved, the order remains 1 even then the code becomes more precise and uses less variables throughout the approaches.

## Easter egg

Wow! you hit an easter egg here. What does it bring for you? A sneaky trick to avoid most of the errors that might slip through even if your code compiles correctly. So, how do you do that? Well, it's simple, by using `gcc` compiler flags to find out every kinds of warning the code can contain.

The flags which I use are basically made so that I might know whether I have a variable defined and I somehow didn't use it later, Wall enables warnings, Wextra covers warnings not covered in the Wall option, Werror makes the compiler treat errors as warning cos why not and others, the uses of which can be easily found out on the web.

```bash
 gcc swap1.c -o swap1 -g -Wextra -Wall -Werror -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wcast-align -Wstrict-prototypes -Wstrict-overflow=5 -Wwrite-strings -Waggregate-return -Wcast-qual -Wswitch-enum -Wconversion -Wunreachable-code -fdiagnostics-color=always
```
