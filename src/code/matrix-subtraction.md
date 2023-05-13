---
layout: layouts/plain.njk
title: Matrix Subtraction in C
description: In this tutorial we will create a program in C which will subtract two matrices.
summary: In this tutorial we will create a program in C which will subtract two matrices of same size.
tags:
  - c
  - coding
date: 2022-08-30
---

In this tutorial we will create a program in C which will subtract two matrices of same size.

## Algorithm

In order to subtract two matrices, we need to subtract the corresponding elements of each matrix. Suppose we have two matrices of size m x n and p x q.

1. Take the number of rows and columns as input.
2. Store the number in a variable.
3. Initialize the first matrix.
4. Initialize the second matrix.
5. Initialize the result matrix.
6. Inside a loop, subtract the corresponding elements of the two matrices and store them in the result matrix.
7. Print the result matrix.

## Problem description

Given two matrices of same size, this program will subtract the corresponding elements of each matrix and print the result.

## Examples

```
Input:
First Matrix:
1 2 3
4 5 6
Second Matrix:
4 7 9
8 5 6

Output:
-3 -5 -6
-4 0 0
```

## Problem Solution

To approach this problem we'll use a for loop to loop through the number of rows and columns and subtract the corresponding elements of the two matrices and store them in the result matrix.

## Naive Approach

In this approach, we'll simply loop through the number of rows and columns and subtract the corresponding elements of the two matrices and store them in the result matrix.

### Program/Source code

```c
/* Program to subtract two matrices of same size */

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
    int a[r][c], b[r][c], res[r][c];
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
            res[i][j] = a[i][j] - b[i][j];
        }
    }
    printf("The result matrix is:\n");
    for (i = 0; i < r; i++) {
        for (j = 0; j < c; j++) {
            printf("%6d", res[i][j]);
        }
        printf("\n");
    }
}
```
### Explanation

The program will ask the user to enter the number of rows and columns and will return the result matrix. The program will loop through the number of rows and columns and subtract the corresponding elements of the two matrices and store them in the result matrix. 

Here, the memory allocation is done a bit differently. We'll use malloc to allocate the memory for the two matrices and the result matrix. First we allocate the rows of the three matrices and then we allocate the columns.

### Time complexity

Time complexity of this algorithm is O(n^2). For r rows and c columns, for initialization, we go through r*c elements. For subtraction, we go through r*c elements. So, the time complexity is O(r*c) which is roughly O(n^2) for comparable values of r and c.

### Space Complexity

Space complexity of this algorithm is O(n^2). For r rows and c columns, we need r*c elements to store the result matrix.

### Output

```
> ./matrix_sub 
Enter the number of rows: 4
Enter the number of columns: 4
Enter the elements of first matrix:
[0][0]: 34
[0][1]: 65
[0][2]: 12
[0][3]: 43
[1][0]: 15
[1][1]: 97
[1][2]: 35
[1][3]: 21
[2][0]: 4
[2][1]: 77
[2][2]: 10
[2][3]: 46
[3][0]: 39
[3][1]: 62
[3][2]: 36
[3][3]: 24
Enter the elements of second matrix:
[0][0]: 10
[0][1]: 35
[0][2]: 92
[0][3]: 48
[1][0]: 59
[1][1]: 27
[1][2]: 19
[1][3]: 38
[2][0]: 59
[2][1]: 3 
[2][2]: 47
[2][3]: 99
[3][0]: 37
[3][1]: 59
[3][2]: 86
[3][3]: 18
The result matrix is:
    24    30   -80    -5
   -44    70    16   -17
   -55    74   -37   -53
     2     3   -50     6
```

## Functional Approach

In this approach, we'll use a function to subtract the corresponding elements of the two matrices and store them in the result matrix.

### Approach

1. Create a function to subtract the corresponding elements of the two matrices and store them in the result matrix.
2. Ask the user to enter the number of rows and columns.
3. Initialize the first matrix.
4. Initialize the second matrix.
5. Initialize the result matrix.
6. Call the function to subtract the corresponding elements of the two matrices and store them in the result matrix.
7. Print the result matrix.

### Program/Source code

```c
/* Program to subtract two matrices of same size */

#include <stdio.h>
#include <stdlib.h>

void subtract(int **a, int **b, int **res, int r, int c)
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
    subtract(a, b, res, r, c);
    printf("The result matrix is:\n");
    for (i = 0; i < r; i++) {
        for (j = 0; j < c; j++) {
            printf("%6d", res[i][j]);
        }
        printf("\n");
    }
}

```

