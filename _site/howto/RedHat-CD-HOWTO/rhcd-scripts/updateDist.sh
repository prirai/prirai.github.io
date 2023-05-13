#! /bin/bash

# $Id: updateDist.sh,v 1.20 2003/10/19 07:45:40 luigi Exp luigi $
###
# updateDist.sh - Downloads and checks the updates for a Redhat Linux
#   distribution. It tries to complete the following operations:
#   - sourcing the rhcd.conf file
#   - downloading the missing updates (excluding the directories in EXCLUDELIST)
#   - check that all the updates were downloaded from the remote site 
#   - check the signatures of all the updates (depending on CHECKSIG and USEGPG)
#   - move the superseded updates to OLDDIR
#   Environment variables (rhcd.conf): REMOTEDIR, UPDDIR, SITE, EXCLUDELIST, 
#   OLDDIR, USEGPG, CHECKSIG, 
# 
###
#   Copyright 2002-2003 Luigi Bitonti
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. 
#

# Source the user defined variables file (rhcd.conf)
if [ -f ${RHCDPATH}/rhcd.conf ] ; then
    source ${RHCDPATH}/rhcd.conf
else
    echo "missing rhcd.conf (configuration file)"
    exit 1
fi

# count how many directory names have to be cut in wget
CUTDIR=$(expr $(echo ${REMOTEDIR} |sed 's;[^/];;g' |wc -m) - 1)
# build the complete exclude list
EXCLUDESTRING=$(for e in ${EXCLUDELIST} ; do echo "-X ${REMOTEDIR}/${e}" ; done)

# create the local directory the updates will be downloaded to
if [ ! -d $UPDDIR ] ; then
   echo "...making directory $UPDDIR"
   mkdir -p $UPDDIR
   [ $? -ne 0 ] && echo "Cannot create $UPDDIR"  && exit 1
fi 
cd $UPDDIR
# download the updates
wget -c -l0 -t0 -r -nr --retr-symlinks -nH --cut-dirs=${CUTDIR} ${EXCLUDESTRING}  \
    "${SITE}/${REMOTEDIR}/*"
# ***NOTE*** Not good for unattended use. It doesn't restart automatically if 
# the downloads or signatures checks fail.
# ***TODO*** In case of failure repeat the download using an incremental timeout
# (kind of 1 2 4 8 16 32 64 64 64... minutes to avoid useless load on the ftp site) 
[ $? -ne 0 ] && echo "***DOWNLOAD FAILED***" && exit 1

echo -n "checking the .listing files ..."
cd $UPDDIR
tmplist_wget=`mktemp .listing.XXXXXX`
tmplist_ls=`mktemp .listing.XXXXXX`
# delete the .listing and temporary files when the script is finished 
trap "find $UPDDIR -name \".listing*\" -exec rm -f {} \; ; exit" 0 1 2 15
# verify if the root directory for the updates contains all the subdirs not 
# included in the $EXCLUDELIST variable
if [ -f ".listing" ] ; then
    ls -l . | awk '(NF == 9) { print $9 }' | sort -f | \
	egrep -v `echo $EXCLUDELIST | tr " " "|"` 2>/dev/null >$tmplist_ls
else
    echo "***DOWNLOAD FAILED***" && exit 1
fi
# delete the carriage return from the .listing file 
tr -d '\r' < .listing | awk '(NF == 9) { print $9 }' | sort -f | \
    egrep -v `echo $EXCLUDELIST | tr " " "|"` 2>/dev/null >$tmplist_wget 
# compare the two files and exit if any discrepancy is found
cmp $tmplist_ls $tmplist_wget
[ $? -ne 0 ] && echo "***DOWNLOAD FAILED***" && exit 1
# check all the updates in the directories
for k in `cat $tmplist_ls` ; do
    cd ${UPDDIR}/${k}
    tmplist_dir=`mktemp .listing.XXXXXX`
    tmplist_wget=`mktemp .listing.XXXXXX`
    # verify if the directory contains all the updates
    ls -l . | awk '(NF == 9) { print $9 }' | sort -f >$tmplist_dir
    # delete the carriage return from the .listing file (if file does 
    # not exist, assume download failed) 
    if [ -f ".listing" ] ; then
	tr -d '\r' < .listing | awk '(NF == 9) { print $9 }' | sort -f >$tmplist_wget 
    else
	echo "***DOWNLOAD FAILED***" && exit 1
    fi
    # compare the two files and exit if any discrepancy is found
    [ $(grep -c -f $tmplist_wget $tmplist_dir) -ne $(wc -l $tmplist_wget \
	|sed 's/ *\([0-9][0-9]*\)  *.*/\1/g') ] && \
	echo "***DOWNLOAD FAILED***" && exit 1

