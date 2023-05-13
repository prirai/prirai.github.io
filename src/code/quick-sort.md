---
layout: layouts/post.njk
title: Quicksort in C
description: In this tutorial we will be creating a C program which performs quick sort on an array of integers entered by the user.
summary: In this tutorial we will be creating a C program which performs quick sort on an array of integers entered by the user.
tags: 
    - coding
    - c 
date: 2022-07-20
---

# Quicksort

Quick sort is a divide and conquer algorithm. It works by recursively partitioning the array into two parts, the left side of the array containing elements less than the pivot element, and the right side of the array containing elements greater than the pivot element.

# Algorithm

1. Pick an element, called a pivot, from the array.
2. Partition the array into two halves, the left side of the array containing elements less than the pivot element, and the right side of the array containing elements greater than the pivot element.
3. Recursively sort the left side of the array and the right side of the array.
4. Return the array.

# Problem description

Given an array of integers, sort the array using an implementation of the quick sort algorithm in C.

# Problem Solution

To approach this problem, we will use the divide and conquer algorithm. We will start by picking a pivot element, and partitioning the array into two halves. We will then recursively sort the left side of the array and the right side of the array. We will then return the array.

## Naive Approach

In this approach we will not use recursion. We will instead use a while loop to iterate through the array. We will pick a pivot element, and partition the array into two halves. We will then iterate through the array again, and pick a new pivot element, and partition the array into two halves. We will continue this process until we have only one element left in the array.

### Methods used

* `int quickSort(int arr[], int low, int high)`
This function will take in an array, and the low and high indices of the array. It will then pick a pivot element, and partition the array into two halves. It will then iterate through the array again, and pick a new pivot element, and partition the array into two halves. It will continue this process until we have only one element left in the array.

### Approach

1. Pick a pivot element, and partition the array into two halves.
2. Iterate through the array, and pick a new pivot element, and partition the array into two halves.
3. Continue this process until we have only one element left in the array.
4. Return the array.
### Examples

Suppose we have the following array: {4, 7, 2, 9, 11, 3, 1, 6}
We assign low as 0 and high as n - 1. We set the pivot element to the element with the index high. Here, high is 7 and pivot is 6. We set k as low - 1 which is -1 here. While entering the loop, k becomes 1 and for all elements with indices equal to low and less than high are compared and if they are less than or equal to the pivot element, we swap them.
We set temp as the element at index k + 1 and swap it with the element at index high. We then set pi as k + 1. We continue this process until we have only one element left in the array. We finally sent the array, lower index and upper index to the quickSort function.
In the quickSort function, we assign i as low and j as high. We set the element at the middle index as the pivot. We then increment i by the number of elements which are less than the pivot element. We then decrement j by the number of elements which are greater than the pivot element. We then swap the element at index i with the element at index j if i is less than equal to j which means we are checking here for the condition when all the elements have been sorted then it should not work. We then set the pivot element as the element at index j. We then continue this process until we have only one element left in the array and this loop continues until i is not greater than j. We call the same function recursively on the left side of the array and the right side of the array. Finally, we return the array.

### Program/Source code

```c
/* C program to sort an array of integers using quick sort without recursion */

#include <stdio.h>
#include <stdlib.h>

int quickSort(int *arr, int low, int high)
{
 int i = low, j = high;
 int pivot = arr[(low + high) / 2];
 while (i <= j) {
  while (arr[i] < pivot)
   i++;
  while (arr[j] > pivot)
   j--;
  if (i <= j) {
   int temp = arr[i];
   arr[i] = arr[j];
   arr[j] = temp;
   i++;
   j--;
  }
 }
 if (low < j)
  quickSort(arr, low, j);
 if (i < high)
  quickSort(arr, i, high);
 return 0;
}

int main(void)
{
 puts("Enter the number of elements in the array: ");
 int n;
 scanf("%d", &n);
 int arr[n];
 puts("Enter the elements of the array: ");
 for (int i = 0; i < n; i++) {
  printf("%d: ", i);
  scanf("%d", &arr[i]);
 }
 int low = 0;
 int high = n - 1;
 int pivot = arr[high];
    int k = low - 1;
    for (int j = low; j < high; j++) {
        if (arr[j] <= pivot) {
            k++;
            int temp = arr[k];
            arr[k] = arr[j];
            arr[j] = temp;
        }
    }
    int temp = arr[k + 1];
    arr[k + 1] = arr[high];
    arr[high] = temp;
    int pi = k + 1;
 quickSort(arr, low, pi - 1);
 quickSort(arr, pi + 1, high);
 puts("The sorted array is: ");
 for (int i = 0; i < n; i++) {
  printf("%d ", arr[i]);
 }
 return 0;
}
```

