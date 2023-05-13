``---
layout: layouts/plain.njk
title: Knuth Morris Pratt String Matching problem in C
description: In this tutorial we will create a program in C which will ask the user to enter a word and a main string and search for the occurrences for the word in the main string.
summary: In this tutorial we will create a program in C that will ask the user to enter a word and a main string and search for the occurrences for the word in the main string.
tags:
  - c
  - coding
date: 2022-08-05
---

This is an implementation of Knuth Morris Pratt algorithm for string matching in C.

## Knuth Morris Pratt algorithm

The KMP algorithm is a very fast algorithm for string matching. It is used in many applications like searching for a substring in a large string. The algorithm is based on the idea that if we know the longest prefix of the pattern that is also a suffix of the pattern, then the pattern can be searched in O(n) time. This is called the **Knuth-Morris-Pratt algorithm**. If a mismatch occurs, we can simply skip the characters of the pattern already matched. We can do this by specifying the length of the longest prefix which is also a suffix. This way we can skip the characters of the pattern already matched. This is called the **skip table**. 

## Algorithm

1. Take the word as input.
2. Take the main string as input.
3. Create a skip table for the word.
4. Create a variable to store the index of the word.
5. Create a variable to store the index of the main string.
6. Loop through the main string and check whether the word is a substring of the main string.
7. If the word is a substring of the main string, print the index of the word.
8. If the word is not a substring of the main string, print the index of the main string.
9. Repeat the process until the end of the main string is reached.
10. If the word is not found, print "The word is not found".

## Problem description

This program will ask the user for a word and a main string and then search for the occurrences for the word in the main string.

## Examples

```
Input: word: abc, main string: abcabc
Output: The word is found at index 0
```

## Naive Approach

In this approach we'll not make use of any functions. We'll just loop through all the characters of the main string and check whether the word is a substring of the main string.

### Approach

1. Take the word as input.
2. Store the word in a variable.
3. Take the main string as input.
4. Store the main string in a variable.
5. Create a skip table for the word.
6. Create a variable to store the index of the word.
7. Create a variable to store the index of the main string.
8. Loop through the main string and check whether the word is a substring of the main string.
9. If the word is a substring of the main string, print the index of the word.
10. If the word is not a substring of the main string, print the index of the main string.
11. Repeat the process until the end of the main string is reached.
12. If the word is not found, print "The word is not found".

### Program/Source code

```c
#include <stdio.h>
#include <string.h>
#include <ctype.h>

void inputLine(char *line, int maxLen) {
    fflush(stdin);
    int i = 0;
    char c;
    while ((c = getchar()) != '\n' && i < maxLen) {
        line[i++] = tolower(c);
    }
    line[i] = '\0';
}

int main(void)
{
    char word[100];
    char mainString[100];
    int i, j, k;
    int wordLen, mainStringLen;
    int skipTable[100];
    int wordIndex, mainStringIndex;
    printf("Enter the word: ");
    inputLine(word, 100);
    printf("Enter the main string: ");
    inputLine(mainString, 100);
    wordLen = strlen(word);
    mainStringLen = strlen(mainString);
    for (i = 0; i < wordLen; i++) {
        skipTable[i] = 1;
    }
    for (i = 1; i < wordLen; i++) {
        j = i - 1;
        k = i;
        while (j >= 0 && word[j] == word[k]) {
            skipTable[k] = j + 1;
            j--;
            k--;
        }
    }
    wordIndex = 0;
    mainStringIndex = 0;
    while (mainStringIndex < mainStringLen) {
        if (word[wordIndex] == mainString[mainStringIndex]) {
            wordIndex++;
            mainStringIndex++;
        } else {
            mainStringIndex += skipTable[wordIndex];
            wordIndex = 0;
        }
        if (wordIndex == wordLen) {
            printf("The word is found at index %d\n", mainStringIndex - wordLen);
            wordIndex = 0;
        }
    }
    if (wordIndex != 0) {
        printf("The word is not found\n");
    }
    return 0;
}
```

### Explanation

This is the naive approach. We'll loop through all the characters of the main string and check whether the word is a substring of the main string. If the word is a substring of the main string, we'll print the index of the word. If the word is not a substring of the main string, we'll print the index of the main string.

### Time complexity

Time complexity of this algorithm is O(n).

### Space Complexity

Space complexity of this algorithm is O(n).

### Output
```
> ./kmp-str-match 
Enter the word: aba
Enter the main string: abc ana dhg aana aba
The word is found at index 17

> ./kmp-str-match
Enter the word: dhg
Enter the main string: abc ana dhg aana aba
The word is found at index 8
```