done
echo "succeded"

# create the local directory the old updates will be saved to
if [ ! -d $OLDDIR ] ; then
   echo "...making directory $OLDDIR"
   mkdir -p $OLDDIR 
   [ $? -ne 0 ] && echo "Cannot create $OLDDIR" && exit 1
fi 

# md5 (and gpg) integrity checking
if [ $(echo $CHECKSIG |tr [A-Z] [a-z]) = "yes" ] ; then
    echo -n "checking the signatures of the downloaded files ..."
    SIGCHECKTYPE=$(rpm --version |cut -d" " -f3 |cut -d"." -f1,2 --output-delimiter="")
    # check if it's possible to use gpg signatures 
    # (done differently in rpm >= 4.1)
    if [ "/$(echo ${USEGPG}| tr [A-Z] [a-z])" = "/yes" ] ; then
	if [ $SIGCHECKTYPE -le 40 ] ; then
	    gpg --list-public-keys "security@redhat.com" >/dev/null
	    if [ $? = 0 ] ; then 
		USEGPG=""
	    else
		USEGPG="--nogpg"
	    fi
	    USEPGP="--nopgp"
	else
	    rpm -qi $(rpm -qa |grep gpg-pubkey) >/dev/null
	    if [ $? = 0 ] ; then 
		USEGPG=""
	    else
		USEGPG="--nodigest"
	    fi
	    USEPGP=""
	fi
    else
	if [ $SIGCHECKTYPE -le 40 ] ; then
	    USEGPG="--nogpg"
	    USEPGP="--nopgp"
	else
	    USEGPG="--nodigest"
	    USEPGP=""
	fi
    fi
    cd $UPDDIR
    MD5FAIL=0 
    for rpmcheck in $(find $UPDDIR -name "*.rpm") ; do
	rpm -K $USEPGP  $USEGPG  $rpmcheck
	if [ $? -ne 0 ] ; then
	    echo "${rpmcheck} ... signature checking failed " 
	    mv  $rpmcheck  "${OLDDIR}/$(basename ${rpmcheck}).UPDcheckfail"
	    echo "... moved to ${OLDDIR}/$(basename ${rpmcheck}).UPDcheckfail"
	    MD5FAIL=1
	fi
    done
    if [ $MD5FAIL -eq 1 ] ; then
	echo "Error: signatures checking failed...the script must be run again."
	exit 1
    fi
    echo "succeded"
fi

# move the old packages to the predefined directory
cd $UPDDIR
for oldrpm in `find .  -name "*.rpm"` ; do
    oldrpm=${UPDDIR}/${oldrpm}
    j=$(dirname ${oldrpm})/$(rpm --queryformat "%{NAME}" -qp ${oldrpm} 2>/dev/null)    
    for rpm in $(ls ${j}-[0-9]*.rpm 2>/dev/null) ; do
	[ $rpm = $oldrpm ] && continue
	RPMNAME=`rpm --queryformat "%{NAME}" -qp ${rpm}`
	RPMVERS=`rpm --queryformat "%{VERSION}" -qp ${rpm}`
	RPMREL=`rpm --queryformat "%{RELEASE}" -qp ${rpm}`
        RPMARCH=`rpm --queryformat "%{ARCH}" -qp ${rpm}`
	if [ "/$(rpm --queryformat %{NAME} -qp ${oldrpm} 2>/dev/null)" = "/${RPMNAME}" -a \
	     "/$(rpm --queryformat %{ARCH} -qp ${oldrpm} 2>/dev/null)" = "/${RPMARCH}" ] ; then
	    RPMOLDVERS=$(rpm --queryformat "%{VERSION}" -qp $oldrpm)
	    RPMOLDREL=$(rpm --queryformat "%{RELEASE}" -qp $oldrpm)
	    "$RVC" "$RPMOLDVERS" "$RPMVERS"
	    RETRVC=$?
	    if [  $RETRVC -eq 255 ] ; then
		mv  $oldrpm  $OLDDIR
	    elif [ $RETRVC -eq 1 ] ; then
		mv  $rpm  $OLDDIR
 	    # the two packages have the same version so we have to check the release 
	    else
		"$RVC" "$RPMOLDREL" "$RPMREL"
		RETRVC=$?
		if [ $RETRVC -eq 255 ] ; then
		    mv  $oldrpm  $OLDDIR
		else
		    mv  $rpm  $OLDDIR
		fi
	    fi
	fi 
    done
done

exit 0

#@ updateDist.sh
