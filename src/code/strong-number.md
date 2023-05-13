---
layout: layouts/plain.njk
title: C program to check whether a number is strong or not
description: In this tutorial we will create a program in C which will check whether a number is strong or not.
summary: In this tutorial we will create a program in C which will check whether a number is strong or not.
tags:
  - c
  - coding
date: 2022-08-30
---

In this tutorial we will create a program in C which will check whether a number is strong or not.

# Strong number

A strong number is a number that is the sum of the factorial of its digits. See OEIS at [https://oeis.org/A014080](https://oeis.org/A014080) for more details.

# Example

```
input:
  - 145
output:
  - true
```

## Problem description

Given a number, check whether it is strong or not.


## Problem Solution

1. Ask the user to enter a number.
2. Extract the digits of the number and find the factorial of each digit.
3. Calculate the sum of the factorial of each digit.
4. If the sum is equal to the number, then print "true".
5. Else print "false".

## Naive Approach

In this approach, we will use a loop to extract the digits of the number and find the factorial of each digit.

### Approach

1. Ask the user to enter a number.
2. Extract the digits of the number and find the factorial of each digit using while loop.
3. Calculate the sum of the factorial of each digit.
4. If the sum is equal to the number, then print "true".
5. Else print "false".

### Program/Source code

```c
#include <stdio.h>

int factorial(int n)
{
    int i, fact = 1;
    for (i = 1; i <= n; i++)
    {
        fact = fact * i;
    }
    return fact;
}

int main(void)
{
    int n, sum = 0;
    printf("Enter the number: ");
    scanf("%d", &n);
    int i = n;
    while (i != 0)
    {
        sum = sum + factorial(i % 10);
        i = i / 10;
    }
    if (sum == n)
    {
        printf("true\n");
    }
    else
    {
        printf("false\n");
    }
}
```

### Methods used

- `int factorial(int n)`: This function will find the factorial of a number.

### Explanation

The program asks the user to enter a number. The digits of the number are extracted and the factorial of each digit is found. The sum of the factorial of each digit is calculated. If the sum is equal to the number, then "true" is printed. Otherwise "false" is printed.

### Time complexity

Time complexity of this program is O(n). Here n is the number of digits in the number. The factorial part is neglected as only a single digit is take every time so the number of steps will be very less than what we get from digit extraction.

### Space Complexity

Space complexity of this program is O(1). Here we are not using any extra space.

### Output

```
> ./strong-number      
Enter the number: 145
true

> ./strong-number
Enter the number: 120
false
```

## Print strong numbers from 1 to n

In this approach, we will print the strong numbers from 1 to n.

### Approach

1. Print the strong numbers from 1 to n.
2. Loop through the numbers from 1 to n.
3. Check whether the number is strong or not.
4. If the number is strong, then print it.

### Program/Source code

```c
#include <stdio.h>

long factorial(long n)
{
	long i, fact = 1;
	for (i = 1; i <= n; i++) {
		fact = fact * i;
	}
	return fact;
}

long isStrong(long n)
{
	long sum = 0;
	long i = n;
	while (i != 0) {
		sum = sum + factorial(i % 10);
		i = i / 10;
	}
	if (sum == n) {
		return 1;
	} else {
		return 0;
	}
}

void printStrong(long n)
{
	long i;
	for (i = 1; i <= n; i++) {
		if (isStrong(i) == 1) {
			printf("%ld\n", i);
		}
	}
}

int main(void)
{
	long n;
	printf("Enter the number: ");
	scanf("%ld", &n);
	printStrong(n);
}
```

### Methods used

- `long factorial(long n)`: This function will find the factorial of a number.
- `long isStrong(long n)`: This function will check whether the number is strong or not.
- `void printStrong(long n)`: This function will print the strong numbers from 1 to n.

### Explanation

The program asks the user to enter n where n is the maximum limit. The program will print the strong numbers from 1 to n. 

In the `printStrong` function, we will loop through the numbers from 1 to n. If the number is strong, then print it. The `printStrong` function in turn calls the `isStrong` function to check whether the number is strong or not. Inside the `isStrong` function, we will calculate the sum of the factorial of each digit. If the sum is equal to the number, then 1 is returned. Otherwise 0 is returned.

### Time complexity

Time complexity of this program is O(n). A for loop goes from 1 to n, inside which is checking for every number whether it's factorial is strong or not.

So if we consider the size of the range as n, the number of digits for every number as m and the factorial for every digit as f (ranging from 1 to 9), then the time complexity is O(n * m * f). But here as f is very limited in terms of values and m is also so long as the digit itself so n is the only factor which is considered. So the time complexity is O(n).

### Space Complexity

Space complexity of this program is O(1). Here we are not using any extra space.

### Output

```
> ./strong-number              
Enter the number: 50000
1
2
145
40585

> ./strong-number
Enter the number: 100
1
2
```

## Print strong numbers between two limits

In this approach, we will print the strong numbers between two limits.

### Approach

1. Ask the user to enter two limits.
2. Print the strong numbers between the limits.
3. Loop through the numbers between the limits.
4. Check whether the number is strong or not.
5. If the number is strong, then print it.

### Program/Source code

```c
#include <stdio.h>

long factorial(long n)
{
    long i, fact = 1;
    for (i = 1; i <= n; i++) {
        fact = fact * i;
    }
    return fact;
}

long isStrong(long n)
{
    long sum = 0;
    long i = n;
    while (i != 0) {
        sum = sum + factorial(i % 10);
        i = i / 10;
    }
    if (sum == n) {
        return 1;
    } else {
        return 0;
    }
}

void printStrong(long a, long b)
{
    long i;
    for (i = a; i <= b; i++) {
        if (isStrong(i) == 1) {
            printf("%ld\n", i);
        }
    }
}

int main(void)
{
    long a, b;
    printf("Enter the first limit: ");
    scanf("%ld", &a);
    printf("Enter the second limit: ");
    scanf("%ld", &b);
    if (a > b) {
        a ^= b;
        b ^= a;
        a ^= b;
    }
    printStrong(a, b);
}
```

### Methods used

- `long factorial(long n)`: This function will find the factorial of a number.
- `long isStrong(long n)`: This function will check whether the number is strong or not.
- `void printStrong(long a, long b)`: This function will print the strong numbers between the limits.

### Explanation

The program asks the user to enter two limits. After finding the minimum and maximum of the limits, the program will print the strong numbers between the limits by sending them to the `printStrong` function. The `printStrong` function in turn calls the `isStrong` function to check whether the number is strong or not. Inside the `isStrong` function, we will calculate the sum of the factorial of each digit. If the sum is equal to the number, then 1 is returned. Otherwise 0 is returned.

### Time complexity

Time complexity of this program is O(1). If we consider the size of the range as n, the number of digits for every number as m and the factorial for every digit as f (ranging from 1 to 9), then the time complexity is O(n * m * f). But here as f is very limited in terms of values and m is also so long as the digit itself so n is the only factor which is considered. So the time complexity is O(n). For an arbitrary large value of lower and upper limit with many digits, m can take larger value so the time complexity can be O(m). However, time complexity will be O(n) in most of the cases.

### Space Complexity

Space complexity of this program is O(1). Here we are not using any extra space.

### Output

```
> ./strong-number              
Enter the first limit: 1
Enter the second limit: 100000000
1
2
145
40585
```