### Explanation

The program starts with asking the user for entering the size for the array and subsequently entering the array elements. Then we will pick a pivot element, and partition the array into two halves. We will then iterate through the array again, and pick a new pivot element, and partition the array into two halves. We will continue this process until we have only one element left in the array. We will then return the array.

### Output
    
```bash
> ./quick0
Enter the number of elements in the array: 
8
Enter the elements of the array: 
0: 4   
1: 7 
2: 2 
3: 9
4: 11 
5: 3
6: 1
7: 6
The sorted array is: 
1 2 3 4 6 7 9 11
```

## Recursive Approach

    In this approach we will use recursion. We will pick a pivot element, and partition the array into two halves. We will then recursively sort the left side of the array and the right side of the array. We will then return the array.

### Methods used

The methods used are:

    * `void quickSort(int arr[], int low, int high)`
    * `int partition(int arr[], int low, int high)`

### Approach

    1. Pick a pivot element, and partition the array into two halves.
    2. Recursively sort the left side of the array and the right side of the array.
    3. Return the array.

### Examples

For example, suppose we have the following array: {5, 2, 9, 1, 3, 7, 8, 6}
Control goes into quickSort(arr, 0, 7). Low is less than  high, thus partition(arr, 0, 7) is invoked. pivot is the last element ie. 6. We set i as low - 1 which is -1 here. While entering the loop, k becomes 1 and for all elements with indices equal to low and less than high are compared and if they are less than or equal to the pivot element, we swap them. We set temp as the element at index i + 1 and swap it with the element at index high. We then return and set pi as i + 1. We continue this process until we have only one element left in the array. We then print the result.

### Program/Source code

```c
// C program to perform quick sort on a user provided array using recursion
#include <stdio.h>

int partition(int ar[], int low, int high)
{
    int pivot = ar[high];
    int i = low - 1;
    for (int j = low; j < high; j++) {
        if (ar[j] <= pivot) {
            i++;
            int temp = ar[i];
            ar[i] = ar[j];
            ar[j] = temp;
        }
    }
    int temp = ar[i + 1];
    ar[i + 1] = ar[high];
    ar[high] = temp;
    return i + 1;
}

void quickSort(int arr[], int low, int high)
{
	if (low < high) {
		int pi = partition(arr, low, high);

		quickSort(arr, low, pi - 1);
		quickSort(arr, pi + 1, high);
	}
}

int main(void)
{
	puts("Enter the number of elements in the array: ");
	int n;
	scanf("%d", &n);
	int arr[n];
	puts("Enter the elements of the array: ");
	for (int i = 0; i < n; i++) {
        printf("%d: ", i);
		scanf("%d", &arr[i]);
	}
	quickSort(arr, 0, n - 1);
	puts("The sorted array is: ");
	for (int i = 0; i < n; i++) {
		printf("%d ", arr[i]);
	}
}
```
### Explanation

The program starts with asking the user to enter the size of the array. Then we will enter the elements of the array. We will then call the quickSort function on the array. We check if low is less than high, if it is then we will pick a pivot element, and partition the array into two halves. We will then recursively sort the left side of the array and the right side of the array. We will then return the array.

### Output

```bash
> ./quicksort-recur
Enter the number of elements in the array: 
6
Enter the elements of the array: 
0: 12
1: 76
2: 33
3: 65
4: 5
5: 88
The sorted array is: 
5 12 33 65 76 88
```

## Recursion and modular approach

In this approach, in addition to having recursion in order to keep our code as small as possible, we'll also be taking care not to reuse things and taking care for memory safety whenever possible. For this, we make sure that we don't use the same array twice, and that we don't use the same pointer twice. We'll also use `malloc` to allocate memory for the array and swap function to swap two elements.

