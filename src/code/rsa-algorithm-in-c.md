---
layout: layouts/plain.njk
title: RSA Algorithm in C
description: In this tutorial we will create a program in C which will encrypt and decrypt a message using the RSA algorithm.
summary: In this tutorial we will create a program in C which will encrypt and decrypt a message using the RSA algorithm.
tags:
  - c
  - coding
  - cryptography
date: 2022-08-06
---

This is an implementation of the RSA algorithm in C.

## RSA Algorithm

The RSA algorithm is a very fast algorithm for encryption and decryption. It is used in many applications like encryption and decryption of messages. The algorithm is based on the idea that if we know the public and private keys, then we can encrypt and decrypt messages.
An RSA user creates two large prime numbers, p and q, and computes n = pq. Then they computes the totient function, λ(n) = (p - 1)(q - 1).
Choosing e as a relatively prime number to λ(n) and 1 < e < λ(n) they release e as the public key.
Then they computes the private key, d, as follows:

    d * e = 1 mod λ(n)

Encrytion is done as follows:

```c
    c = m^e mod n
```
over all the characters.

Decryption is done as follows:

```c
    m = c^d mod n
```
over all the characters.

## Algorithm

1. Ask the user to enter two prime numbers and validate them.
2. Store the prime numbers in variables.
3. Compute n = pq.
4. Compute λ(n) = (p - 1)(q - 1).
5. Choose a random number e as a relatively prime number to λ(n) and 1 < e < λ(n).
6. Compute d = e^-1 mod λ(n).
7. Print the public and private keys.
8. Ask the user to enter a message and store it in a variable.
9. Encrypt the message using the public key.
10. Decrypt the message using the private key.
11. Print the encrypted and decrypted message.

## Problem description

This program will ask the user to enter two prime numbers and then encrypt and decrypt a message using the RSA algorithm.

## Solution

In this approach we use a temp array to store some intermediate values to be later used in decrypt function.

### Program/Source code

```c
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int isPrime(int n) {
  int i;
  for (i = 2; i <= sqrt(n); i++) {
    if (n % i == 0) {
      return 0;
    }
  }
  return 1;
}

int gcd(int a, int b) {
  if (a == 0) {
    return b;
  }
  return gcd(b % a, a);
}

int totient(int p, int q) { return (p - 1) * (q - 1); }

int randome(int lambda_n) {
  printf("\nThe number e should be less than %d\n and greater than 1.",
         lambda_n);
  for (int i = 2; i < lambda_n; i++) {
    if (gcd(i, lambda_n) == 1) {
      return i;
    }
  }
  return -1;
}

int private_key(int e, int lambda_n) {
  for (int i = 1; i < lambda_n; i++) {
    if ((i * e) % lambda_n == 1) {
      printf("\nThus, (i * e) %% lambda_n = 1, (%d * %d) %% %d = 1", i, e,
             lambda_n);
      return i;
    }
  }
  return -1;
}

long pomod(long a, long b, long m) {
  long x = 1, y = a;
  while (b > 0) {
    if (b % 2 == 1) {
      x = (x * y) % m;
    }
    y = (y * y) % m;
    b /= 2;
  }
  return x % m;
}

/* Encryption
 * A function which takes the message, the public key and a number n which is he
 * product of p and q. The function encrypts the message using the public key
 * and returns the encrypted message.
 */

char *encrypt(char *message, long e, long n) {
  long i;
  long len = strlen(message);
  char *cipher = (char *)malloc(len * sizeof(char));
  for (i = 0; i < len; i++) {
    cipher[i] = pomod(message[i], e, n);
    printf("\n%c -> %c", message[i], cipher[i]);
  }
  return cipher;
}

/* Decryption
 * A function which takes the cipher text, the private key and a number n which
 * is he product of p and q. The function decrypts the cipher text using the
 * private key and returns the decrypted message.
 */

char *decrypt(char *cipher, long d, long n) {
  long i;
  long len = strlen(cipher);
  char *message = (char *)malloc(len * sizeof(char));
  for (i = 0; i < len; i++) {
    // message[i] = (long) pow(cipher[i], d) % n;
    message[i] = pomod(cipher[i], d, n);
    printf("\n%c -> %c", cipher[i], message[i]);
  }
  return message;
}

int main() {
  int p, q, lambda_n;
  long n, e, d;
  char *message;
  char *cipher;
  printf("\nEnter the value of p: ");
  scanf("%d", &p);
  printf("\nEnter the value of q: ");
  scanf("%d", &q);
  if (isPrime(p) && isPrime(q)) {
    n = p * q;
    lambda_n = totient(p, q);
    e = randome(lambda_n);
    d = private_key(e, lambda_n);
    printf("\nThe value of n is %ld", n);
    printf("\nThe value of lambda_n is %d", lambda_n);
    printf("\nThe value of e is %ld", e);
    printf("\nThe value of d is %ld", d);
    printf("\nEnter the message: ");
    message = (char *)malloc(sizeof(char) * 100);
    scanf("%s", message);
    cipher = encrypt(message, e, n);
    puts("\nThe encrypted message is: ");
    printf("%s", cipher);
    message = decrypt(cipher, d, n);
    puts("\nThe original message was: ");
    printf("%s", message);
  } else {
    printf("\nThe value of p and q should be prime.");
  }
  return 0;
}

```

### Methods used

- `int isPrime(int)` - This function checks if the number is prime or not.
- `int gcd(int, int)` - This function returns the greatest common divisor of two numbers.
- `int totient(int, int)` - This function returns the totient of a number.
- `int randome(int)` - This function returns a random number less than the given number.
- `int private_key(int, int)` - This function returns the private key.
- `long pomod(long, long, long)` - This function returns the modular exponentiation of a number.
- `char *encrypt(char *, long, long)` - This function encrypts the message.
- `char *decrypt(char *, long, long)` - This function decrypts the message.

### Explanation

This program will ask the user to enter two prime numbers and then encrypt and decrypt a message using the RSA algorithm.

After accepting the values of p and q, the program will check if the values are prime or not. If they are prime, the program will calculate the value of n, lambda_n, e and d using the above mentioned theory. After this, the message will be encrypted and decrypted.

### Output

```
> ./rsa               

Enter the value of p: 7

Enter the value of q: 19

The number e should be less than 108
 and greater than 1.
Thus, (i * e) % lambda_n = 1, (65 * 5) % 108 = 1
The value of n is 133
The value of lambda_n is 108
The value of e is 5
The value of d is 65
Enter the message: apple

a -> 
p -> ?
p -> ?
l -> !
e -> 
The encrypted message is: 
??!
 -> a
? -> p
? -> p
! -> l
 -> e
The original message was: 
apple
```

## Caution

This program is not a perfect implementation of the RSA algorithm. For large value of n (p * q), as the character set implementation in C is very small, during the encryption and decryption process, many characters are lost. Therefore, for this program to work correctly for large values, as a workaround, all the intermediate calculation should be done on a long long int type array.
