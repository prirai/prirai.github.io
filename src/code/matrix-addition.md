---
layout: layouts/plain.njk
title: Matrix Addition in C
description: In this tutorial we will create a program in C which will add two matrices of same size.
summary: In this tutorial we will create a program in C which will add two matrices of same size.
tags:
  - c
  - coding
date: 2022-08-03
---

This C program will add two matrices of same size.

## Algorithm

In order to add two matrices, we need to add the corresponding elements of each matrix. Suppose we have two matrices of size m x n and p x q.

1. Take the number of rows and columns as input.
2. Store the number in a variable.
3. Initialize the first matrix.
4. Initialize the second matrix.
5. Initialize the result matrix.
6. Inside a loop, add the corresponding elements of the two matrices and store them in the result matrix.
7. Print the result matrix.

## Problem description

Given two matrices of same size, this program will add the corresponding elements of each matrix and print the result.

## Examples

```
Input:
First Matrix:
1 2 3
4 5 6
Second Matrix:
1 2 3
4 5 6

Output:
2 4 6
6 8 10
```

## Problem Solution

To approach this problem we'll use a for loop to loop through the number of rows and columns and add the corresponding elements of the two matrices and store them in the result matrix.

## Naive Approach

In this approach, we'll simply loop through the number of rows and columns and add the corresponding elements of the two matrices and store them in the result matrix.

### Program/Source code

```c
/* Program to add two matrices of same size */

#include <stdio.h>
#include <stdlib.h>

int main(void)
{
    int r, c;
    printf("Enter the number of rows: ");
    scanf("%d", &r);
    printf("Enter the number of columns: ");
    scanf("%d", &c);
    int i, j;
    int **a = (int **)malloc((unsigned) r * sizeof(int *));
    int **b = (int **)malloc((unsigned) r * sizeof(int *));
    int **res = (int **)malloc((unsigned) r * sizeof(int *));
    for (i = 0; i < r; i++) {
        a[i] = (int *)malloc((unsigned) c * sizeof(int));
        b[i] = (int *)malloc((unsigned) c * sizeof(int));
        res[i] = (int *)malloc((unsigned) c * sizeof(int));
    }
    printf("Enter the elements of first matrix:\n");
    for (i = 0; i < r; i++) {
        for (j = 0; j < c; j++) {
            printf("[%d][%d]: ", i, j);
            scanf("%d", &a[i][j]);
        }
    }
    printf("Enter the elements of second matrix:\n");
    for (i = 0; i < r; i++) {
        for (j = 0; j < c; j++) {
            printf("[%d][%d]: ", i, j);
            scanf("%d", &b[i][j]);
        }
    }
    for (i = 0; i < r; i++) {
        for (j = 0; j < c; j++) {
            res[i][j] = a[i][j] + b[i][j];
        }
    }
    printf("The result matrix is:\n");
    for (i = 0; i < r; i++) {
        for (j = 0; j < c; j++) {
            printf("%6.d", res[i][j]);
        }
        printf("\n");
    }
}

```
### Explanation

The program will ask the user to enter the number of rows and columns and will return the result matrix. The program will loop through the number of rows and columns and add the corresponding elements of the two matrices and store them in the result matrix. 

Here, the memory allocation is done a bit differently. We'll use malloc to allocate the memory for the two matrices and the result matrix. First we allocate the rows of the three matrices and then we allocate the columns.

### Time complexity

Time complexity of this algorithm is O(n^2).

### Space Complexity

Space complexity of this algorithm is O(n^2).

### Output

```
> ./matrix_add      
Enter the number of rows: 3
Enter the number of columns: 2
Enter the elements of first matrix:
[0][0]: 2
[0][1]: 5
[1][0]: 32
[1][1]: 65
[2][0]: 23
[2][1]: 76
Enter the elements of second matrix:
[0][0]: 23
[0][1]: 65
[1][0]: 35
[1][1]: 2
[2][0]: 4
[2][1]: 0
The result matrix is:
    25    70
    67    67
    27    76
```

## Functional Approach

In this approach, we'll use a function to add the corresponding elements of the two matrices and store them in the result matrix.

### Approach

1. Create a function to add the corresponding elements of the two matrices and store them in the result matrix.
2. Ask the user to enter the number of rows and columns.
3. Initialize the first matrix.
4. Initialize the second matrix.
5. Initialize the result matrix.
6. Call the function to add the corresponding elements of the two matrices and store them in the result matrix.
7. Print the result matrix.

### Program/Source code

```c
/* Program to add two matrices of same size */

#include <stdio.h>
#include <stdlib.h>

void add(int **a, int **b, int **res, int r, int c)
{
    int i, j;
    for (i = 0; i < r; i++) {
        for (j = 0; j < c; j++) {
            res[i][j] = a[i][j] + b[i][j];
        }
    }
}

int main(void)
{
    int r, c;
    printf("Enter the number of rows: ");
    scanf("%d", &r);
    printf("Enter the number of columns: ");
    scanf("%d", &c);
    int i, j;
    int **a = (int **)malloc((unsigned) r * sizeof(int *));
    int **b = (int **)malloc((unsigned) r * sizeof(int *));
    int **res = (int **)malloc((unsigned) r * sizeof(int *));
    for (i = 0; i < r; i++) {
        a[i] = (int *)malloc((unsigned) c * sizeof(int));
        b[i] = (int *)malloc((unsigned) c * sizeof(int));
        res[i] = (int *)malloc((unsigned) c * sizeof(int));
    }
    printf("Enter the elements of first matrix:\n");
    for (i = 0; i < r; i++) {
        for (j = 0; j < c; j++) {
            printf("[%d][%d]: ", i, j);
            scanf("%d", &a[i][j]);
        }
    }
    printf("Enter the elements of second matrix:\n");
    for (i = 0; i < r; i++) {
        for (j = 0; j < c; j++) {
            printf("[%d][%d]: ", i, j);
            scanf("%d", &b[i][j]);
        }
    }
    add(a, b, res, r, c);
    printf("The result matrix is:\n");
    for (i = 0; i < r; i++) {
        for (j = 0; j < c; j++) {
            printf("%6.d", res[i][j]);
        }
        printf("\n");
    }
}

```

