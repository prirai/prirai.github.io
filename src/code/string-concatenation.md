---
layout: layouts/post.njk
title: Concatenation of two strings in C
description: In this tutorial we will be creating a C program which will concatenate two strings.
summary: In this tutorial we will be creating a C program which will concatenate two strings.
tags:
    - coding
    - c
date: 2022-07-25
---

This is a C program which will concatenate two strings.

## Algorithm

1. Take the two strings as input.
2. Concatenate the second string to the first string. 
3. Print the concatenated string.

## Naive Approach

In this approach, we will concatenate the second string to the first string without using any user or library functions.

### Methods used

#### Inbuilt
- memset(char*, int, int) - This function sets the first n characters of the string to the value of char*.
- printf(char*, ...) - This function prints the string to the standard output using specified format.

### Approach

1. Take the two strings as input.
2. Concatenate the second string to the first string after making sure that the first string has enough space to store the second string.
3. Print the concatenated string.

### Examples

Input: "Hello", "World"
Output: "HelloWorld"

Input: "India", "is my country"
Output: "Indiais my country"

### Program/Source code

```c
/* * C program to read two strings and concatenate them, without using * library functions. Display the concatenated string. */
#include <stdio.h>
#include <string.h>

int main(void)
{
	char string1[20], string2[20];
	int i, j;		/*  Initialize the string to NULL values */
	memset(string1, 0, 20);
	memset(string2, 0, 20);
	printf("Enter the first string : ");
	scanf("%s", string1);
	printf("Enter the second string: ");
	scanf("%s", string2);
	printf("First string  = %s\n", string1);
	printf("Second string = %s\n", string2);	/*  Concat the second string to the end of the first string */
	for (i = 0; string1[i] != '\0'; i++) { /*  null statement: simply traversing the string1 */ ;
	}
	for (j = 0; string2[j] != '\0'; i++) {
		string1[i] = string2[j++];
	}			/*  set the last character of string1 to NULL */
	string1[i] = '\0';
	printf("Concatenated string = %s\n", string1);
}
```
### Explanation

The program asks the user to enter the two strings. Making sure that the first string has enough space to store the second string and is null terminated. Then a loop passes all the stored characters in string1 and reaches the first null character. Then a loop passes all the stored characters in string2 and concatenates them to the end of string1. Finally, the concatenated string is printed.

### Time complexity

Time complexity of the above algorithm is O(n).

### Space Complexity

Space complexity of the above algorithm is O(1).

### Output

```
> ./str-concat-0 
Enter the first string : Hello
Enter the second string: WOrld
First string  = Hello
Second string = WOrld
Concatenated string = HelloWOrld

> ./str-concat-0
Enter the first string : India
Enter the second string: is my country
First string  = India
Second string = is my country
Concatenated string = Indiais my country
```

## Functional Approach

In this approach, we'll use a separate function to concatenate the second string to the first string.

### Methods used

* `char *str_concat(char*, char*)` - This function concatenates the second string to the first string.

#### Inbuilt functions used

- `malloc(size_t)` - This function allocates memory for the string.
- `scanf(char*, ...)` - This function reads the string from the standard input.
- `sizeof(char)` - This function returns the size of the character.

### Approach

1. Take the two strings as input.
2. Call the function `str_concat` to concatenate the second string to the first string.
3. Print the concatenated string.

### Examples

Input: "Privacy", "Hails"
Output: "PrivacyHails"

Input: "Lets", "code"
Output: "Letscode"

### Program/Source code

```c
/* C program to concatenate two strings */
#include <stdio.h>
#include <stdlib.h>

char *str_concat(char *str1, char *str2)
{
    char *str3;
    int i, j, k;
    i = j = k = 0;
    while (str1[i] != '\0')
        i++;
    while (str2[j] != '\0')
        j++;
    str3 = (char *)malloc((long unsigned) (i + j + 1) * sizeof(char));
    while (k < i)
        str3[k] = str1[k];
        k++;
    while (k < (i + j))
        str3[k] = str2[k - i];
        k++;
    str3[k] = '\0';
    return str3;
}

int main(void)
{
    printf("Enter first string: ");
    char str1[100];
    scanf("%s", str1);
    printf("Enter second string: ");
    char str2[100];
    scanf("%s", str2);
    char *str3;
    str3 = str_concat(str1, str2);
    printf("%s\n", str3);
    return 0;
}
```

### Explanation

The program asks the user to enter the two strings. Then the function `str_concat` is called to concatenate the second string to the first string. Finally, the concatenated string is printed.

In the `str_concat` function, we first initialize the variables `i`, `j` and `k` to 0. Then we traverse the first string and store the characters in `str3` until the first null character is encountered. Then we traverse the second string and store the characters in `str3` after the first null character.

### Time complexity

The time complexity of the above algorithm is O(n).

### Space Complexity

The space complexity of the above algorithm is O(n).

### Output

```
> ./str-concat 
Enter first string: Starry 
Enter second string: Night
StarryNight

> ./str-concat
Enter first string: Privacy
Enter second string: Hails
PrivacyHails
```

## Advanced Approach

In this approach, we'll use a separate function to concatenate the second string to the first string and make use of library functions.

### Methods used

* `char *str_concat(char*, char*)` - This function concatenates the second string to the first string and stores the concatenated string in a new string.

Inbuilt functions used

- `strcat(char*, char*)` - This function concatenates the second string to the first string.
- `strlen(char*)` - This function returns the length of the string.
- `malloc(size_t)` - This function allocates memory for the string.
- `scanf(char*, ...)` - This function reads the string from the standard input.
- `strcpy(char*, char*)` - This function copies the string from the second string to the first string.

### Approach

1. Take the two strings as input.
2. Call the function `str_concat` to concatenate the second string to the first string.
3. Allocate memory for the third string as the length of the first string plus the length of the second string.
4. Copy the first string to the third string using `strcpy` function.
5. Copy the second string to the third string using `strcat` function.
6. Print the concatenated string.

### Examples

Input: "The", "quick"
Output: "Thequick"

Input: "Lets", "code"
Output: "Letscode"

### Program/Source code

```c
/* C program to concatenate two strings without malloc */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char *str_concat(char *str1, char *str2)
{
    char *str3;
    str3 = (char *)malloc((strlen(str1) + strlen(str2) + 1) * sizeof(char));
    strcpy(str3, str1);
    strcat(str3, str2);
    return str3;
}

int main(void)
{
    printf("Enter first string: ");
    char str1[100];
    scanf("%s", str1);
    printf("Enter second string: ");
    char str2[100];
    scanf("%s", str2);
    char *str3;
    str3 = str_concat(str1, str2);
    printf("%s\n", str3);
    return 0;
}
```

### Explanation

In this program, we first ask the user to enter the two strings. Then the function `str_concat` is called to concatenate the second string to the first string and stores the concatenated string in a new string. Finally, the concatenated string is printed.

In the `str_concat` function, we first initialize the variable `str3` to point to the memory allocated for the third string. Then we copy the first string to the third string using `strcpy` function. Then we copy the second string to the third string using `strcat` function.

### Time complexity

The time complexity of the above algorithm is O(n).

### Space Complexity

The space complexity of the above algorithm is O(n).

### Output

```
> ./str-concat-2 
Enter first string: What
Enter second string: ToDo
WhatToDo

> ./str-concat-2
Enter first string: The
Enter second string: Rabbithole
TheRabbithole
```
