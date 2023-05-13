/* 
 * $Id: rvc.c,v 1.5 2002/10/27 18:27:23 luigi Exp $
 ******
 * rvc.c - RPM Version Compare 
 * Given two strings representing a different version and release 
 * of a single rpm package, it returns which one is newer or, 
 * alternatively, an error.
 * 
 * parameters 
 *        two strings (a and b) structured in the following way:
 *        <RPM_version>-<RPM_release>. 
 * 
 * return values
 *        1: a is newer than b
 *        0: a and b are the same version
 *       -1: b is newer than a 
 *        2: wrong arguments number
 * 
 * The assumption the two strings to compare are "logically coherent" 
 * is made, otherwise you will probably end up being told that b is 
 * newer than a (something which happens in this kind of situation)..
 * The rpmvercmp function is "borrowed" from the Redhat package manager 
 * (RPM 4.1), as are all the inline functions in the header file 
 * (rpmvercmp.h).
 *
 ******
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


#include "rvc.h"


int 
main(int argc, char **argv)
{

    /* We need exactly two arguments for the comparison */
    if (argc != 3)
    {
      fprintf(stderr, "Usage: %s <RPM_versionA>-<RPM_releaseA> 
                       <RPM_versionB>-<RPM_releaseB>", argv[0]);
      return 2;
    }

    return rpmvercmp(argv[1], argv[2]);      
}


/* compare alpha and numeric segments of two versions */
/* return 1: a is newer than b */
/*        0: a and b are the same version */
/*       -1: b is newer than a */
int 
rpmvercmp(const char * a, const char * b)
{
    char oldch1, oldch2;
    char * str1, * str2;
    char * one, * two;
    int rc;
    int isnum;

    /* easy comparison to see if versions are identical */
    if (!strcmp(a, b)) return 0;

    str1 = alloca(strlen(a) + 1);
    str2 = alloca(strlen(b) + 1);

    strcpy(str1, a);
    strcpy(str2, b);

    one = str1;
    two = str2;

    /* loop through each version segment of str1 and str2 and compare them */
    while (*one && *two)
    {
	while (*one && !xisalnum(*one)) one++;
	while (*two && !xisalnum(*two)) two++;

	str1 = one;
	str2 = two;

	/* grab first completely alpha or completely numeric segment */
	/* leave one and two pointing to the start of the alpha or numeric */
	/* segment and walk str1 and str2 to end of segment */
	if (xisdigit(*str1))
	{
	    while (*str1 && xisdigit(*str1)) str1++;
	    while (*str2 && xisdigit(*str2)) str2++;
	    isnum = 1;
	} else {
	    while (*str1 && xisalpha(*str1)) str1++;
	    while (*str2 && xisalpha(*str2)) str2++;
	    isnum = 0;
	}

	/* save character at the end of the alpha or numeric segment */
	/* so that they can be restored after the comparison */
	oldch1 = *str1;
	*str1 = '\0';
	oldch2 = *str2;
	*str2 = '\0';

	/* take care of the case where the two version segments are */
	/* different types: one numeric, the other alpha (i.e. empty) */
	if (one == str1) return -1;	/* arbitrary */
	if (two == str2) return -1;

	if (isnum)
	{
	    /* this used to be done by converting the digit segments */
	    /* to ints using atoi() - it's changed because long  */
	    /* digit segments can overflow an int - this should fix that. */

	    /* throw away any leading zeros - it's a number, right? */
	    while (*one == '0') one++;
	    while (*two == '0') two++;

	    /* whichever number has more digits wins */
	    if (strlen(one) > strlen(two)) return 1;
	    if (strlen(two) > strlen(one)) return -1;
	}

	/* strcmp will return which one is greater - even if the two */
	/* segments are alpha or if they are numeric.  don't return  */
	/* if they are equal because there might be more segments to */
	/* compare */
	rc = strcmp(one, two);
	if (rc < 0) 
	    return -1;
	else if (rc > 0)
	    return 1;

	/* restore character that was replaced by null above */
	*str1 = oldch1;
	one = str1;
	*str2 = oldch2;
	two = str2;
    }

    /* this catches the case where all numeric and alpha segments have */
    /* compared identically but the segment sepparating characters were */
    /* different */
    if ((!*one) && (!*two)) return 0;

    /* whichever version still has characters left over wins */
    if (!*one) return -1; else return 1;
}