### Method used

- `subtract(int **, int **, int **, int, int)`: This function subtracts the corresponding elements of the two matrices and stores them in the result matrix.

### Explanation

The program will ask the user to enter the number of rows and columns. Then it will initialize the first matrix, initialize the second matrix and initialize the result matrix. The program will then call the function to subtract the corresponding elements of the two matrices and store them in the result matrix.

In the function, we'll loop through the number of rows and columns and subtract the corresponding elements of the two matrices and store them in the result matrix.

### Time complexity

Time complexity of this algorithm is O(n^2). For r rows and c columns, for initialization, we go through r*c elements. For subtraction, we go through r*c elements. So, the time complexity is O(r*c) which is roughly O(n^2) for comparable values of r and c.

### Space Complexity

Space complexity of this algorithm is O(n^2). For r rows and c columns, we need r*c elements to store the result matrix.

### Output

```
> ./matrix_sub      
Enter the number of rows: 3
Enter the number of columns: 2
Enter the elements of first matrix:
[0][0]: 23
[0][1]: 654
[1][0]: 35
[1][1]: 87
[2][0]: 46
[2][1]: 25
Enter the elements of second matrix:
[0][0]: 4
[0][1]: 75
[1][0]: 32
[1][1]: 78
[2][0]: 21
[2][1]: 11
The result matrix is:
    27   729
    67   165
    67    36
```

## Advanced approach

In this approach, we'll use functions to subtract the corresponding elements of the two matrices and store them in the result matrix.

### Approach

1. Create a function to subtract the corresponding elements of the two matrices and store them in the result matrix.
2. Create a function to initialize a matrix.
3. Create a function to print a matrix.
4. Ask the user to enter the number of rows and columns.
5. Initialize the first matrix using the function `initializeMatrix()`.
6. Initialize the second matrix using the function `initializeMatrix()`.
7. subtract the corresponding elements of the two matrices using the function `subtractMatrix()`.
8. Print the result matrix using the function `printMatrix()`.

### Program/Source code

```c
/* Program to subtract two matrices of same size using functions */

#include <stdio.h>
#include <stdlib.h>

void printMatrix(int **a, int r, int c)
{
    int i, j;
    for (i = 0; i < r; i++) {
        for (j = 0; j < c; j++) {
            printf("%6d", a[i][j]);
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

void subtractMatrix(int **a, int **b, int **res, int r, int c)
{
    int i, j;
    for (i = 0; i < r; i++) {
        for (j = 0; j < c; j++) {
            res[i][j] = a[i][j] - b[i][j];
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
    subtractMatrix(a, b, res, r, c);
    printf("The result matrix is:\n");
    printMatrix(res, r, c);
}
```

### Methods used

- `printMatrix(int **, int, int)`: This function will print the matrix.
- `initializeMatrix(int **, int, int)`: This function will initialize the matrix.
- `subtractMatrix(int **, int **, int **, int, int)`: This function will subtract the corresponding elements of the two matrices and store them in the result matrix.

### Explanation

The program begins with asking the number of rows and columns and then initializes the matrices using the function `initializeMatrix`. The program then calls the `subtractMatrix` function to subtract the corresponding elements of the two matrices and store them in the result matrix. The program then prints the result matrix.

### Time complexity

The time complexity of this algorithm is O(n^2). For r rows and c columns, for initialization, we go through r*c elements. For subtraction, we go through r*c elements. So, the time complexity is O(r*c) which is roughly O(n^2) for comparable values of r and c.

### Space Complexity

Space complexity of this algorithm is O(n^2). For r rows and c columns, we need r*c elements to store the result matrix.

### Output

```
> ./matrix_sub      
Enter the number of rows: 3
Enter the number of columns: 2
Enter the elements of first matrix:
[0][0]: 43
[0][1]: 76
[1][0]: 26
[1][1]: 56
[2][0]: 12
[2][1]: 62
Enter the elements of second matrix:
[0][0]: 12
[0][1]: 67
[1][0]: 42
[1][1]: 87
[2][0]: 45
[2][1]: 24
The result matrix is:
    31      9 
   -16    -31 
   -33     38 
```
