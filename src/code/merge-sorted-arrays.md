---
layout: layouts/plain.njk
title: C program to merge two sorted arrays
description: In this tutorial we will create a program in C which will merge two sorted arrays.
summary: In this tutorial we will create a program in C which will merge two sorted arrays.
tags:
  - c
  - coding
date: 2022-08-23
---

This tutorial will show you how to merge two sorted arrays in C.

## Problem description

We have two sorted arrays of integers and we want to merge them.

## Examples

```
input:
  - [1, 2, 3, 4, 5]
  - [6, 7, 8, 9, 10]

output:
  - [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
```

## Problem Solution

1. Create two arrays of integers.
2. Merge the two arrays.
3. Print the merged array.

## Approach using loop

In this approach, we will use a loop to iterate through the array and merge the two arrays.

### Approach

1. Create two arrays of integers.
2. Loop through the array and merge the two arrays.
3. Print the third array.

### Program/Source code

```c
#include <stdio.h>
#include <stdlib.h>

int main(void)
{
    int i, n, j, k;
    printf("Enter the size of the first array: ");
    scanf("%d", &n);
    int arr1[n];
    printf("Enter the elements of the first array: \n");
    for (i = 0; i < n; i++)
    {
        scanf("%d", &arr1[i]);
    }
    printf("Enter the size of the second array: ");
    scanf("%d", &k);
    int arr2[k];
    printf("Enter the elements of the second array: \n");
    for (j = 0; j < k; j++)
    {
        scanf("%d", &arr2[j]);
    }
    int arr3[n + k];
    i = j = 0;
    int in;
    for (in = 0; in < n + k; in ++)
    {
        if (i < n && j < k)
        {
            if (arr1[i] < arr2[j])
            {
                arr3[in] = arr1[i];
                i++;
            }
            else
            {
                arr3[in] = arr2[j];
                j++;
            }
        }
        else if (i < n)
        {
            arr3[in] = arr1[i];
            i++;
        }
        else
        {
            arr3[in] = arr2[j];
            j++;
        }
    }
    printf("The merged array is: \n");
    for (in = 0; in < n + k; in++)
    {
        printf("%d ", arr3[in]);
    }
    printf("\n");
    return 0;
}
```

### Explanation

The program starts with the declaration of two arrays of integers. The first and the second array are initialized with the size of the array. The elements of the first and the second array are then entered by the user. A loop is then used to iterate through the array and merge the two arrays. The merged array is then printed.

### Space Complexity

The space complexity of this algorithm is O(n + k) where n is the size of the first array and k is the size of the second array.

### Time Complexity

The time complexity of this algorithm is O(n + k) where n is the size of the first array and k is the size of the second array. This simplifies to O(n) as the loop is executed only once.

### Output

```
> ./merge-sorted-arrays      
Enter the size of the first array: 3
Enter the elements of the first array: 
12
18
23
Enter the size of the second array: 3
Enter the elements of the second array: 
13
19
27
The merged array is: 
12 13 18 19 23 27 
```

## Approach using pointers

In this approach, we will use pointers to merge the two arrays.

### Approach

1. Create two arrays of integers.
2. Merge the two arrays using pointers.
3. Print the merged array.

### Program/Source code

