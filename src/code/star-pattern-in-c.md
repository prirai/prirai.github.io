---
layout: layouts/plain.njk
title: C program to generate star pattern
description: In this tutorial we will create a program in C which generate a star pattern.
summary: In this tutorial we will create a program in C which will generate a star pattern.
tags:
  - c
  - coding
date: 2022-08-31
---

/* The article has the following sections # Title 
some definition
## Algorithm
## Problem description
## Examples
## Problem Solution
## Naive Approach
### Approach
### Program/Source code
### Methods used
### Explanation
### Time complexity
### Space Complexity
### Output
## Optimized Approach
## Recursion method
*/

In this tutorial we will create a program in C which will generate a star pattern.

# Star pattern

A star pattern is a pattern that shows up as a staircase of stars. It is a very common pattern in programming.

# Example

```
input:
  - 5

output:
*
**
***
****
*****
```

## Problem description

Given a number, print a star pattern.

## Problem Solution

1. Ask the user to enter a number.
2. Print the stars using a nested for loop.

## Naive Approach

In this approach, we will use a nested for loop to print the stars.

### Program/Source code

```c
#include <stdio.h>

int main(void)
{
    int i, j, n;
    printf("Enter the number of rows: ");
    scanf("%d", &n);
    for (i = 1; i <= n; i++)
    {
        for (j = 1; j <= i; j++)
        {
            printf("*");
        }
        printf("\n");
    }
    return 0;
}
```

### Explanation

In this program, we are using two for loops. The outer for loop is used to print the rows and the inner for loop is used to print the stars in each row. The outer for loop is executed n times where n is the number of rows. The inner for loop is executed i times where i is the number of stars in each row.

### Time complexity

The time complexity of this program is O(n^2). The outer for loop is executed n times and the inner for loop is executed i times where i is the number of stars in each row. So the time complexity is O(n^2).

### Space Complexity

The space complexity of this program is O(1). No extra space is used.

### Output

```
./star-pattern

Enter the number of rows: 5
*
**
***
****
*****
```

## While loop approach

In this approach, we will use while loop to print the stars.

### Program/Source code

```c
#include <stdio.h>

int main(void)
{
    int i = 1, j, n;
    printf("Enter the number of rows: ");
    scanf("%d", &n);
    while (i <= n)
    {
        j = 1;
        while (j <= i)
        {
            printf("*");
            j++;
        }
        printf("\n");
        i++;
    }
    return 0;
}
```

### Explanation

In this program, we are using two while loops. The outer while loop is used to print the rows and the inner while loop is used to print the stars in each row. The outer while loop is executed n times where n is the number of rows. The inner while loop is executed i times where i is the number of stars in each row.

### Time complexity

The time complexity of this program is O(n^2). The outer while loop is executed n times and the inner while loop is executed i times where i is the number of stars in each row. So the time complexity is O(n^2).

### Space Complexity

The space complexity of this program is O(1). No extra space is used.

### Output

```
./star-pattern

Enter the number of rows: 3
*
**
***
```

## Function approach

In this approach, we will make use of functions to print the stars.

### Program/Source code

```c
#include <stdio.h>

void printN(char ch, int n)
{
    int i;
    for (i = 1; i <= n; i++)
    {
        printf("%c", ch);
    }
}

int main(void)
{
    int i, n;
    printf("Enter the number of rows: ");
    scanf("%d", &n);
    for (i = 1; i <= n; i++)
    {
        printN('*', i);
        printf("\n");
    }
    return 0;
}
```

### Methods used

- `printN(char ch, int n)`: This function prints the character ch n times.

### Explanation

In this program, we are using a function to print the stars. The function `printN(char ch, int n)` prints the character ch n times. The outer for loop is executed n times where n is the number of rows. The inner for loop is executed i times where i is the number of stars in each row.

### Time complexity

The time complexity of this program is O(n^2). The outer for loop is executed n times and the inner for loop is executed i times where i is the number of stars in each row. So the time complexity is O(n^2).

### Space Complexity

The space complexity of this program is O(1). No extra space is used.

### Output

```
./star-pattern

Enter the number of rows: 7
*
**
***
****
*****
******
*******
```

## Rhombus Star Pattern

In this approach, we will print a rhombus star pattern.

eg.
    
```
input:
  - 5

output:
    *
   ***
  *****
   ***
    *
```

### Program/Source code

```c
#include <stdio.h>

void printN(char ch, int n)
{
    int i;
    for (i = 1; i <= n; i++)
    {
        printf("%c", ch);
    }
}

int main(void)
{
    int i, n;
    printf("Enter the number of rows: ");
    scanf("%d", &n);
    for (i = 1; i <= (n + 1)/2; i++)
    {
        printN(' ', n - i);
        printN('*', 2 * i - 1);
        printf("\n");
    }

    for(i = (n + 1)/2; i <= n; i ++)
    {
        printN(' ', i - 1);
        printN('*', 2 * (n - i) + 1);
        printf("\n");
    }
    return 0;
}

```

