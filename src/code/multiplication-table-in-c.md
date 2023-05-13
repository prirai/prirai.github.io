---
layout: layouts/plain.njk
title: Multiplication table in C
description: In this tutorial we will create a program in C which will ask the user for a number and then print the multiplication table of that number.
summary: In this tutorial we will create a program in C that will ask the user for a number and then print the multiplication table of that number.
tags:
  - c
  - coding
date: 2022-07-28
---

# Multipication Table in C

This C program will print the multiplication table of a number.

# Algorithm

1. Take the number as input.
2. Store the number in a variable.
3. Inside for loop, take the number and multiply it by i and store the result in a variable.
4. Print the result.
5. Repeat the process until i is equal to 10.

# Problem description

Given a number, print the multiplication table of the number.

## Approach using for loop

Calculate the multiplication table of a number using `for` loop.

### Program/Source code

```c
#include <stdio.h>

int main()
{
    int n, i;
    printf("Enter a number: ");
    scanf("%d", &n);
    for (i = 1; i <= 10; i++)
        printf("%d x %d = %d\n", n, i, n * i);
    return 0;
}
```

### Explanation

In this approach, we will use a for loop to calculate the multiplication table of a number. For any number, the for loop starts from 1 and ends at 10 and prints the multiplication table of the number.

### Output

```
> ./multiplication-table-in-c

Enter a number: 5
5 x 1 = 5
5 x 2 = 10
5 x 3 = 15
5 x 4 = 20
5 x 5 = 25
5 x 6 = 30
5 x 7 = 35
5 x 8 = 40
5 x 9 = 45
5 x 10 = 50
```

## Approach using `while` loop

Calculate the multiplication table of a number using `while` loop.

### Program/Source code

```c
#include <stdio.h>

int main()
{
    int n, i = 1;
    printf("Enter a number: ");
    scanf("%d", &n);
    while (i <= 10)
    {
        printf("%d x %d = %d\n", n, i, n * i);
        i++;
    }
    return 0;
}
```

### Explanation

In this approach, we will use a `while` loop to calculate the multiplication table of a number. For any number, the `while` loop starts from 1 and ends at 10 and prints the multiplication table of the number.

### Output

```
> ./multiplication-table-in-c

Enter a number: 12
12 x 1 = 12
12 x 2 = 24
12 x 3 = 36
12 x 4 = 48
12 x 5 = 60
12 x 6 = 72
12 x 7 = 84
12 x 8 = 96
12 x 9 = 108
12 x 10 = 120
```

## Approach using `do-while` loop

Calculate the multiplication table of a number using `do-while` loop.

### Program/Source code

```c
#include <stdio.h>

int main()
{
    int n, i = 1;
    printf("Enter a number: ");
    scanf("%d", &n);
    do
    {
        printf("%d x %d = %d\n", n, i, n * i);
        i++;
    } while (i <= 10);
    return 0;
}
```

### Explanation

In this approach, we will use a `do-while` loop to calculate the multiplication table of a number. For any number, the `do-while` loop starts from 1 and ends at 10 and prints the multiplication table of the number.

### Output

```
> ./multiplication-table-in-c

Enter a number: 17

17 x 1 = 17
17 x 2 = 34
17 x 3 = 51
17 x 4 = 68
17 x 5 = 85
17 x 6 = 102
17 x 7 = 119
17 x 8 = 136
17 x 9 = 153
17 x 10 = 170
```

## Approach using a function

Take the input and inside a separate function, print the multiplication table of the number.

## Methods used

* `void multiplicationTable(int)` - This function will print the multiplication table of the number.

### Program/Source code

```c
#include <stdio.h>

void multiplicationTable(int num) {
  printf("Multiplication Table for %d:\n", num);
  for (int i = 1; i <= 10; i++) {
    printf("%d x %d = %d\n", num, i, num * i); // Print the table using a suitable format
  }
}

int main(void) {
  int num;
  /* Ask the user for a number and store it in a variable which will finally go to the multiplicationTable function */
  puts("Enter a number : ");
  scanf("%d", &num);
  multiplicationTable(num);
}
```

### Explanation

The program asks the user for a number and then stores the number in a variable. The variable is passed to the multiplicationTable function. The multiplicationTable function prints the multiplication table of the number using a for loop and then print in a suitable format.

### Time complexity

The time complexity of this program is O(n) where n is the number of rows in the table.

### Space Complexity

The space complexity of this program is O(1) since we are not using any extra space.

### Output

```
> ./mul-table 
Enter a number : 
8
Multiplication Table for 8:
8 x 1 = 8
8 x 2 = 16
8 x 3 = 24
8 x 4 = 32
8 x 5 = 40
8 x 6 = 48
8 x 7 = 56
8 x 8 = 64
8 x 9 = 72
8 x 10 = 80


> ./mul-table
Enter a number : 
23
Multiplication Table for 23:
23 x 1 = 23
23 x 2 = 46
23 x 3 = 69
23 x 4 = 92
23 x 5 = 115
23 x 6 = 138
23 x 7 = 161
23 x 8 = 184
23 x 9 = 207
23 x 10 = 230
```

## Approach using recursion

Calculate the multiplication table of a number using recursion.

### Program/Source code

```c
#include <stdio.h>

int multiplicationTable(int num, int i) {
  if (i > 10) {
    return;
  }
  printf("%d x %d = %d\n", num, i, num * i);
  multiplicationTable(num, i + 1);
}

int main(void) {
  int num;
  // Ask the user for a number and store it in a variable which will finally go to the multiplicationTable function
  puts("Enter a number : ");
  scanf("%d", &num);
  multiplicationTable(num, 1);
}
```

### Explanation

The program asks the user for a number and then stores the number in a variable. The num and the value 1 are passed to the multiplicationTable function. The multiplicationTable function is a recursive function which terminates when the value of i is greater than 10. For every step, the function prints the entry for that i and then calls itself again with the value of i incremented by 1.

### Output

```
> ./mul-table
Enter a number : 23
23 x 1 = 23
23 x 2 = 46
23 x 3 = 69
23 x 4 = 92
23 x 5 = 115
23 x 6 = 138
23 x 7 = 161
23 x 8 = 184
23 x 9 = 207
23 x 10 = 230
```