### Method used

- `add(int **, int **, int **, int, int)`: This function adds the corresponding elements of the two matrices and stores them in the result matrix.

### Explanation

The program will ask the user to enter the number of rows and columns. Then it will initialize the first matrix, initialize the second matrix and initialize the result matrix. The program will then call the function to add the corresponding elements of the two matrices and store them in the result matrix.

In the function, we'll loop through the number of rows and columns and add the corresponding elements of the two matrices and store them in the result matrix.

### Time complexity

Time complexity of this algorithm is O(n^2).

### Space Complexity

Space complexity of this algorithm is O(n^2).

### Output

```
> ./matrix_add0 
Enter the number of rows: 3
Enter the number of columns: 2
Enter the elements of first matrix:
[0][0]: 34
[0][1]: 64
[1][0]: 86
[1][1]: 0
[2][0]: 34
[2][1]: -25
Enter the elements of second matrix:
[0][0]: 65
[0][1]: -67
[1][0]: 576
[1][1]: -674
[2][0]: 58  
[2][1]: 435
The result matrix is:
    99    -3
   662  -674
    92   410
```

## Advanced approach

In this approach, we'll use functions to add the corresponding elements of the two matrices and store them in the result matrix.

### Approach

1. Create a function to add the corresponding elements of the two matrices and store them in the result matrix.
2. Create a function to initialize a matrix.
3. Create a function to print a matrix.
4. Ask the user to enter the number of rows and columns.
5. Initialize the first matrix using the function `initializeMatrix()`.
6. Initialize the second matrix using the function `initializeMatrix()`.
7. Add the corresponding elements of the two matrices using the function `addMatrix()`.
8. Print the result matrix using the function `printMatrix()`.

### Program/Source code

```c
/* Program to add two matrices of same size using functions */

#include <stdio.h>
#include <stdlib.h>

void printMatrix(int **a, int r, int c)
{
    int i, j;
    for (i = 0; i < r; i++) {
        for (j = 0; j < c; j++) {
            printf("%d ", a[i][j]);
        }
        printf("\n");
    }
}

void initializeMatrix(int **a, int r, int c)
{
    int i, j;
    for (i = 0; i < r; i++) {
        for (j = 0; j < c; j++) {
            printf("[%d][%d]: ", i, j);
            scanf("%d", &a[i][j]);
        }
    }
}

void addMatrix(int **a, int **b, int **res, int r, int c)
{
    int i, j;
    for (i = 0; i < r; i++) {
        for (j = 0; j < c; j++) {
            res[i][j] = a[i][j] + b[i][j];
        }
    }
}

int main(void)
{
    int r, c;
    printf("Enter the number of rows: ");
    scanf("%d", &r);
    printf("Enter the number of columns: ");
    scanf("%d", &c);
    int i, j;
    int **a = (int **)malloc(r * sizeof(int *));
    int **b = (int **)malloc(r * sizeof(int *));
    int **res = (int **)malloc(r * sizeof(int *));
    for (i = 0; i < r; i++) {
        a[i] = (int *)malloc(c * sizeof(int));
        b[i] = (int *)malloc(c * sizeof(int));
        res[i] = (int *)malloc(c * sizeof(int));
    }
    printf("Enter the elements of first matrix:\n");
    initializeMatrix(a, r, c);
    printf("Enter the elements of second matrix:\n");
    initializeMatrix(b, r, c);
    addMatrix(a, b, res, r, c);
    printf("The result matrix is:\n");
    printMatrix(res, r, c);
}
```

### Methods used

- `printMatrix(int **, int, int)`: This function will print the matrix.
- `initializeMatrix(int **, int, int)`: This function will initialize the matrix.
- `addMatrix(int **, int **, int **, int, int)`: This function will add the corresponding elements of the two matrices and store them in the result matrix.

### Explanation

The program begins with asking the number of rows and columns and then initializes the matrices using the function `initializeMatrix`. The program then calls the `addMatrix` function to add the corresponding elements of the two matrices and store them in the result matrix. The program then prints the result matrix.

### Time complexity

The time complexity of this algorithm is O(n^2).

### Space Complexity

Space complexity of this algorithm is O(n^2).

### Output

```
> ./matrix_add1
Enter the number of rows: 3
Enter the number of columns: 4
Enter the elements of first matrix:
[0][0]: 2
[0][1]: 765
[0][2]: 42
[0][3]: 52
[1][0]: 843
[1][1]: 45
[1][2]: 32
[1][3]: 91
[2][0]: 34
[2][1]: 25
[2][2]: 84
[2][3]: 26
Enter the elements of second matrix:
[0][0]: 48
[0][1]: 25
[0][2]: 18
[0][3]: 258
[1][0]: 59
[1][1]: 25
[1][2]: 89
[1][3]: 23
[2][0]: 28
[2][1]: 292
[2][2]: 5958
[2][3]: 56
The result matrix is:
    50    790     60    310 
   902     70    121    114 
    62    317   6042     82 
```