```c
#include <stdio.h>
#include <stdlib.h>

int main(void)
{
    int i, n, j, k;
    printf("Enter the size of the first array: ");
    scanf("%d", &n);
    int arr1[n];
    printf("Enter the elements of the first array: \n");
    for (i = 0; i < n; i++)
    {
        scanf("%d", &arr1[i]);
    }
    printf("Enter the size of the second array: ");
    scanf("%d", &k);
    int arr2[k];
    printf("Enter the elements of the second array: \n");
    for (j = 0; j < k; j++)
    {
        scanf("%d", &arr2[j]);
    }
    int *arr3 = (int *)malloc((n + k) * sizeof(int));
    i = j = 0;
    int in;
    for (in = 0; in < n + k; in ++)
    {
        if (i < n && j < k)
        {
            if (arr1[i] < arr2[j])
            {
                arr3[in] = arr1[i];
                i++;
            }
            else
            {
                arr3[in] = arr2[j];
                j++;
            }
        }
        else if (i < n)
        {
            arr3[in] = arr1[i];
            i++;
        }
        else
        {
            arr3[in] = arr2[j];
            j++;
        }
    }
    printf("The merged array is: \n");
    for (in = 0; in < n + k; in++)
    {
        printf("%d ", arr3[in]);
    }
    printf("\n");
    return 0;
}
```

### Explanation

The program asks the user to enter the size of the first and the second array. The elements of the first and the second array are then entered by the user. A loop is then used to iterate through the array and merge the two arrays. The merged array is then printed.

### Space Complexity

The space complexity of this algorithm is O(n + k) where n is the size of the first array and k is the size of the second array.

### Time Complexity

The time complexity of this algorithm is O(N).

### Outputs

```
> ./merge-sorted-arrays 
Enter the size of the first array: 4
Enter the elements of the first array: 
5
9
15
33
Enter the size of the second array: 5
Enter the elements of the second array: 
1
14
24
29
37
The merged array is: 
1 5 9 14 15 24 29 33 37 
```

## Approach using functions

In this approach, we will use functions to merge the two arrays.

### Approach

1. Create two arrays of integers.
2. Use memcpy to append the first array to the second array.
3. Use separate functions for printing array, merging the arrays and initializing the arrays.
4. Print the merged array.

### Program/Source code

```c
#include <stdio.h>
#include <stdlib.h>

void init(int *arr, int n)
{
    int i;
    for (i = 0; i < n; i++)
    {
        printf("%d ", i);
        scanf("%d", &arr[i]);
    }
}

void print_array(int *arr, int n)
{
    int i;
    printf("[ ");
    for (i = 0; i < n; i++)
    {
        printf("%d ", arr[i]);
    }
    printf("]\n");
}

void merge(int *arr1, int *arr2, int *arr3, int n, int k)
{
    int i = 0, j = 0, in = 0;
    while (i < n && j < k)
    {
        if (arr1[i] < arr2[j])
        {
            arr3[in] = arr1[i];
            i++;
        }
        else
        {
            arr3[in] = arr2[j];
            j++;
        }
        in++;
    }
    while (i < n)
    {
        arr3[in] = arr1[i];
        i++;
        in++;
    }
    while (j < k)
    {
        arr3[in] = arr2[j];
        j++;
        in++;
    }
}

int main(void)
{
    int i, n, j, k;
    printf("Enter the size of the first array: ");
    scanf("%d", &n);
    int arr1[n];
    printf("Enter the elements of the first array: \n");
    init(arr1, n);
    printf("Enter the size of the second array: ");
    scanf("%d", &k);
    int arr2[k];
    printf("Enter the elements of the second array: \n");
    init(arr2, k);
    int arr3[n + k];
    merge(arr1, arr2, arr3, n, k);
    printf("The merged array is: \n");
    print_array(arr3, n + k);
    return 0;
}

```

### Explanation

The program asks the user to enter the size of the first and the second array. The elements of the first and the second array are then entered by the user. The arrays are then merged using the merge_arrays function. The merged array is then printed. The memory is allocated using malloc.

### Space Complexity

The space complexity of this algorithm is O(n + k) where n is the size of the first array and k is the size of the second array.

### Time Complexity

The time complexity of this algorithm is O(N).

### Outputs

```
> ./merge-sorted-arrays      
Enter the size of the first array: 3
Enter the elements of the first array: 
0 12
1 56
2 99
Enter the size of the second array: 2
Enter the elements of the second array: 
0 15
1 60
The merged array is: 
[ 12 15 56 60 99 ]
```
