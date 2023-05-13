---
layout: layouts/post.njk
title: Sum of digits in C
description: In this tutorial we will be creating a C program which will calculate the sum of digits in a number using a function and recursion.
summary: In this tutorial we will be creating a C program which will calculate the sum of digits in a number using a function and recursion.
tags: 
    - coding
    - c 
date: 2022-07-22
---

This is a C program which will calculate the sum of digits in a number.

## Algorithm

1. Take the number as input.
2. Divide the number by 10 and store the remainder in a variable.
3. Add the remainder to the sum.
4. Repeat the process until the number is not 0.
5. Print the sum.

## Problem description

Given a number, find the sum of its digits.

## Naive Approach

In this approach, we will divide the number by 10 and add the remainder to the sum.

### Approach

1. Take the number as input.
2. Divide the number by 10 and store the remainder in a variable.
3. Add the remainder to the sum.
4. Repeat the process until the number is not 0.
5. Print the sum.

### Examples

Input: 123
Output: 6

Input: 8679
Output: 30

### Program/Source code

```c
/* C program to find sum of digits of a number */

#include <stdio.h>

int main(void)
{
    int num, sum = 0, rem;
    printf("Enter a number: ");
    scanf("%d", &num);
    // Keep dividing until the number is not zero
    while (num != 0)
    {
        rem = num % 10;
        sum = sum + rem;
        num = num / 10;
    }
    printf("Sum of digits of the number is %d", sum);
    return 0;
}
```

### Explanation

The program asks the user to enter a number. Then divide the number by 10 and store the remainder in a variable. Then add the remainder to the sum. The program then repeats the process until the number is not 0. Finally, print the sum.

### Time complexity

Time complexity of the above algorithm is O(n).

### Space Complexity

Space complexity of the above algorithm is O(1).

### Output

```
> ./sumofdig 
Enter a number: 123
Sum of digits of the number is 6%

> ./sumofdig
Enter a number: 138974
Sum of digits of the number is 32
```

## Advanced Approach

In this approach, we use a separate function to calculate the sum of digits.

### Methods used

* `long sum_of_digits(long num)` - This function calculates the sum of digits of a number.

### Approach

1. Take the number as input.
2. Call the function `sum_of_digits` to calculate the sum of digits, the procedure is similar to whatever we did before.
3. Print the sum.

### Examples

Input: 14839481349
Output: 54

### Program/Source code

```c
/* Find the sum of digits of a number using a separate function */
#include <stdio.h>

long sum_of_digits(long n)
{
    long sum = 0;
    while (n > 0) {
        sum += n % 10;
        n /= 10;
    }
    return sum;
}

int main(void)
{
    long n;
    printf("Enter a number: ");
    scanf("%ld", &n);
    printf("Sum of digits of the number is %ld", sum_of_digits(n));
    return 0;
}
```

### Explanation

The program asks the user to enter a number. Then call the function `sum_of_digits` to calculate the sum of digits, the procedure is similar to whatever we did before. Finally, print the sum.
Suppose the user enters the number `14839481349`. In the `printf` statement, we call the function `sum_of_digits` with the number `14839481349` as the argument. Inside the function, a while loop executes until the number is not 0. The loop adds the remainder to the sum.

### Time complexity

Time complexity of the above algorithm is O(n).

### Space Complexity

Space complexity of the above algorithm is O(1).

### Output

```
> ./sumofdigfun 
Enter a number: 14839481349
Sum of digits of the number is 54

> ./sumofdigfun
Enter a number: 127381723
Sum of digits of the number is 34
```

## Recursive Approach

In this approach, we use a recursive function to calculate the sum of digits.

### Methods used

* `long sum_of_digits_recur(long num)` - This function calculates the sum of digits of a number recursively.

### Approach

1. Take the number as input.
2. Call the function `sum_of_digits_recur` to calculate the sum of digits, the procedure is similar to whatever we did before with the difference that now it is recursive and therefore needs a few changes and a termination condition.
3. Print the sum.

### Examples

Input: 3248162424
Output: 36

### Program/Source code

```c
/* Find the sum of digits recursively */
#include <stdio.h>

long sum_of_digits_recur(long n)
{
    if (n == 0)
        return 0;
    else
        return n % 10 + sum_of_digits_recur(n / 10);
}

int main(void)
{
    long n;
    printf("Enter a number: ");
    scanf("%ld", &n);
    printf("Sum of digits of the number is %ld", sum_of_digits_recur(n));
    return 0;
}
```

### Explanation

The program begins by asking the user to enter a number. Then call the function `sum_of_digits_recur` to calculate the sum of digits. Inside the function, we write a temrinating condition which is whenever the number becomes 0, the program should return back 0. Otherwise, the program should add the remainder along with the number divided by 10 which is turn sent back to the function. At the end, all sums are added up and the result is displayed to the user.

### Time complexity

Time complexity of the above algorithm is O(n).

### Space Complexity

Space complexity of the above algorithm is O(n).

### Output

```
> ./sumofdigrecur      
Enter a number: 3248162424
Sum of digits of the number is 36                                                   

> ./sumofdigrecur
Enter a number: 32471844421
Sum of digits of the number is 40
```
