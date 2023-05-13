/*
 * $Id: rvc.h,v 1.4 2002/10/27 18:28:00 luigi Exp $
 **
 * rvc.h - include file for rvc.c
 *
 *   Copyright 2002 Luigi Bitonti
 *   
 *   Copyright 2002 Redhat Inc.
 *
 *   This file is part of rvc (RPM version compare).
 *
 *   rvc is free software; you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License as published by
 *   the Free Software Foundation; either version 2 of the License, or
 *   (at your option) any later version.
 *
 *   rvc is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU General Public License for more details.
 *
 *   You should have received a copy of the GNU General Public License
 *   along with rvc; if not, write to the Free Software
 *   Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 *
 */

#include <string.h>
#include <stdio.h>
#include <stdlib.h>


int rpmvercmp(const char *, const char *);


static inline int xislower(int c) {
    return (c >= 'a' && c <= 'z');
}

static inline int xisupper(int c) {
    return (c >= 'A' && c <= 'Z');
}

static inline int xisalpha(int c) {
    return (xislower(c) || xisupper(c));
}

static inline int xisdigit(int c) {
    return (c >= '0' && c <= '9');
}

static inline int xisalnum(int c) {
    return (xisalpha(c) || xisdigit(c));
}

static inline int xisblank(int c) {
    return (c == ' ' || c == '\t');
}

static inline int xisspace(int c) {
    return (xisblank(c) || c == '\n' || c == '\r' || c == '\f' || c == '\v');
}

static inline int xtolower(int c) {
    return ((xisupper(c)) ? (c | ('a' - 'A')) : c);
}

static inline int xtoupper(int c) {
    return ((xislower(c)) ? (c & ~('a' - 'A')) : c);
}

