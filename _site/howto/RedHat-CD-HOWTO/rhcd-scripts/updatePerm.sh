#!/bin/bash

# $Id: updatePerm.sh,v 1.7 2003/10/19 07:46:57 luigi Exp luigi $
###
# updatePerm.sh - Updates the permissions of directories and files which 
# could be run directly off the cd during installation. This is mostly equal 
# to the one found in the previous version (1.34) of the Redhat CD howto and it 
# can be used in 6.x/7.x releases of Redhat Linux..
#
# Environment variables (rhcd.conf): RHROOT
#
###
# 
#   Copyright 2002-2003 Luigi Bitonti
#
#   Copyright 2000 Morten Kjeldgaard, Peter von der Ahe
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#



# Source the user defined variables file
if [ -f ${RHCDPATH}/rhcd.conf ] ; then
    source ${RHCDPATH}/rhcd.conf
else
    echo "missing rhcd.conf (configuration file)"
    exit 1
fi

LIST=`mktemp /tmp/updpermrhcd.XXXXXX`

# Find all directories, and make sure they have +x permission
find $RHROOT -type d -exec chmod -c 755 {} \; 

# Find all files that are executables, shell, python or perl scripts
find $RHROOT -type f | file -f - | grep -v RPM \
   | egrep -i 'executable|perl|bourne|shell|python' | cut -f1 -d: > $LIST
#   ====>     NEEDED FOR RedHat >= 6.1        ^^^^^^^ 

# Find shared libraries

find $RHROOT -name \*.so >> $LIST 

# Make them executable
while read file
do
   if [ ! -x $file ] ; then
      chmod -c 755 $file
   fi
done < $LIST 

/bin/rm $LIST

exit 0

#@ updatePerm.sh
