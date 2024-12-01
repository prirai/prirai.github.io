---
layout: layouts/post.njk
title: Learn Lisp with me
cover: https://upload.wikimedia.org/wikipedia/commons/4/48/Lisp_logo.svg
tags:
    - programming
    - lisp
    - blog
date: 2022-03-10
---

**Lisp** (historically **LISP**) is a family of programming languages with a long history and a distinctive, fully parenthesized prefix notation. Originally specified in 1958, Lisp is the second-oldest high-level programming language still in common use. Only Fortran is older, by one year. Lisp has changed since its early days, and many dialects have existed over its history. Today, the best-known general-purpose Lisp dialects are Racket, Common Lisp, Scheme, and Clojure.

Lisp was originally created as a practical mathematical notation for computer programs, influenced by (though not originally derived from) the notation of Alonzo Church's lambda calculus. It quickly became the favored programming language for artificial intelligence (AI) research. As one of the earliest programming languages, Lisp pioneered many ideas in computer science, including tree data structures, automatic storage management, dynamic typing, conditionals, higher-order functions, recursion, the self-hosting compiler, and the read–eval–print loop.

The name LISP derives from "LISt Processor". Linked lists are one of Lisp's major data structures, and Lisp source code is made of lists. Thus, Lisp programs can manipulate source code as a data structure, giving rise to the macro systems that allow programmers to create new syntax or new domain-specific languages embedded in Lisp.

The interchangeability of code and data gives Lisp its instantly recognizable syntax. All program code is written as s-expressions, or parenthesized lists. A function call or syntactic form is written as a list with the function or operator's name first, and the arguments following; for instance, a function `f` that takes three arguments would be called as `(f arg1 arg2 arg3)`. 

## Basic syntax

- Define a changeable global variable.

```lisp
(defparameter *small* 1)
```

- Defines a unchangeable global variable.

```lisp
(defvar *foo* 20)
```

- Change the value of a preassigned variable.

```lisp
(setf *big* 20)
```

- The function below returns 1. 

```lisp
(defun funname () (..)..(.. (1))
```

- Assigns values and returns 11 (ie, a + b)

```lisp
(let ((a 5)(b 6))(+ a b))
```
- `flet` lets you define local functions. The code below returns 12

```lisp
(flet ( (f(n)(+ n 10)) (g(n)(- n 3)) ) (g (f 5)) )
```

- `labels` lets you call one function inside another. //Recursion

```lisp
(labels ( (a(n)(+ n 5)) (b(n)(+ (a n) 6)) )(b 10))
```

- LISP is case insensitive

```lisp
(eq 'fooo 'FoOo)
```

- Strings in LISP

```lisp
(princ "He yelled \"Stop that thief!\" from the busy street.")
```

## The `cons` function

- `cons` links two pieces of data together

```lisp
(cons 'chicken 'cat)
```

(CHICKEN.CAT)

_In `cons`, the first value is a separate symbol while the second value can optionally be a list._

- `'nil` marks the end of a list.

```lisp
(cons 'chicken 'nil)
```

(CHICKEN)

```lisp
(cons 'chicken ())
```

-> _gives the same output_

```lisp
(cons 'pork '(beef chicken))
```

(PORK BEEF CHICKEN)

_which is the same as doing_

```lisp
(cons 'pork (cons 'beef (cons 'chicken ())))
```

## The `car` function

_`car` is used to extract the first value from a list._

```lisp
(car '(pork beef chicken))
```

PORK

## The `cdr` function

_`cdr` takes out the remaining values of a list._

```lisp
(cdr '(pork beef chicken))
```

(BEEF CHICKEN)

```lisp
(car (cdr '(pork beef chicken)))
```

BEEF

_which is the same as,_

```lisp
(cadr '(pork beef chicken))
```

BEEF

## The `list` function

For convenience, Common Lisp has many functions built on top of the basic
three — `cons`, `car`, and `cdr`. 

A useful one is `list`.

```lisp
(list 'pork 'beef 'chicken)
```

(PORK BEEF CHICKEN)

Thus the below three lines mean essentially the same.

- `(cons 'pork (cons 'beef (cons 'chicken ())))`
- `(list 'pork 'beef 'chicken)`
- `'(pork beef chicken)`

## Nested lists

```lisp
'(cat (duck bat) ant)
```

Lists can contain other lists.

```lisp
(cdar '((peas carrots tomatoes) (pork beef chicken)))
```

(CARROTS TOMATOES)

```lisp
(cadadr '((peas carrots tomatoes) (pork beef chicken) duck))
```

