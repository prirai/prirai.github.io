#! /bin/bash

# $Id: updateCD.sh,v 1.16 2003/10/19 07:46:15 luigi Exp luigi $
###
# updateCD.sh - This script updates RPMS/SRPMS in a RedHat 7.x/6.x 
# distribution tree using the packages found in a user-defined 
# directory which is structured like the Redhat updates ftp site..
#   - The old rpms will be placed in $OLDDIR.
#   - The new rpms should be located in $UPDDIR.
#   - The architecture(s) are listed in $ARCH. 
#   - The new images are in $IMGDIR (only for 6.x)
#   - The images to be updated are in $OMGDIR (only for 6.x)
#
# Environment variables (rhcd.conf): RHROOT, ARCH, OLDDIR, IMGDIR, 
#   OMGDIR (6.x), CHECKSIG, USEGPG
# 
###
#   Copyright 2002-2003 Luigi Bitonti
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

RPMDIR=${RHROOT}/RedHat/RPMS
SRPMDIR=${RHROOT}/SRPMS

if [ ! -d $OLDDIR ] ; then
   echo making directory $OLDDIR
   mkdir $OLDDIR || ( exit 1 && echo "Cannot create $OLDDIR" )
fi 

for archi in `echo "$ARCH"` ; do
  [ ! -d ${UPDDIR}/${archi} ] && continue
  for rpm in `ls ${UPDDIR}/${archi}/*.rpm 2>/dev/null` ; do
    RPMNAME=`rpm --queryformat "%{NAME}" -qp $rpm`
    RPMVERS=`rpm --queryformat "%{VERSION}" -qp $rpm`
    RPMREL=`rpm --queryformat "%{RELEASE}" -qp $rpm`
    RPMARCH=`rpm --queryformat "%{ARCH}" -qp $rpm`
    unset RPMOLDNAME
    # The SRPMS updates go to a different destination directory
    if [ "$archi" = "SRPMS" ] ; then
      suf="src"
      export DESTDIR="$SRPMDIR"
    else
      suf="$archi"
      export DESTDIR="$RPMDIR"
    fi
    # If they have the same name and architecture, check version and
    # release.
    for oldrpm in `ls ${DESTDIR}/${RPMNAME}*.${suf}.rpm 2>/dev/null` ; do
      if [ `rpm --queryformat "%{NAME}" -qp $oldrpm` = "$RPMNAME" -a \
           `rpm --queryformat "%{ARCH}" -qp $oldrpm` = "$RPMARCH" ]; then
        RPMOLDVERS=`rpm --queryformat "%{VERSION}" -qp $oldrpm`
        RPMOLDREL=`rpm --queryformat "%{RELEASE}" -qp $oldrpm`
        "$RVC" "$RPMOLDVERS" "$RPMVERS"
        RETRVC=$?
        if [ $RETRVC -eq 255 ] ; then
          RPMOLDNAME=$oldrpm
          break
        elif [ $RETRVC -eq 1 ] ; then
          RPMOLDNAME=$rpm
          break
	# the two packages have the same version so we have to check the release 
	else
          "$RVC" "$RPMOLDREL" "$RPMREL"
          RETRVC=$?
          if [ $RETRVC -eq 255 ] ; then
            RPMOLDNAME=$oldrpm
            break
          else
            RPMOLDNAME=$rpm
            break
	  fi
        fi
      fi
    done

    # If this is a brand new rpm, just copy it in the RPMSs directory, 
    # else copy it to the RPMSs directory and move the old one to $OLDDIR
    if [ -z "$RPMOLDNAME" ]; then
      echo "${RPMNAME}.${suf} is new"
      cp -pv $rpm $DESTDIR
    else      
      # Do not substitute with an equal one (which also means RETRVC == 0)
      if [ `basename $rpm` != `basename $RPMOLDNAME` ]; then
         echo "${RPMNAME}.${suf} is new"
         mv $RPMOLDNAME $OLDDIR
         cp -pv $rpm $DESTDIR
      fi
    fi

  done 
done

# md5 (and gpg) integrity checking
if [ $(echo $CHECKSIG |tr [A-Z] [a-z]) = "yes" ] ; then
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
    cd $RHROOT
    MD5FAIL=0
    for rpmcheck in `find . -name "*.rpm"` ; do
	rpm -K $USEPGP  $USEGPG  $rpmcheck
	if [ $? -ne 0 ] ; then
	    echo "${rpmcheck} ... signature checking failed " 
	    mv  $rpmcheck  "${OLDDIR}/$(basename ${rpmcheck}).CDcheckfail"
	    echo "... moved to ${OLDDIR}/$(basename ${rpmcheck}).CDcheckfail"
	    MD5FAIL=1
	fi
    done
    if [ $MD5FAIL -eq 1 ] ; then
	echo "Error: signatures checking failed...the main tree is incomplete...aborting"
	exit 1
    fi
fi

# Copy new boot image files to the right place...
if [ -d $IMGDIR ] ; then
    for bootimage in `ls -rt ${IMGDIR}/*` ; do
	oldimage=${OMGDIR}/$(echo $(basename ${bootimage}) |sed 's/-.*\././g')
	if [ ${bootimage} -nt ${oldimage} -a -f ${oldimage} ] ; then
	    cp -pv ${bootimage} ${oldimage}
	    continue
	fi
	# check if there are updates for anaconda and copy them in the main tree
	# (For 6.x, they are named differently in 6.1 and 6.2, why???)
	if [ $(echo $(basename ${bootimage}) |cut -c1-6) = "update" ] ; then
	    RHSERIES=$(echo $RHVERSION |cut -c1)
	    if [ $RHSERIES -le 6 ] ; then
                # directory where the updates have to be copied to
		TMPMNT=$(mktemp -d /tmp/update.img.XXXXXX)
		mount -o loop $bootimage $TMPMNT
		cd $TMPMNT
		ANACONDIR=${RHROOT}/misc/src/anaconda
		find . -type f  ! -name "__init__.py"  -exec cp -pv --parents  {} \
		    ${ANACONDIR}  \;
		cd - && umount $TMPMNT && rm -rf $TMPMNT
	    else
	        # anaconda updates inclusion in 7.x and 8.x 
		cp ${bootimage} ${RHROOT}/RedHat/base/updates.img
	    fi
	fi
    done
fi

exit 0

#@ updateCD.sh
