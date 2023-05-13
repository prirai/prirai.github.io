---
layout: layouts/post.njk
title: Decimal to Binary conversion in C
description: In this tutorial we will be creating a C program which will convert decimal numbers to binary numbers.
summary: In this tutorial we will be creating a C program which will convert decimal numbers to binary numbers.
tags:
    - c
    - coding
date: 2022-07-21
---

## Decimal numbers

Decimal numbers are the numbers in the decimal system. They are represented by the digits 0 to 9. For example, the number `123` is represented by the digits `1`, `2`, and `3`. The number `0` is represented by the digit `0`. The number `123456789` is represented by the digits `1`, `2`, `3`, `4`, `5`, `6`, `7`, `8`, and `9`. In order to represent number system, we need a base. Decimal numbers are represented in the base 10. The base 10 is the most common base in the world.

## Binary numbers

Binary numbers are the numbers in the binary system. They are represented by the digits 0 and 1. For example, the number `101` is represented by the digits `1` and `0`. The number `0` is represented by the digit `0`. The number `101010101` is represented by the digits `0`, and `1`. Binary numbers are represented in the base 2.

## Algorithm

There can be many approaches to convert a Decimal number to Binary number. The simplest way to convert a Decimal number to Binary number is to use the following algorithm:

1. Divide the number by 2 and get the quotient and remainder.
2. If the remainder is 0, then the binary number is 0.
3. If the remainder is 1, then the binary number is 1.
4. Repeat the process for the quotient and remainder.
5. For every step keep appending the remainder to the binary number.

# Problem description

Given a decimal number, convert it to binary number.

# Problem Solution

To approach this problem, we simply use the repeated division method and take out the remainder. This program uses modulo operator to get the remainder.

## Naive Approach

This approach simply converts the decimal number to binary using the division operation

### Methods used

`decimal_to_binary` - This method converts the decimal number to binary number.

### Approach

1. Divide the number by 2 and get the quotient and remainder.
2. If the remainder is 0, then the binary number is 0.
3. If the remainder is 1, then the binary number is 1.
4. Repeat the process for the quotient and remainder.
5. For every step keep appending the remainder to the binary number.

### Examples

Suppose the input is `324`, the program should output `101000100`.

### Program/Source code

```c
/* This program converts a decimal number to binary. */

#include <stdio.h>

long dec_to_bin(long n)
{
	long bin = 0;
	long dec = n;
	long i = 1;

	while (dec > 0) {
		bin += (dec % 2) * i;
		dec /= 2;
		i *= 10;
	}

	return bin;
}

int main(void)
{
	long n;
	printf("Enter a decimal number: ");
	scanf("%ld", &n);
	printf("Binary equivalent of %ld = %ld\n", n, dec_to_bin(n));
	return 0;
}
```

### Explanation

The program starts with asking the user to enter a decimal number. The program then converts the decimal number to binary number via the `dec_to_bin` method. Here, we have to keep in mind that our program can't convert negative numbers to binary. Therefore, for numbers which are negative, we return `0` as the binary number. For positive numbers, we return the binary number after performing continued division and adding the remainders to the binary number.

The program prints the binary number after converting the decimal number to binary.

### Time complexity

The time complexity of this program is O(n) where n is the number of digits in the decimal number.

### Space Complexity

The space complexity of this program is O(1) since we are not using any extra space.

### Output

    ```
    Enter a decimal number: 324
    Binary equivalent of 324 = 101000100

    Enter a decimal number: 123
    Binary equivalent of 123 = 1111011

    Enter a decimal number: -123
    Binary equivalent of -123 = 0
    ```

## Negative numbers

The decimal number can be negative. For example, the number `-123` is represented by the digits `1`, `2`, `3`. The number `-0` is represented by the digit `0`. The number `-123.456789` is represented by the digits `1`, `2`, `3`, `.`, `4`, `5`, `6`, `7`, `8`, and `9`.

### Methods used
* `int sizeOfNumber` - Used to find the size (number of digits) of the number and also the bitsize in which it should fit in.
* `long twos_complement` - Finds the twos complement of the number entered as binary.
* `long dec_to_bin` - Converts the decimal number to binary.
* `long toBinary` - Checks whether the number is negative or not and accordingly passes it to functions.
### Approach

1. Ask the user to enter the decimal number.
2. Check whether the number is negative or not.
3. If the number is positive, then convert it to binary.
4. If the number is negative, find it's bitsize and convert it to two's complement.
5. Convert the decimal number to binary.
6. Print the binary number.

### Examples

Suppose the input is `-123`, the program should output `10000101`.

Suppose the input is `48`, the program should output `110000`.

### Program/Source code

