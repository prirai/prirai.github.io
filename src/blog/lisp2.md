---
layout: layouts/post.njk
title: Learn Lisp with me - 2
cover: https://www.lisperati.com/lisplogo.svg
tags:
    - programming
    - lisp
    - blog
date: 2022-03-12
---

## Creating an `alist` - association list


```lisp
(defparameter *nodes* '((living-room (you are in the living-room.
a wizard is snoring loudly on the couch.))
(garden (you are in a beautiful garden.
there is a well in front of you.))
(attic (you are in the attic.
there is a giant welding torch in the corner.))))
```

## Function mapping with `mapcar`

```lisp
(mapcar #'describe-path '((GARDEN WEST DOOR) (ATTIC UPSTAIRS LADDER)))
```

>((THERE IS A DOOR GOING WEST FROM HERE.)
>(THERE IS A LADDER GOING UPSTAIRS FROM HERE.))

`mapcar` takes one function and maps it to every member of the list.

Functions that take other functions as parameters, such as `mapcar` , are very
useful and a distinguishing feature of Lisp. Such functions are called _higher-
order functions_.

```lisp
(mapcar #'car '((foo bar) (baz qux)))
is the same as
(mapcar (function car) '((foo bar) (baz qux)))
```

>(foo baz)

## The `append` function

```lisp
(append '(mary had) '(a) '(little lamb))
```

>(MARY HAD A LITTLE LAMB)

## The `apply` function

```lisp
(apply #'append '((THERE IS A DOOR GOING WEST FROM HERE.)
(THERE IS A LADDER GOING UPSTAIRS FROM HERE.)))
```

>(THERE IS A DOOR GOING WEST FROM HERE. THERE IS A LADDER GOING UPSTAIRS FROM
HERE.)

## The `find` function

```lisp
(find 'y '((5 x) (3 y) (7 z)) :key #'cadr)
```

>(3 Y)

## `push`, but gently

```lisp
(defparameter *foo* '(1 2 3))
```

>*FOO*
```lisp
(push 7 *foo*)
```

>(7 1 2 3)

```lisp
*foo*
```

>(7 1 2 3)

## Are you even a `member`?

_It's still not over. Stay tuned for updates._