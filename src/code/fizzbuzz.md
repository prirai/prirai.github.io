---
layout: layouts/plain.njk
title: Implementation of FizzBuzz in C
description: In this tutorial we will create a program in C which will print the numbers from 1 to 100. But for multiples of three print "Fizz" instead of the number and for the multiples of five print "Buzz". For numbers which are multiples of both three and five print "FizzBuzz".
summary: In this tutorial we will create a program in C which will print the numbers from 1 to 100. But for multiples of three print "Fizz" instead of the number and for the multiples of five print "Buzz". For numbers which are multiples of both three and five print "FizzBuzz".
tags:
  - c
  - coding
date: 2022-09-03
---

In this tutorial we will create a program in C which will print the numbers from 1 to 100. But for multiples of three print "Fizz" instead of the number and for the multiples of five print "Buzz". For numbers which are multiples of both three and five print "FizzBuzz".

# FizzBuzz

FizzBuzz is a simple programming task used in software developer job interviews. It is often used as an initial screening question to help filter out candidates who lack basic coding skills.

In this task, you are asked to write a program that prints the numbers from 1 to 100. But for multiples of three print "Fizz" instead of the number and for the multiples of five print "Buzz". For numbers which are multiples of both three and five print "FizzBuzz".

There have been many variations of this task like:

- FizzBuzzBang (multiples of 3, 5, and 7)
- FizzBuzzBangBong (multiples of 3, 5, 7, and 11)
- FizzBuzzBangBongBaz (multiples of 3, 5, 7, 11, and 13)

# Example

```
1 2 Fizz 4 Buzz Fizz 7 8 Fizz Buzz 11 Fizz 13 14 FizzBuzz 16 17 Fizz 19 Buzz Fizz 22 23 Fizz Buzz
```

## Problem description

Provide a C implementation of FizzBuzz.

## Problem Solution

1. Iterate from 1 to 100.
2. If the number is divisible by both 3 and 5, print "FizzBuzz".
3. Else if the number is divisible by 3, print "Fizz".
4. Else if the number is divisible by 5, print "Buzz".
5. Else print the number.

## FizzBuzz simple solution

In this approach, we will use a loop to iterate from 1 to 100 and check if the number is divisible by 3, 5, or both.

### Program/Source code

```c
#include <stdio.h>

int main(void)
{
    int i;
    for (i = 1; i <= 100; i++)
    {
        if (i % 3 == 0 && i % 5 == 0)
        {
            printf("FizzBuzz ");
        }
        else if (i % 3 == 0)
        {
            printf("Fizz ");
        }
        else if (i % 5 == 0)
        {
            printf("Buzz ");
        }
        else
        {
            printf("%d ", i);
        }
    }
    return 0;
}
```

### Explanation

In this program, we are using a for loop to iterate from 1 to 100. We are using the modulus operator to check if the number is divisible by 3 or 5. If the number is divisible by both 3 and 5, we are printing "FizzBuzz". If the number is divisible by 3, we are printing "Fizz". If the number is divisible by 5, we are printing "Buzz". If the number is not divisible by 3 or 5, we are printing the number.

### Time complexity

We are iterating from 1 to 100 and checking if the number is divisible by 3 or 5. So, n is 100. So, the time complexity is O(100) which is O(n).

### Space complexity

We are not using any extra space. So, the space complexity is O(1).

### Output

```
1 2 Fizz 4 Buzz Fizz 7 8 Fizz Buzz 11 Fizz 13 14 FizzBuzz 16 17 Fizz 19 Buzz Fizz 22 23 Fizz Buzz 26 Fizz 28 29 FizzBuzz 31 32 Fizz 34 Buzz Fizz 37 38 Fizz Buzz 41 Fizz 43 44 FizzBuzz 46 47 Fizz 49 Buzz Fizz 52 53 Fizz Buzz 56 Fizz 58 59 FizzBuzz 61 62 Fizz 64 Buzz Fizz 67 68 Fizz Buzz 71 Fizz 73 74 FizzBuzz 76 77 Fizz 79 Buzz Fizz 82 83 Fizz Buzz 86 Fizz 88 89 FizzBuzz 91 92 Fizz 94 Buzz Fizz 97 98 Fizz Buzz
```

## FizzBuzz optimized solution

In this approach we use flags to check if the number is divisible by 3, 5, or both instead of checking the number for divisibility every time as using the modulus operator is an expensive operation.

### Program/Source code

```c
#include <stdio.h>

int main(void)
{
    int i;
    for (i = 1; i <= 100; i++)
    {
        int flag3 = i % 3 == 0;
        int flag5 = i % 5 == 0;
        if (flag3 && flag5)
        {
            printf("FizzBuzz ");
        }
        else if (flag3)
        {
            printf("Fizz ");
        }
        else if (flag5)
        {
            printf("Buzz ");
        }
        else
        {
            printf("%d ", i);
        }
    }
    return 0;
}
```

### Explanation

In this approach, we use two flags initially to find whether the number is divisible by 3 or 5. This helps in decreasing the number of modulus operations. We then check if the number is divisible by both 3 and 5, 3, or 5. If the number is divisible by both 3 and 5, we are printing "FizzBuzz". If the number is divisible by 3, we are printing "Fizz". If the number is divisible by 5, we are printing "Buzz". If the number is not divisible by 3 or 5, we are printing the number.

### Time complexity

We are iterating from 1 to 100 and checking if the number is divisible by 3 or 5. So, the time complexity is O(100) which is O(n).

### Space complexity

We are not using any extra space. So, the space complexity is O(1).

### Output

```
1 2 Fizz 4 Buzz Fizz 7 8 Fizz Buzz 11 Fizz 13 14 FizzBuzz 16 17 Fizz 19 Buzz Fizz 22 23 Fizz Buzz ... Buzz Fizz 97 98 Fizz Buzz
```

## FizzBuzz advanced solution

In this approach we'll use a string to store the output and print it at the end of the loop.

### Program/Source code

```c
/* FizzBuzz using string */
#include <stdio.h>
#include <string.h>

int main(void)
{
    int i;
    for (i = 1; i <= 100; i++)
    {
        char output[10] = "";
        if (i % 3 == 0)
        {
            strcat(output, "Fizz");
        }
        if (i % 5 == 0)
        {
            strcat(output, "Buzz");
        }
        if (strlen(output) == 0)
        {
            printf("%d ", i);
        }
        else
        {
            printf("%s ", output);
        }
    }
    return 0;
}
```

### Explanation

In this approach, we are using a string to store the output. We are using the modulus operator to check if the number is divisible by 3 or 5. If the number is divisible by 3, we are appending "Fizz" to the string. If the number is divisible by 5, we are appending "Buzz" to the string. If the string is empty, we are printing the number. Else, we are printing the string.

### Time complexity

We are iterating from 1 to 100 and checking if the number is divisible by 3 or 5. So, the time complexity is O(100) which is O(n).

### Space complexity

We are not using any extra space. So, the space complexity is O(1).

### Output

```
1 2 Fizz 4 Buzz Fizz 7 8 Fizz Buzz 11 Fizz 13 14 FizzBuzz 16 17 Fizz 19 Buzz ... Buzz Fizz 97 98 Fizz Buzz
```