```c
/* Decimal to binary numbers also taking into account negative numbers. */

#include <stdio.h>

int bitsize = 8;

int sizeOfNumber(long n)
{
    // Repeated division by 10 to find the size of the number.
    int size = 0;
    while (n > 0)
    {
        n /= 10;
        size++;
    }
    // Bitsize will be helpful while finding the two's complement
    if (size > 7)
        bitsize = 16;
    return size;
}

long twos_complement(long n)
{
    long i = 1;
    long twos_comp = 0;
    long r;
    int flag = 0;
    printf("The number has %d digits so setting bitsize at %d.\n", sizeOfNumber(n), bitsize);
    for (int j = 0; j < bitsize; j++)
    {
        // Finding the remainder and appending it according to the flag.
        r = n % 10;
        if (flag == 1)
            twos_comp += ((r == 1) ? 0 : 1) * i;
        else
            twos_comp += r * i;
        n /= 10;
        i *= 10;
        if (r == 1)
            flag = 1;
    }
    printf("The twos complement ");
    return twos_comp;
}

/* Simple decimal to binary convertor */
long dec_to_bin(long n)
{
    long bin = 0;
    long dec = n;
    long i = 1;

    while (dec > 0)
    {
        bin += (dec % 2) * i;
        dec /= 2;
        i *= 10;
    }

    return bin;
}

long toBinary(long n)
{
    // Function to check whether it's a negative or a positive number and accordingly passes through the functions.
    if (n >= 0)
        return dec_to_bin(n);
    else
        return twos_complement(dec_to_bin(~n + 1));
}

int main(void)
{
    long n;
    printf("Enter a decimal number: ");
    scanf("%ld", &n);
    printf("Binary equivalent of %ld = %ld\n", n, toBinary(n));
    return 0;
}
```

### Explanation

The program starts with asking the user to enter a decimal number. The program then converts the decimal number to binary number via the `dec_to_bin` method. In case the number is negative, we use the `twos_complement` method to find the twos complement of the number and also find the bitsize.

### Time complexity

The time complexity of this program is O(n) where n is the number of digits in the decimal number.

### Space Complexity

The space complexity of this program is O(1) since we are not using any extra space.

### Output

```bash
> ./dectobinneg      
Enter a decimal number: -48
The number has 6 digits so setting bitsize at 8.
The twos complement Binary equivalent of -48 = 11010000

> ./dectobinneg
Enter a decimal number: 100
Binary equivalent of 100 = 1100100
```

## Decimal numbers with floating points

The decimal number can have fractional points. For example, the number `123.45` is represented by the digits `1`, `2`, `3`, `.`, `4`, `5`. The number `0.0` is represented by the digit `0`. The number `123.456789` is represented by the digits `1`, `2`, `3`, `.`, `4`, `5`, `6`, `7`, `8`, and `9`.

### Methods used

* `long dec_to_bin` - Converts the decimal number to binary.
* `double fractBin` - Converts the fractional part of the decimal number to binary.
* `long toBinary` - Converts the decimal number to binary by separating the fractional part and integer part.

### Approach

1. Ask the user to enter the decimal number.
2. Separate the fractional part and integer part.
3. Send the integer part to the `dec_to_bin` method.
4. Send the fractional part to the `fractBin` method.
5. Convert the decimal number to binary.
6. Add the resulting binary numbers.
7. Print the binary number.

### Examples

Suppose the input is `123.45`, the program should output `1111011.011100`.

### Program/Source code

```c
/* We will convert decimal numbers with doubleing points to binary */

#include <stdio.h>

long dec_to_bin(long n)
{
	long bin = 0;
	long dec = n;
	long i = 1;

	while (dec > 0) {
		bin += (dec % 2) * i;
		dec /= 2;
		i *= 10;
	}

	return bin;
}

// fractBin multiplies iteratively for the fractional part of the number.
double fractBin(double n)
{
	double bin = 0;
	int threshold = 6;
	double temp = n;
    double j = 0.1f;

	for (int i = 0; i < threshold && temp > 0; i++) {
		temp *= 2;
		int temp_int = (int)temp;
		bin += (double)temp_int * j;
		temp -= (double)temp_int;
        j /= 10;
	}

	return bin;
}

double toBinary(double n)
{
	// Send the part after decimal point to dec_to_bin function.
	long num_int = (long)n;
	double bina = (double) dec_to_bin(num_int);

	double num_dec = n - (double) num_int;
	double binb = fractBin(num_dec);
	return bina + binb;
}

int main(void)
{
	double n;
	printf("Enter a decimal number: ");
	scanf("%lf", &n);
	printf("Binary equivalent of %lf = %lf\n", n, toBinary(n));
	return 0;
}
```

### Explanation

The program starts with asking the user to enter a decimal number. The program then converts the integer part of the decimal number to binary number via the `dec_to_bin` method. The fractional part of the decimal number is converted to binary number via the `fractBin` method. The resulting binary numbers are added and printed.

Let's see how this works.

So, for the integer part, it's already clear that the binary representation can be found out simply by repeated division with 2. However in case of fractional parts, the binary equaivalent is found out by repeated multiplication by 2. Suppose the number is `12.5`, then as we'd guess the binary representation is `1100.1`. For every digit to the right of the decimal point, if an decimal gets 10 different characters, binaries gets only 2. So, that's the reason of the multiplication. 

A simple analogy would be that of a jar. If we want to tell that it's half filled, we know that in decimal terms, we'll say it's 0.50 filled. So, 0.50 + 0.50 is 1.00. Similarly, in case of binary we say 0.10 as, 0.10 + 0.10 = 1.00. This simple trick could be used to understand many other aspects of binaries and their relations with decimals.

### Time complexity

The time complexity of this program is O(n) where n is the number of digits in the decimal number.

### Space Complexity

The space complexity of this program is O(1) since we are not using any extra space.

### Output

```bash
> ./dectobinfrac 
Enter a decimal number: 123.45
Binary equivalent of 123.450000 = 1111011.011100

> ./dectobinfrac
Enter a decimal number: 3045.219
Binary equivalent of 3045.219000 = 101111100101.001114
```

Wait, but why did I get a 4 at the end? The reason is [here](https://floating-point-gui.de/basic/), also read 'The Art of Computer Programming' by _Donald Knuth_ for a mathematical foundation on why the floating point implementation in programming languages is not so accurate (or perhaps was).
