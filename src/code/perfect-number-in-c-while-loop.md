---
layout: layouts/plain.njk
title: Perfect numbers within a range in C using while loop
description: In this tutorial we will create a program in C which will ask the user to enter a range and then print all the perfect numbers within that range.
summary: In this tutorial we will create a program in C that will ask the user to enter a range and then print all the perfect numbers within that range.
tags:
  - c
  - coding
date: 2022-07-31
---

This C program checks whether a number is a perfect number or not using while loop.

# Perfect number

A perfect number is a number that is equal to the sum of its proper divisors. For example, the sum of the proper divisors of 6 is 1 + 2 + 3 = 6, which is a perfect number. The sum of the proper divisors of 28 is 1 + 2 + 4 + 7 + 14 = 28, which is also a perfect number.

# Algorithm

1. Take the number as input.
2. Loop through all the numbers from 1 to the number and check whether the number is a divisor of the number.
3. If the number is a divisor of the number, add it to the sum.
4. If the sum is equal to the number, print "The number is a perfect number".
5. If the sum is not equal to the number, print "The number is not a perfect number".

# Problem description

This program will ask the user for a number and then check whether the number is a perfect number or not.

### Examples

Input: 6
Output: The number is a perfect number

Input: 34
Output: The number is not a perfect number

Input: 100
Output: The number is not a perfect number

## Naive Approach

In this approach we'll not make use of any functions. We'll just loop through all the numbers from 1 to the number and check whether the number is a divisor of the number.

### Methods used
### Approach

    1. Take the number as input.
    2. Store the number in a variable.
    3. Inside for loop, take the number and divide it by i and store the result in a variable.
    4. If the result is equal to the number, add the result to a variable.
    5. Repeat the process until i is equal to the number.
    6. If the sum of the variable is equal to the number, print the number is a perfect number.
    7. Otherwise, print the number is not a perfect number.

### Program/Source code

```c

#include <stdio.h>

/* Program to check whether a number is a perfect number or not using while loop */

int main(void)
{
    int number, i, sum = 0;

    printf("Enter the number: ");
    scanf("%d", &number);

    i = 1;
    while (i < number)
    {
        if (number % i == 0)
            sum += i;
        i++;
    }

    if (sum == number)
        printf("%d is a perfect number", number);
    else
        printf("%d is not a perfect number", number);
}

```
### Explanation

In this program, we begin with asking the user for a number. We then loop through all the numbers from 1 to the number and check whether the number is a divisor of the number. If the number is a divisor of the number, add it to the sum. If the sum is equal to the number, print "The number is a perfect number". Otherwise, print "The number is not a perfect number".

### Time complexity

The time complexity of this program is O(n).

### Space Complexity

The space complexity of this program is O(1).

### Output

```
> ./perfect-number-while
Enter the number: 11
11 is not a perfect number

> ./perfect-number-while
Enter the number: 28
28 is a perfect number%
```

## Approach using function

In this approach we will make use of a function. We'll take the number as input and then call the function.

### Methods used

* `int is_perfect_number(int number)` - This function will check whether the number is a perfect number or not.
* `int is_divisor(int number, int divisor)` - This function will check whether the number is a divisor of the number.
* `int sum_of_divisors(int number)` - This function will return the sum of the divisors of the number.

### Approach

1. Take the number as input.
2. Call the function `is_perfect_number` and pass the number as input.
3. If the function returns 1, print the number is a perfect number.
4. Otherwise, print the number is not a perfect number.

### Program/Source code

```c

/* Program to check whether a number is a perfect number or not */

#include <stdio.h>

int is_divisor(int number, int divisor)
{
    if (number % divisor == 0)
        return 1;
    else
        return 0;
}

int sum_of_divisors(int number)
{
    int i = 1, sum = 0;
    while (i < number) {
        if (is_divisor(number, i))
            sum += i;
         i++;
    }
    return sum;
}

int is_perfect_number(int number)
{
    if (sum_of_divisors(number) == number)
        return 1;
    else
        return 0;
}

int main(void)
{
    int number;

    printf("Enter the number: ");
    scanf("%d", &number);

    if (is_perfect_number(number))
        printf("The number is a perfect number");
    else
        printf("The number is not a perfect number");
}

```

### Explanation

The program asks the user for a number. Then it calls the function `is_perfect_number` and passes the number as input. Inside the function another function `sum_of_divisors` is called and the number is passed as input. Inside this function, we'll loop through all the numbers from 1 to the number and check whether the number is a divisor of the number. If the number is a divisor of the number, it will add it to the sum. If the sum is equal to the number, it will print the number is a perfect number. Otherwise, it will print the number is not a perfect number.

### Time complexity

The time complexity of this program is O(n).

### Space Complexity

The space complexity of this program is O(1).

### Output

```
> ./perfect-number-fun
Enter the number: 99
The number is not a perfect number

> ./perfect-number-fun
Enter the number: 33550336
The number is a perfect number
```
