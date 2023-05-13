---
layout: layouts/post.njk
title: Number reverse in C
description: In this tutorial we will create a program in C that will ask for a number and then reverse it.
summary: In this tutorial we will create a program in C that will ask for a number and then reverse it.
tags:
    - coding
    - c
date: 2022-07-23
---

This is a C program which will find the reverse of a number provided by user.

## Algorithm
1. Take the number as input.
2. Store the number in a variable.
3. Take the number and divide it by 10 and store the remainder in a variable.
4. Add the remainder to the sum where sum multiplies its previous value by 10.
5. Repeat the process until the number is not 0.
6. Return the sum.

## Problem description

Given a number, find the reverse of the number.

## Naive Approach

In this approach, we will divide the number by 10 and add the remainder to the sum.

### Approach

    1. Take the number as input.
    2. Store the number in a variable.
    3. Take the number and divide it by 10 and store the remainder in a variable.
    4. Add the remainder to the sum where sum multiplies its previous value by 10.
    5. Repeat the process until the number is not 0.
    6. Return the sum.

### Examples

Input: 123
Output: 321

Input: 8679
Output: 9768

### Program/Source code

```c
/* C program to reverse a number */

#include <stdio.h>

int main(void)
{
    long num, reverse = 0, temp, remainder;
    printf("Enter the number\n");
    scanf("%ld", &num);
    temp = num;
    while (num > 0)
    {
        remainder = num % 10;
        reverse = reverse * 10 + remainder;
        num /= 10;
    }
    printf("Given number = %ld\n", temp);
    printf("Its reverse is = %ld\n", reverse);
}
```

### Explanation

The program asks the user for a number. Upon receiving the number, the program divides the number by 10 and stores the remainder in a variable. Then, it adds the remainder to the sum where sum multiplies its previous value by 10. The program then repeats the process until the number is not 0. Finally, it returns the sum.

### Time complexity

The time complexity of this algorithm is O(n) where n is the number of digits in the number.

### Space complexity

The space complexity of this algorithm is O(1) since we are not using any extra space.

### Output

```
> ./num-reverse-0 
Enter the number
323441
Given number = 323441
Its reverse is = 144323

> ./num-reverse-0
Enter the number
42394
Given number = 42394
Its reverse is = 49324
```

## Approach using function

In this approach, we will use a separate function to calculate the reverse of the number.

### Methods used

* `int reverse(int n)` - This function calculates the reverse of the number.

### Approach

1. Take the number as input.
2. Store the number in a variable.
3. Call the function `reverse` to calculate the reverse of the number.
4. Print the reverse.

### Examples

Input: 354231
Output: 132453

### Program/Source code

```c
/* C program to reverse a number */
#include <stdio.h>

int reverse(int n)
{
    int rev = 0;
    while (n > 0) {
        rev = rev * 10 + n % 10;
        n /= 10;
    }
    return rev;
}

int main(void)
{
    int n;
    printf("Enter a number: ");
    scanf("%d", &n);
    printf("Reversed number is %d", reverse(n));
    return 0;
}
```

### Explanation

The program asks the user for a number. Upon receiving the number, the program calls the function `reverse` to calculate the reverse of the number. Then, it prints the reverse.

### Time complexity

The time complexity of this algorithm is O(n) where n is the number of digits in the number.

### Space complexity

The space complexity of this algorithm is O(1) since we are not using any extra space.

### Output

```
> ./num-reverse-fun 
Enter a number: 453424123
Reversed number is 321424354

> ./num-reverse-fun
Enter a number: 0324135
Reversed number is 531423%
```

## Recursive Approach

In this approach, we will use a recursive function to calculate the reverse of the number.

### Methods used

* `int reverse(int n)` - This function calculates the reverse of the number using recursion.

### Approach

    1. Take the number as input.
    2. Store the number in a variable.
    3. Call the function `reverse` to calculate the reverse of the number.
    4. Make a termination case, here it is when the number is 0.
    5. In all other cases, call the function `reverse` again with the number divided by 10.
    6. Return the sum.

### Examples

Input: 453424123
Output: 321424354

### Program/Source code

```c
/* C program to reverse a number using recursion */
#include <stdio.h>

int reverse(int n, int rev)
{
    if (n == 0)
        return rev;
    rev = rev * 10 + n % 10;
    return reverse(n / 10, rev);
}

int main(void)
{
    int n;
    printf("Enter a number: ");
    scanf("%d", &n);
    printf("Reversed number is %d", reverse(n, 0));
    return 0;
}
```

### Explanation

The program asks the user for a number. Upon receiving the number, the program calls the function `reverse` to calculate the reverse of the number. In the reverse function whenever the number becomes zero, the function returns the reverse of the number. Otherwise, the function calls itself recursively by dividing n by 10 at each step. It also stores the reverse of the number in a variable.

### Time complexity

The time complexity of this algorithm is O(n) where n is the number of digits in the number.

### Space Complexity

THe space complexity of this algorithm is O(n) where n is the number of digits in the number. `n` here also becomes the stack size taken by the function.

### Output
```
> ./num-reverse-recur 
Enter a number: 13223
Reversed number is 32231

> ./num-reverse-recur
Enter a number: 90831
Reversed number is 13809
```