### Methods used

The methods used are:

1. `malloc` to allocate memory for the array -- inbuilt function
2. `swap` to swap two elements. -- without using auxillary variable.
3. `partition` to partition the array.
4. `quickSort` to sort the array.

### Approach

1. Pick a pivot element, and partition the array into two halves.
2. Recursively sort the left side of the array and the right side of the array.
3. At the places of swap, use the defined `swap` function to swap the elements.
4. Return the array.

### Examples

Suppose we have the following array: {4, 6, 3, 5, 1, 2, 7, 8} defined through malloc. We will call the quickSort function on the array.
Control goes into quickSort(arr, 0, 7). Low is less than  high, thus partition(arr, 0, 7) is invoked. pivot is the last element ie. 8. We set i as low - 1 which is -1 here. While entering the loop, k becomes 1 and for all elements with indices equal to low and less than high are compared and if they are less than or equal to the pivot element, we swap them using the `swap` function. We set temp as the element at index i + 1 and swap it with the element at index high. We then return and set pi as i + 1. We continue this process until we have only one element left in the array. We then print the result.

### Program/Source code

```c
// C program to perform QuickSort on a user provided array using recursion.

#include <stdio.h>
#include <stdlib.h>

int n;

void printarray(int ar[], const char *name, unsigned int size)
{
	printf("%s[] = [", name);
	for (unsigned int i = 0; i < size; i++)
		printf(" %d", ar[i]);
	puts(" ]\n");
}

void swap(int *a, int *b)
{
	if(*a == *b) return;
	*a = *a + *b;
	*b = *a - *b;
	*a = *a - *b;
}

int partition(int *ar, int low, int high)
{
	int pivot = ar[high];
	int i = low - 1;
	for (int j = low; j < high; j++)
	{
		if (ar[j] <= pivot)
		{
			i++;
			swap(&ar[i], &ar[j]);}
}
	swap(&ar[i + 1], &ar[high]);
	return i + 1;
}

void quickSort(int *arr, int low, int high)
{
	if (low < high) {
		int pi = partition(arr, low, high);
		quickSort(arr, low, pi - 1);
		printarray(arr, "arr", (unsigned) n);
		quickSort(arr, pi + 1, high);
		printarray(arr, "arr", (unsigned) n);
	}
}

int main(void)
{
	puts("Enter the number of elements in the array: ");

	scanf("%d", &n);
	int *arr = malloc((size_t) n * sizeof(n));
	puts("Enter the elements of the array: ");
	for (int i = 0; i < n; i++) {
		printf("%d: ", i);
		scanf("%d", &arr[i]);
	}
	quickSort(arr, 0, n - 1);
}

```

### Explanation

The program starts with asking the user to enter the size of the array and then assigns it space with malloc. Then the user enters the elements of the array. We then call the quickSort function on the array. We check if low is less than high, if it is then we will pick a pivot element, and partition the array into two halves. We will then recursively sort the left side of the array and the right side of the array. We will then return the array.

### Output
```
> ./quicksort-func    
Enter the number of elements in the array: 
7
Enter the elements of the array: 
0: 9
1: 69
2: 12
3: 34
4: 22
5: 1
6: 7
arr[] = [ 1 7 12 34 22 9 69 ]

arr[] = [ 1 7 9 34 22 12 69 ]

arr[] = [ 1 7 9 12 22 34 69 ]

arr[] = [ 1 7 9 12 22 34 69 ]

arr[] = [ 1 7 9 12 22 34 69 ]

arr[] = [ 1 7 9 12 22 34 69 ]

arr[] = [ 1 7 9 12 22 34 69 ]

arr[] = [ 1 7 9 12 22 34 69 ]

arr[] = [ 1 7 9 12 22 34 69 ]

arr[] = [ 1 7 9 12 22 34 69 ]
```


## Time and space complexity analysis for QuickSort algorithm

### Time complexity

The time complexity of the quick sort algorithm is O(N log N).

### Space Complexity
    
The space complexity of the algorithm is O(n).