### Explanation

In this program, we are using a function to print the spaces and stars. The function `printN(char ch, int n)` prints the character ch n times. 

In the main function inside the first for loop, i goes from 1 to (n + 1)/2. Here, we are printing the upper half of the rhombus. For every iteration, there are n - i spaces and 2 * i - 1 stars. For n = 5, this will be 5 - i = 4, 3, and 2 spaces and 2 * i - 1 = 1, 3, and 5 stars.

In the second for loop, i goes from (n + 1)/2 to n. Here, we are printing the lower half of the rhombus. For every iteration, there are i - 1 spaces and 2 * (n - i) + 1 stars. For n = 5, this will be i - 1 = 2, 3 and 4 spaces and 2 * (n - i) + 1 = 3 and 1 stars.

### Time complexity

The time complexity of this program is O(n^2). For every iteration, the function `printN(char ch, int n)` is executed n times. So the time complexity is O(n^2).

### Space Complexity

The space complexity of this program is O(1). No extra space is used.

### Output

```
./rhombus      
Enter the number of rows: 5
    *
   ***
  *****
   ***
    *
```

```
./rhombus      
Enter the number of rows: 10
         *
        ***
       *****
      *******
     *********
    ***********
     *********
      *******
       *****
        ***
         *
```

## Hollow Star pyramid pattern

In this approach, we will print a hollow star pyramid pattern.

eg.
    
```
input:
  - 5

output:
    *
   * *
  *   *
 *     *
```

### Program/Source code

```c
#include <stdio.h>

void printN(char ch, int n)
{
    int i;
    for (i = 1; i <= n; i++)
    {
        printf("%c", ch);
    }
}

int main(void)
{
    int i, n;
    printf("Enter the number of rows: ");
    scanf("%d", &n);
    for (i = 1; i <= n; i++)
    {
        printN(' ', n - i);
        printN('*', 1);
        if (i > 1)
        {
            printN(' ', 2 * i - 3);
            printN('*', 1);
        }
        printf("\n");
    }
    return 0;
}
```

### Explanation

In this program, we are using a function to print the spaces and stars. The function `printN(char ch, int n)` prints the character ch n times.

In the main function, the outer for loop is executed n times where n is the number of rows. The inner if statement checks if i is greater than 1. If it is, then it prints the spaces and stars. For n = 5, this will be 2 * i - 3 = -1, 1, 3, and 5 spaces and 1 star every time.

### Time complexity

The time complexity of this program is O(n^2). For every iteration, the function `printN(char ch, int n)` is executed n times. So the time complexity is O(n^2).

### Space Complexity

The space complexity of this program is O(1). No extra space is used.

### Output

```
./hollow-pyramid 
Enter the number of rows: 5
    *
   * *
  *   *
 *     *
*       *

./hollow-pyramid
Enter the number of rows: 10
         *
        * *
       *   *
      *     *
     *       *
    *         *
   *           *
  *             *
 *               *
 ```

 ## Plus star pattern

In this approach, we will print a plus star pattern.

eg.
    
```
input:
  - 5

output:
     *
     *
     *
     *
     *
***********
     *
     *
     *
     *
     *
```

### Program/Source code

```c
#include <stdio.h>

void printN(char ch, int n)
{
    int i;
    for (i = 1; i <= n; i++)
    {
        printf("%c", ch);
    }
}

int main(void)
{
    int i, n;
    printf("Enter the number of rows: ");
    scanf("%d", &n);
    for (i = 1; i <= n; i++)
    {
        printN(' ', n);
        printN('*', 1);
        printf("\n");
    }
    printN('*', 2 * n + 1);
    printf("\n");
    for (i = 1; i <= n; i++)
    {
        printN(' ', n);
        printN('*', 1);
        printf("\n");
    }
    return 0;
}
```

### Explanation

In this program, we are using a function to print the spaces and stars. The function `printN(char ch, int n)` prints the character ch n times.

The first for loop goes from 1 to n. Here, we are printing the first half of the plus. For every iteration, there are n spaces and 1 star. For n = 5, this will be 5 spaces and 1 star.

In the next line we print 2 * n + 1 stars. For n = 5, this will be 2 * 5 + 1 = 11 stars.

The second for loop goes from 1 to n. Here, we are printing the second half of the plus. For every iteration, there are n spaces and 1 star. For n = 5, this will be 5 spaces and 1 star.

### Time complexity

The time complexity of this program is O(n^2). For every iteration, the function `printN(char ch, int n)` is executed n times. So the time complexity is O(n^2).

### Space Complexity

The space complexity of this program is O(1). No extra space is used.

### Output

```
./plus-star
Enter the number of rows: 5
     *
     *
     *
     *
     *
***********
     *
     *
     *
     *
     *

./plus-star      
Enter the number of rows: 10
          *
          *
          *
          *
          *
          *
          *
          *
          *
          *
*********************
          *
          *
          *
          *
          *
          *
          *
          *
          *
          *
```