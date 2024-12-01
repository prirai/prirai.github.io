---
layout: layouts/post.njk
title: Sorting algorithms in C
tags:
    - programming
    - c
    - dsa
    - blog
date: 2022-02-25
---

I made this blog during my university course of Data Structures and Algorithms. As the code is completely
indigeneous, there might be some efficiency issues and you are free to point out if you find any.


Also you might checkout the project yourself on GitHub and star it and maybe verify the code yourself. I'd
be glad if you also contribute to the codebase by either submitting issues or create new source files for
various algorithms.


[DSA-using-C](https://github.com/prirai/DSA-using-C)

## Insertion Sort

```c
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void printar(int ar[], const char *name, unsigned int size) {
    printf("%s[] = [", name);
    for(unsigned int i = 0; i < size; i ++)
        printf(" %d", ar[i]);
    puts(" ]\n");
}

int *throwel(int *ar, int in) {
    int ptr = in - 1;
    while(ar[in] < ar[ptr] && in > 0) {
        printf("%d < %d\n", ar[in], ar[ptr]);
        int t = ar[in];
        ar[in] = ar[ptr];
        ar[ptr] = t;
        ptr --;
        in --;
    }
    return ar;
}

int *iterel(int *ar, unsigned int size) {
    for(unsigned int i = 0; i < size - 1; i ++) {
        if(ar[i] > ar[i + 1]) {
            printf("Pointer : ar[%d] = %d\n", i + 1, ar[i + 1]);
            memcpy(ar, throwel(ar, i + 1), size * sizeof(int));
            printar(ar, "ar", size);
        }
    }
    return ar;
}

int main(void) {
    puts("Enter the size of the array : ");
    unsigned int n = 10;
    scanf("%d", &n);
    int *array_to_sort = malloc(n * sizeof(int));
    puts("Enter the Array elements:\n");
    for(unsigned int i = 0; i < n; i ++) {
        printf("array_to_sort[%d] : ", i);
        scanf("%d", &array_to_sort[i]);
    }
    printar(array_to_sort, "array_to_sort", n);
    int *result_array = iterel(array_to_sort, n);
    printar(result_array, "result_array", n);
}

```

## Merge Sort

```c
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

void printar(int ar[], const char *name, unsigned int size) {
    printf("%s[] = [", name);
    for(unsigned int i = 0; i < size; i ++)
        printf(" %d", ar[i]);
    puts(" ]\n");
}

int *two_sort(int ar[]) {
    if(ar[0] > ar[1]) {
        int t = ar[0];
        ar[0] = ar[1];
        ar[1] = t;
    }
    return ar;
}

int *ar_merge(int *a, int *b, int as, int bs, unsigned int s) {
    int *arr = malloc(sizeof(s));
    int ain = 0, bin = 0;
    int al = 0, bl = 0;
    puts("Trying to merge these...\n");
    for(unsigned int i = 0; i < s; i ++)
    {
        al = (ain < as) ? a[ain] : 10000;
        bl = (bin < bs) ? b[bin] : 10000;
        if(al < bl) {
            printf("a[%d] = %d < b[%d] = %d\n", ain, a[ain], bin, b[bin]);
            arr[i] = al;
            ain ++;
        }
        else {
            printf("a[%d] = %d > b[%d] = %d\n", ain, a[ain], bin, b[bin]);
            arr[i] = bl;
            bin ++;
        }
    }
    printar(arr, "after merge", s);
    return arr;
}

int *partition(int *ar, unsigned int l, unsigned int h) {
    unsigned int s = h - l;
    int *arr = (int*) malloc(s * sizeof(int));
    if(s == 2)
        memcpy(arr, two_sort(ar), s * sizeof(int));
    else if(s == 1)
        memcpy(arr, ar, s * sizeof(int));
    else {
        puts("------------------------------------");
        int *ar2 = malloc(s/2 * sizeof(int));
        int *ar1 = malloc((s - s/2) * sizeof(int));
        for(unsigned int i = l; i < s - s/2 - l; i ++) {
            printf("i is %d, ar1[%d] = %d\n", i, i - l, ar[i]);
            ar1[i - l] = ar[i];
        }
        for(unsigned int i = s - s/2; i < s; i ++) {
        printf("i is %d, ar2[%d] = %d\n", i, i - s + s/2, ar[i]);
        ar2[i - s + s/2] = ar[i];
        }
        printar(ar1, "ar1", s - s/2 - l);
        printar(ar2, "ar2", h - s + s/2);
        ar1 = partition(ar1, 0, s - s/2 - l);
        ar2 = partition(ar2, 0, h - s + s/2);
        memcpy(arr, ar_merge(ar1, ar2, s - s/2 - l, h - s + s/2, s), s * sizeof(int));
    }
    return arr;
}

int main(void) {
    puts("Enter the size of the array : ");
    unsigned int n = 10;
    scanf("%ud", &n);
    int *array_to_sort = malloc(n * sizeof(int));
    puts("Enter the Array elements:\n");
    for(unsigned int i = 0; i < n; i ++) {
        printf("array_to_sort[%d] : ", i);
        scanf("%d", &array_to_sort[i]);
    }
    printar(array_to_sort, "array_to_sort", n);
    int *result_array = partition(array_to_sort, 0, n);
    printar(result_array, "result_array", n);
}
```