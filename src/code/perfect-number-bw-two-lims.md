---
layout: layouts/plain.njk
title: Perfect number in C using while loop
description: In this tutorial we will create a program in C which will ask the user for a number and then check whether the number is a perfect number or not.
summary: In this tutorial we will create a program in C that will ask the user for a number and then check whether the number is a perfect number or not.
tags:
  - c
  - coding
date: 2022-08-04
---

This C program returns the perfect numbers between two limits.

# Perfect number

A perfect number is a number that is equal to the sum of its proper divisors. For example, the sum of the proper divisors of 6 is 1 + 2 + 3 = 6, which is a perfect number. The sum of the proper divisors of 28 is 1 + 2 + 4 + 7 + 14 = 28, which is also a perfect number.

# Algorithm

1. Accept the two limits as input.
2. Loop through all the numbers from the first limit to the second limit and check whether the number is a divisor of the number.
3. If the number is a divisor of the number, add it to the sum.
4. If the sum is equal to the number, print the number.

# Problem description

This program will ask the user for two limits and then print all the perfect numbers between the limits.

### Example

```
Input: 1 10
Output:
6
```

### Methods used
### Approach

1. Take the limits as input.
2. Store the limits in two variables.
3. Start from the lower limit and loop through all the numbers until the upper limit and check whether it is a perfect number.
4. For this we use the previously defined `isPerfect` function.
5. If the number is a perfect number, print the number.
6. Repeat the process until the upper limit.

### Program/Source code

```c

#include <stdio.h>
#include <stdlib.h>

int isPerfect(int n)
{
    int i, sum = 0;
    for (i = 1; i < n; i++)
    {
        if (n % i == 0)
        {
            sum += i;
        }
    }
    if (sum == n)
    {
        return 1;
    }
    else
    {
        return 0;
    }
}

void printPerfect(int lower, int upper)
{
    int i;
    for (i = lower; i <= upper; i++)
    {
        if (isPerfect(i))
        {
            printf("%d ", i);
        }
    }
}

int main(void)
{
    int lower, upper;
    printf("Enter the lower limit: ");
    scanf("%d", &lower);
    printf("Enter the upper limit: ");
    scanf("%d", &upper);
    printf("The perfect numbers between %d and %d are: \n", lower, upper);
    printPerfect(lower, upper);
    return 0;
}
```
### Explanation

In this program, we begin with asking the user for the upper and lower limits. We then loop through all the numbers from the lower limit to the upper limit and check whether the number is a perfect number. If the number is a perfect number, print the number.

In the `printPerfectNumbers` function, we loop through all the numbers from the lower limit to the upper limit and check whether the number is a perfect number. If the number is a perfect number, print the number.

In the `isPerfect` function, we loop through all the numbers from 1 to the number and check whether the number is a divisor of the number. If the number is a divisor of the number, add it to the sum. If the sum is equal to the number, return 1. Otherwise, return 0.

### Time complexity

The time complexity of this program is O(n^2).

### Space Complexity

The space complexity of this program is O(1).

### Output

```
> ./perfect-number-bw 
Enter the lower limit: 3
Enter the upper limit: 100
Perfect numbers between 3 and 100 are:
6 28 

> ./perfect-number-bw
Enter the lower limit: 2
Enter the upper limit: 100000
Perfect numbers between 2 and 100000 are:
6 28 496 8128 
```
