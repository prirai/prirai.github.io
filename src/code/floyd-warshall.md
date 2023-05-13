---
layout: layouts/plain.njk
title: Floyd-Warshall algorithm in C
description: In this tutorial we will create a program in C which will find the shortest path between two vertices in a graph using the Floyd-Warshall algorithm.
summary: In this tutorial we will create a program in C which will find the shortest path between two vertices in a graph using the Floyd-Warshall algorithm.
tags:
  - c
  - coding
date: 2022-08-01
---

# Floyd-Warshall algorithm in C

This C program will find the shortest path between two vertices in a graph using the Floyd-Warshall algorithm.

## Floyd-Warshall algorithm

The Floyd-Warshall algorithm is a graph algorithm that finds the shortest path between two vertices in a graph in a weighted graph with positive or negative edge weights but without negative cycles. The algorithm is named after the British mathematician Floyd Warshall. The algorithm is also known as the all-pairs shortest path algorithm.

The algorithm compares all possible paths between two vertices in a graph and finds the shortest path. It does so in O(V^3) time even when the graph is sparse.

In this algorithm, we will use a matrix to represent the graph. The matrix will have the following structure:

```
[
  [0, 1, 2, 3, 4],
  [1, 0, 5, 6, 7],
  [2, 5, 0, 8, 9],
  [3, 6, 8, 0, 10],
  [4, 7, 9, 10, 0]
]
```

Then, we will use the following formula to find the shortest path between two vertices:

```
d[i][j] = min(d[i][j], d[i][k] + d[k][j])
```

## Example

The matrix input is as follows:

```
4 2 5 2 
4 3 1 4 
2 5 2 1 
5 3 1 4 
```

The shortest path matrix is:

```
4 2 3 2 
3 3 1 2 
2 4 2 1 
3 3 1 2 
```

## Problem description

Given a matrix representing the graph, this program will find the shortest path between two vertices in the graph and print the shortest path matrix.

## Problem Solution

1. Ask the user to enter the edges of the graph as a matrix representation.
2. Print the original matrix.
3. Pass the matrix to the function `floydWarshall` to find the shortest path matrix.
4. Print the shortest path matrix.

### Methods used

* `void floydWarshall(int **, int)` - This function will find the shortest path between two vertices in a graph using the Floyd-Warshall algorithm. The parameters are the graph represented as a matrix and the number of rows.

### Program/Source code

This C program will find the shortest path between two vertices in a graph using the Floyd-Warshall algorithm. It has been tested on Linux using GCC 12.1.0.

```c
#include <stdio.h>
#include <stdlib.h>

void floydWarshall(int **graph, int n)
{
    int i, j, k;
    for (k = 0; k < n; k++)
    {
        for (i = 0; i < n; i++)
        {
            for (j = 0; j < n; j++)
            {
                if (graph[i][j] > graph[i][k] + graph[k][j])
                    graph[i][j] = graph[i][k] + graph[k][j];
            }
        }
    }
}

int main(void)
{
    int n, i, j;
    printf("Enter the number of vertices: ");
    scanf("%d", &n);
    int **graph = (int **)malloc((long unsigned) n * sizeof(int *));
    for (i = 0; i < n; i++)
    {
        graph[i] = (int *)malloc((long unsigned) n * sizeof(int));
    }
    for (i = 0; i < n; i++)
    {
        for (j = 0; j < n; j++)
        {
            if (i == j)
                graph[i][j] = 0;
            else
                graph[i][j] = 100;
        }
    }
    printf("Enter the edges: \n");
    for (i = 0; i < n; i++)
    {
        for (j = 0; j < n; j++)
        {
            printf("[%d][%d]: ", i, j);
            scanf("%d", &graph[i][j]);
        }
    }
    printf("The original graph is:\n");
    for (i = 0; i < n; i++)
    {
        for (j = 0; j < n; j++)
        {
            printf("%d ", graph[i][j]);
        }
        printf("\n");
    }
    floydWarshall(graph, n);
    printf("The shortest path matrix is:\n");
    for (i = 0; i < n; i++)
    {
        for (j = 0; j < n; j++)
        {
            printf("%d ", graph[i][j]);
        }
        printf("\n");
    }
    return 0;
}
```
### Explanation

The program begins with asking the user to input the edges of the graph and represents them as a matrix representation. Pass the matrix and the number of vertices `n` as input to the function `floydWarshall`. In the function, loop nest from 0 to size and inside that make another loop from 0 to size where we compare the weights respectively as seen in the program.

### Time complexity

The time complexity of the algorithm is O(V^3) where V is the number of vertices in the graph.

### Space Complexity

The space complexity of the algorithm is O(V^2) where V is the number of vertices in the graph.

### Output

```
> ./floyd_warshall
Enter the number of vertices: 4
Enter the edges: 
[0][0]: 0
[0][1]: 12
[0][2]: 45
[0][3]: 2
[1][0]: 1
[1][1]: 0
[1][2]: 45
[1][3]: 32
[2][0]: 77
[2][1]: 43
[2][2]: 0
[2][3]: 2
[3][0]: 42
[3][1]: 3
[3][2]: 88
[3][3]: 0
The original graph is:
0 12 45 2 
1 0 45 32 
77 43 0 2 
42 3 88 0 
The shortest path matrix is:
0 5 45 2 
1 0 45 3 
6 5 0 2 
4 3 48 0 
```
