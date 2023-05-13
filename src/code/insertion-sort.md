---
layout: layouts/post.njk
title: Insertion sort in C
description: In this tutorial we will be creating a C program which will perform insertion sort and further analyze it for efficiency
summary: In this tutorial we will be creating a C program which will perform insertion sort and further analyze it for efficiency
tags:
    - coding
    - c
date: 2022-07-19
---

In this tutorial we will be creating a C program which will perform insertion sort and further analyze it for efficiency

## Problem Description

Ask the user to input an array of numbers and sort them using an implementation of the Insertion Sort algorithm.

Insertion Sort is basically insertion of an element from a random set of numbers, to its correct position where it should actually be, by shifting the other elements if required.

## Expected Input and Output/Examples

For insertion sort algorithm, we can have the following 3 different sets of input and output.

1. Average case (Unsorted array): When the input array has random distribution of numbers.

*For example:*
If the input array is {23, 87, 98, 34, 62, 38, 55, 11, 58, 34, 88, 47, 1} the expected output array will have data as {11, 23, 34, 34, 38, 47, 55, 58, 62, 87, 88, 98}.

2. Best case (Sorted Array): When the input array is already sorted, in that case we have to make minimum number of swaps.

*For example:*
If the input array has data as {-3, 31, 66}
then the expected output array will have data as {-3, 31, 66}

3. Worst Case (Reverse sorted array): When the array is sorted in a reverse manner, we have to make the maximum number of swaps.

*For example:*
If the input array has elements as {12, 9, 8, 5, 3, 2, 1}
then the output array will have data as {1, 2, 3, 5, 8, 9, 12}.

## Naive Solution

In this approach we simply traverse the array and by using a loop, we insert each element to its correct place and finally print the sorted array.

### Approach
1. We will store the random set of numbers in an array.
2. We will traverse this array and insert each element of this array, to its correct position where it should actually be, by shifting the other elements on the left if required.
3. The first element in the array is considered as sorted, even if it is an unsorted array. The array is sub-divided into two parts, the first part holds the first element of the array which is considered to be sorted and second part contains all the remaining elements of array.
4. With each iteration one element from the second part is picked and inserted into the first part of array at its correct position by shifting the existing elements if required.
5. This goes until the last element in second part of array is placed in correct position in the output array.
6. Now, we have the array in sorted order.

### Program/Source Code

```c
    /* C Program to sort an array in ascending order using Insertion Sort */
#include <stdio.h>
int main(void)
{
	int n, i, j, temp;
	int arr[64];
	printf("Enter number of elements\n");
	scanf("%d", &n);
	printf("Enter %d integers\n", n);
	for (i = 0; i < n; i++) {
		scanf("%d", &arr[i]);
	}
	for (i = 1; i < n; i++) {
		j = i;
		while (j > 0 && arr[j - 1] > arr[j]) {
			temp = arr[j];
			arr[j] = arr[j - 1];
			arr[j - 1] = temp;
			j--;
		}
	}
	printf("Sorted list in ascending order:\n");
	for (i = 0; i < n; i++) {
		printf("%d\n", arr[i]);
	}
	return 0;
}
```
### Program Explanation

1. Using a for loop, we are reading n elements from standard input into an array named arr.
2. Next, we are comparing elements of the array so that we can insert them in the proper position using the insertion sort method.
3. At the end, we are printing/displaying the sorted array.

### Time Complexity

The worst and average case time complexity is O(N^2) while the best case time complexity is O(N).

### Space Complexity

The space complexity for insertion sort is O(1) if we only consider the order of space used excluding the array.

### Runtime Test Cases

Here’s the run time test cases for Insertion sort algorithm for 3 different input cases.

Test case 1 – Average case: Here, the elements are entered in random order.
```
/* Average case */

Enter number of elements
5
Enter 5 integers
3 7 2 9 5
Sorted list in ascending order:
2
3
5
7
9
```

Test case 2 – Best case: Here, the elements are already sorted.
```
/* Best case */

Enter number of elements
3
Enter 3 integers
-3 31 66
Sorted list in ascending order:
-3
31
66
```

Test case 3 – Worst case: Here, the elements are reverse sorted.
```
/* Worst case */

Enter number of elements
5
Enter 5 integers
9 8 6 3 1
Sorted list in ascending order:
1
3
6
8
9
```


## Solution using separate functions

This approach is almost similar to the previous one except that hee we take a separate function and take memory safety into consideration. We take an element and compare it to the elements at lower indices and if its smaller, swaps it and rechecks for the condition until it fails, thereby taking the next element in the array.

### Approach
1. We will store the random set of numbers in an array.
2. We will traverse this array and insert each element of this array, to its correct position where it should actually be, by shifting the other elements on the left if required.
3. The first element in the array is considered as sorted, even if it is an unsorted array. The array is sub-divided into two parts, the first part holds the first element of the array which is considered to be sorted and second part contains all the remaining elements of array.
4. With each iteration one element from the second part is picked and inserted into the first part of array at its correct position by shifting the existing elements if required.
5. This goes until the last element in second part of array is placed in correct position in the output array.
6. Now, we have the array in sorted order.

