---
layout: layouts/plain.njk
title: C program to delete an element from an array
description: In this tutorial we will create a program in C which will delete an element from an array.
summary: In this tutorial we will create a program in C that will delete an element from an array.
tags:
  - c
  - coding
date: 2022-08-08
---

This tutorial will show you how to delete an element from an array in C.

## Problem description

We have an array of integers and we want to delete an element from it.

## Examples

```
input:
  - [1, 2, 3, 4, 5]
  - 3

output:
    - [1, 2, 4, 5]
```

## Problem Solution

1. Create an array of integers.
2. Ask the user to enter the index of the element to be deleted.
3. Delete the element from the array.
4. Print the array.

## Delete element by index

In this approach, we will use a loop to iterate through the array and delete the element from the array.

### Approach

1. Create an array of integers.
2. Ask the user to enter the index of the element to be deleted.
3. Loop through the array and delete the element from the array.
4. Print the array.

### Program/Source code

```c
#include <stdio.h>
#include <stdlib.h>

int main(void)
{
    int i, n, index, arr[10];
    printf("Enter the size of the array: ");
    scanf("%d", &n);
    printf("Enter the elements of the array: \n");
    for (i = 0; i < n; i++)
    {
        printf("%d: ", i);
        scanf("%d", &arr[i]);
    }
    printf("Enter the index of the element to be deleted: ");
    scanf("%d", &index);
    for (i = index; i < n - 1; i++)
        arr[i] = arr[i + 1];
    printf("The array after deleting the element is: ");
    for (i = 0; i < n - 1; i++)
        printf("%d ", arr[i]);
    return 0;
}
```

### Explanation

The program will ask the user to enter the size of the array and then the elements of the array. The program will then ask the user to enter the index of the element to be deleted. The program will then loop through the array and delete the element from the array. The program will then print the array.

### Space Complexity

The space complexity of this program is O(1).

### Time Complexity

The time complexity of this program is O(n).

### Output
```
> ./delete-element 
Enter the size of the array: 5
Enter the elements of the array: 
0: 1

1: 2

2: 3

3: 4

4: 5
Enter the index of the element to be deleted: 3
The array after deleting the element is: 1 2 3 5 
```

## Delete element by value

In this approach, we will use a loop to iterate through the array and delete the element from the array.

### Approach

1. Create an array of integers.
2. Ask the user to enter the value of the element to be deleted.
3. Loop through the array and delete the element from the array.
4. Print the array.

### Program/Source code

```c
#include <stdio.h>
#include <stdlib.h>

int main(void)
{
    int i, n, value, arr[10];
    printf("Enter the size of the array: ");
    scanf("%d", &n);
    printf("Enter the elements of the array: \n");
    for (i = 0; i < n; i++)
    {
        printf("%d: ", i);
        scanf("%d", &arr[i]);
    }
    printf("Enter the value of the element to be deleted: ");
    scanf("%d", &value);
    for (i = 0; i < n; i++)
    {
        if (arr[i] == value)
        {
            for (; i < n - 1; i++)
                arr[i] = arr[i + 1];
            break;
        }
    }
    printf("The array after deleting the element is: ");
    for (i = 0; i < n - 1; i++)
        printf("%d ", arr[i]);
    return 0;
}
```

### Explanation

The program will ask the user to enter the size of the array and then the elements of the array. The program will then ask the user to enter the value of the element to be deleted. The program will then loop through the array and delete the element from the array. The program will then print the array.

### Space Complexity

The space complexity of this program is O(1).

### Time Complexity

The time complexity of this program is O(n).

### Output
```
> ./delete-element
Enter the size of the array: 5
Enter the elements of the array:
0: 7
1: 12
2: 15
3: 18
4: 33
Enter the value of the element to be deleted: 15
The array after deleting the element is: 7 12 18 33
```

## Advanced approach

In this approach we'll use separate functions to delete elements by index or by value and give back the array after deleting the element.

### Approach

1. Create an array of integers.
2. Give the user the option to delete an element by index or by value.
3. Delete the element from the array.
4. Print the array.

### Program/Source code

```c
#include <stdio.h>
#include <stdlib.h>

int n;

void delete_element_by_index(int arr[], int index)
{
	int i;
	for (i = index; i < n - 1; i++)
		arr[i] = arr[i + 1];
	n -= 1;
}

void delete_element_by_value(int arr[], int value)
{
	int i;
	for (i = 0; i < n; i++) {
		if (arr[i] == value) {
			for (; i < n - 1; i++)
				arr[i] = arr[i + 1];
			n -= 1;
			break;
		}
	}
}

void print_array(int arr[])
{
	int i;
	printf("\n[ ");
	for (i = 0; i < n; i++)
		printf("%d ", arr[i]);
	printf("]\n");
}

void init_array(int arr[])
{
	int i;
	for (i = 0; i < n; i++) {
		printf("%d: ", i);
		scanf("%d", &arr[i]);
	}
}

int main(void)
{
	int index, value, arr[10], choice;
	printf("Enter the size of the array: ");
	scanf("%d", &n);
	printf("Enter the elements of the array: \n");
	init_array(arr);
	printf
	    ("You can delete an element by index or by value.\n1. Delete by index\n2. Delete by value\n");
	printf("Enter your choice: ");
	scanf("%d", &choice);
	if (choice == 1) {
		printf("Enter the index of the element to be deleted: ");
		scanf("%d", &index);
		delete_element_by_index(arr, index);
	} else {
		printf("Enter the value of the element to be deleted: ");
		scanf("%d", &value);
		delete_element_by_value(arr, value);
	}
	print_array(arr);
}

```

### Methods used

- `delete_element_by_index()` - This function will delete the element from the array by index.
- `delete_element_by_value()` - This function will delete the element from the array by value.
- `print_array()` - This function will print the array.

### Explanation

The program will ask the user to enter the size of the array and then the elements of the array. The program will then ask the user to enter the index of the element to be deleted. The program will provide a choice between deleting element by value or by index. The program will then call the function `delete_element_by_index()` to delete the element from the array. The program will then call the function `print_array()` to print the array. The program will then ask the user to enter the value of the element to be deleted. The program will then call the function `delete_element_by_value()` to delete the element from the array. The program will then call the function `print_array()` to print the array.

### Space Complexity

The space complexity of this program is O(1).

### Time Complexity

The time complexity of this program is O(n).

### Output

```
> ./delete-element-2 
Enter the size of the array: 4
Enter the elements of the array: 
0: 2
1: 8
2: 4
3: 9
You can delete an element by index or by value.
1. Delete by index
2. Delete by value
Enter your choice: 1
Enter the index of the element to be deleted: 2

[ 2 8 9 ]

> ./delete-element-2
Enter the size of the array: 6
Enter the elements of the array: 
0: 12
1: 65
2: 32
3: 75
4: 48
5: 11
You can delete an element by index or by value.
1. Delete by index
2. Delete by value
Enter your choice: 2
Enter the value of the element to be deleted: 32

[ 12 65 75 48 11 ]
```