BEEF

You could go on writing to your heart's content but here's the catch: The `c*r` allows maximum depth of four so if you write `cadadar`, you'll have to define the function yourself.

## Decision making

## What if?

Whenever an empty list is passed, its interpreted as being empty.

```lisp
(if '()
'i-am-true
'i-am-false)
```
I-AM-FALSE



```lisp
(if '(1)
'i-am-true
'i-am-false) 
```
I-AM-TRUE

- Finding th length of a list:

```lisp
(defun my-length (list)
	(if list
		(1+ (my-length (cdr list)))
		0))
(my-length '(list with four symbols))
```
4

## False values
```lisp
(eq '() nil)	==> T
(eq '() ())	==> T
(eq '() 'nil)	==> T
```

Checking whether the given number is odd:
```lisp
(if (oddp 5)
'odd-number
'even-number)
```

ODD-NUMBER

Conditional commands in LISP are special forms which do not need to execute all the statements included within them. 

```lisp
(if (oddp 5)
'odd-number
(/ 1 0))
```
ODD-NUMBER

```lisp
(defvar *number-was-odd* nil)
(if (oddp 5)
(progn (setf *number-was-odd* t)
'odd-number)
'even-number)
```

ODD-NUMBER

```lisp
*number-was-odd*
```

T

## `when` and `unless`
With `when`, all the enclosed expressions are evaluated when the condition
is true. With `unless`, all the enclosed expressions are evaluated when the
condition is false.

```lisp
(defvar *number-is-odd* nil)
> (when (oddp 5)
(setf *number-is-odd* t)
'odd-number)
```

ODD-NUMBER

```lisp
*number-is-odd*
```

T

```lisp
(unless (oddp 4)
(setf *number-is-odd* nil)
'even-number)
```

EVEN-NUMBER

```lisp
*number-is-odd*
```

NIL

## `cond`, _the one true LISP conditional_

```lisp
(defvar *arch-enemy* nil)
(defun pudding-eater (person)
    (cond ((eq person 'henry) (setf *arch-enemy* 'stupid-lisp-alien)
                              '(curse you lisp alien – you ate my pudding))
          ((eq person 'johnny) (setf *arch-enemy* 'useless-old-johnny)
                               '(i hope you choked on my pudding johnny))
          (t                   '(why you eat my pudding stranger ?))))
(pudding-eater 'johnny)
```

(I HOPE YOU CHOKED ON MY PUDDING JOHNNY)

## The case of `case`
In a similar way we can use `case`
```lisp
(defun pudding-eater (person)
(case person
((henry)
 (setf *arch-enemy* 'stupid-lisp-alien)
'(curse you lisp alien – you ate my pudding))
((johnny) (setf *arch-enemy* 'useless-old-johnny)
'(i hope you choked on my pudding johnny))
(otherwise '(why you eat my pudding stranger ?))))
```

## Stealth mode on 👾 with `and` and `or`

```lisp
(and (oddp 5) (oddp 7) (oddp 9))
```

T

```lisp
 (or (oddp 4) (oddp 7) (oddp 8))
```

T

If a statement is found out to be true, `or` doesn't bother about checking the other statements; similarly for `and` in the case of false statement. This helps when we want to run a specific command only when some expected condition is not met.

## We retrieve, we check - `find-if`

```lisp
(find-if #'oddp '(2 4 5 6))
```
5

```lisp
(if (find-if #'oddp '(2 4 5 6))
'there-is-an-odd-number
'there-is-no-odd-number)
```
'there-is-an-odd-number

```lisp
(find-if #'null '(2 4 nil 6))
```
NIL

## `eq` and `equal` dilemma

- Use `eq` to compare symbols
- Use `equal` for everything else

The `eql` command is similar to the `eq` command, but unlike `eq` , it also handles comparisons of numbers and characters.

The `equalp` command is essentially the same as the `equal` command, except that it can handle some difficult comparison cases with a bit of extra sophisti-cation.

||eq|eql|equal|equalp|=|string-equal|char-equal|
|----|----|----|----|----|----|----|----|
|symbols|yes|yes|yes|yes|yes|yes|yes|
|lists|no|no|yes|yes|no|no|no|
|list-diff|no|no|yes|yes|no|no|no|
|integer|no|yes|yes|yes|yes|no|no|
|floating-point|no|yes|yes|yes*|yes|no|no|
|string|no|no|yes|yes*|no|yes|no|
|character|no|yes|yes|yes|no|no|yes|

_* `equalp` can compare case sensitives and floating points and integers._