*For example:*
If we have the array as {[ 5 8 2 9 12 18 11 7 16 10 19 1 ]
and we apply insertion sort to sort the array,
then the resultant array after each iteration will be as follows:
```bash
Original array: [ 5 8 2 9 12 18 11 7 16 10 19 1 ]

Array after first iteration is      [ 2 5 8 9 12 18 11 7 16 10 19 1 ]
Array after second iteration is     [ 2 5 8 9 11 12 18 7 16 10 19 1 ]
Array after third iteration is      [ 2 5 7 8 9 11 12 18 16 10 19 1 ]
Array after fourth iteration is     [ 2 5 7 8 9 11 12 16 18 10 19 1 ]
Array after fifth iteration is      [ 2 5 7 8 9 10 11 12 16 18 19 1 ]
Array after sixth iteration is		[ 2 5 7 8 9 10 11 12 16 18 19 1 ]
Array after seventh iteration is	[ 1 2 5 7 8 9 10 11 12 16 18 19 ]
Sorted array is						[ 1 2 5 7 8 9 10 11 12 16 18 19 ]
```
## Program/Source Code

Here is source code of the C Program to sort an array of integers using Insertion Sort Algorithm. The program is successfully compiled and tested on GNU gcc compiler in linux. The program output is also shown below.

```c
    /* C Program to sort an array in ascending order using Insertion Sort using separate function */

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int *insertionsort(int[], int);
int main(void)
{
	int n;
	puts("Enter the value of n : ");
	scanf("%d", &n);
	int *A = malloc((size_t)n * sizeof(int));
	puts("******************************");
	puts("\nEnter the elements of the array :");
	puts("\n******************************");
	puts("\nUnsorted array :\n");
	for (int i = 0; i < n; i++) {
		scanf("%d", &A[i]);
	}
	int *result = insertionsort(A, n);
	printf("\n%d", result[0]);
	puts("\n******************************");
	puts("\nRequired sorted array : ");
	for (int j = 0; j < n; j++) {
		printf(" %d", result[j]);
	}
}

int *insertionsort(int a[], int m)
{
	for (int i = 1; i < m; i++) {
		int temp, j;
		temp = a[i];
		j = i - 1;
		while ((temp < a[j]) && (j >= 0)) {
			a[j + 1] = a[j];
			j = j - 1;
		}
		a[j + 1] = temp;
	}
	return a;
}
```

### Program Explanation

1. Using a for loop, we first take a size as user input from n and then make an array and assign it space through `malloc`, read the n elements from standard input into the array named A.
2. Next, we are comparing elements of the array so that we can insert them in the proper position using the insertion sort method.
3. At the end, we are printing/displaying the sorted array.
Runtime Test Cases

### Time Complexity

The worst and average case time complexity is O(N^2) while the best case time complexity is O(N).

### Space Complexity

The space complexity for insertion sort is O(1) if we only consider the order of space used excluding the array.

### Runtime Test Cases
Test case 1 – Average case: Here, the elements are entered in random order.

/* Average case */
 ```bash
> ./insert1
Enter the value of n :
12
******************************

Enter the elements of the array :

******************************

Unsorted array :

23
87
98
34
62
38
55
11
58
34
88
47
11
******************************

Required sorted array :
 11 23 34 34 38 47 55 58 62 87 88 98
```
Test case 2 – Best case: Here, the elements are already sorted.

/* Best case */
 ```bash
> ./insert1
Enter the value of n :
12
******************************

Enter the elements of the array :

******************************

Unsorted array :

1
4
6
9
11
15
17
19
24
28
39
47
1
******************************

Required sorted array :
 1 4 6 9 11 15 17 19 24 28 39 47
```
Test case 3 – Worst case: Here, the elements are reverse sorted.

/* Worst case */
 ```bash
> ./insert1
Enter the value of n :
12
******************************

Enter the elements of the array :

******************************

Unsorted array :

47
39
28
24
19
17
15
11
9
6
4
1

1
******************************

Required sorted array :
 1 4 6 9 11 15 17 19 24 28 39 47
```

## Advanced approach/Recursive approach
In this approach we'll be using more verbosity in our code and taking help of more functions while also keeping memory safety in mind and using in-built functions like `malloc` and `memcpy` whenever needed.

*Example:*

```bash
array_to_sort[] = [ 12 45 65 23 11 ]
array after first iteration = [ 12 23 45 65 11 ]
array after second iteration = [ 11 12 23 45 65 ]
array after third iteration = [ 11 12 23 45 65 ]
result = [ 11 12 23 45 65 ]
```

### Explanation
Suppose the user enters the array as  [ 12 45 65 23 11 ].
The array goes into the iterel function which checka whether an element is smaller than the element just the right of it. If true, signify that the pointer is on that element and send the array to throwel to compare and swap the elements as long as index is greater than 0 because for in = 0, the comparision will be with -1 which doesn't exist in an array and will give an error. Also print the comparisions as we're preforming them and then return back to the iterel function and print the array at it's current state.
Continue the same until the loop reaches the size of the array, the point where we get out of the array and return back to the main function and print the final array.
### Program/Source Code
This program has been successfully compiled with addtional flags using gcc 12.1.0.
```c
    /* C Program to sort an array in ascending order using Insertion Sort using separate function and keeping memory safety*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Simple function for printing the array in a nice way
void printarray(int ar[], const char *name, unsigned int size)
{
	printf("%s[] = [", name);
	for (unsigned int i = 0; i < size; i++)
		printf(" %d", ar[i]);
	puts(" ]\n");
}

int *throwel(int *ar, unsigned int in)
{
	unsigned int ptr = in - 1;
	while (in > 0 && ar[in] < ar[ptr]) {
		// Verbose output for showing what comparisions are being done
		printf("%d < %d\n", ar[in], ar[ptr]);
		int t = ar[in];
		ar[in--] = ar[ptr];
		ar[ptr--] = t;
	}
	return ar;
}

int *iterel(int *ar, unsigned int size)
{
	for (unsigned int i = 0; i < size - 1; i++) {
		if (ar[i] > ar[i + 1]) {
			// Tell where the pointer is at and send the array and the pointer index to throwel and receive it later
			printf("Pointer : ar[%d] = %d\n", i + 1, ar[i + 1]);
			memcpy(ar, throwel(ar, i + 1), size * sizeof(int));
			printarray(ar, "ar", size);
		}
	}
	return ar;
}

int main(void)
{
	puts("Enter the size of the array : ");
	unsigned int n = 10;
	scanf("%d", &n);
	int *array_to_sort = malloc(n * sizeof(int));
	puts("Enter the Array elements:\n");
	for (unsigned int i = 0; i < n; i++) {
		printf("array_to_sort[%d] : ", i);
		scanf("%d", &array_to_sort[i]);
	}
	// Print the array before sorting
	printarray(array_to_sort, "array_to_sort", n);
	int *result_array = iterel(array_to_sort, n);
	printarray(result_array, "result_array", n);
}
```

### Time Complexity

The worst and average case time complexity is O(N^2) while the best case time complexity is O(N).

### Space Complexity

The space complexity for insertion sort is O(1) if we only consider the order of space used excluding the array.

### Runtime Test Cases
Test case 1 – Average case: Here, the elements are entered in random order.

 ```bash
 /* Average case */
> ./insert2
Enter the size of the array : 
5
Enter the Array elements:

array_to_sort[0] : 12
array_to_sort[1] : 45
array_to_sort[2] : 65
array_to_sort[3] : 23
array_to_sort[4] : 11
array_to_sort[] = [ 12 45 65 23 11 ]

Pointer : ar[3] = 23
23 < 65
23 < 45
ar[] = [ 12 23 45 65 11 ]

Pointer : ar[4] = 11
11 < 65
11 < 45
11 < 23
11 < 12
ar[] = [ 11 12 23 45 65 ]

result_array[] = [ 11 12 23 45 65 ]
```
Test case 2 – Best case: Here, the elements are already sorted.

 ```bash
 /* Best case */
> ./insert2
Enter the size of the array : 
5
Enter the Array elements:

array_to_sort[0] : 1
array_to_sort[1] : 6
array_to_sort[2] : 15
array_to_sort[3] : 33
array_to_sort[4] : 56
array_to_sort[] = [ 1 6 15 33 56 ]

result_array[] = [ 1 6 15 33 56 ]
```
Test case 3 – Worst case: Here, the elements are reverse sorted.


 ```bash
 /* Worst case */
> ./insert2
Enter the size of the array : 
6
Enter the Array elements:

array_to_sort[0] : 34
array_to_sort[1] : 27
array_to_sort[2] : 21
array_to_sort[3] : 15
array_to_sort[4] : 11
array_to_sort[5] : 5
array_to_sort[] = [ 34 27 21 15 11 5 ]

Pointer : ar[1] = 27
27 < 34
ar[] = [ 27 34 21 15 11 5 ]

Pointer : ar[2] = 21
21 < 34
21 < 27
ar[] = [ 21 27 34 15 11 5 ]

Pointer : ar[3] = 15
15 < 34
15 < 27
15 < 21
ar[] = [ 15 21 27 34 11 5 ]

Pointer : ar[4] = 11
11 < 34
11 < 27
11 < 21
11 < 15
ar[] = [ 11 15 21 27 34 5 ]

Pointer : ar[5] = 5
5 < 34
5 < 27
5 < 21
5 < 15
5 < 11
ar[] = [ 5 11 15 21 27 34 ]

result_array[] = [ 5 11 15 21 27 34 ]
```

While all the approaches have more or less the same complexity, using more function and using standard practices does make the code more readable.
