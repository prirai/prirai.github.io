#!/bin/bash

# $Id: updateBuild.sh,v 1.13 2003/10/19 07:48:05 luigi Exp luigi $
###
# updateBuild.sh - Build the RedHat 7.3/8.0 CD installation images from 
# a distribution tree organized as on the redhat ftp site. 
# It executes the following operations:
# - Rebuild the hdlist and hdlist2 files in the RedHat/base directory
# - Rebuild the installer (useful if you have updated packages used 
#   during the installation phase) 
# - Split the main distribution tree into 5 trees whose size fits on a CD 
#   after a little reorganization of the tree (needed by splitdistro to work)
# - Regenerate the hdlist and hdlist2 files in the trees of the first 3 
#   CDs (the ones containing the RPMSs) 
# - Generate the 5 iso images to be burned on the CDs (the first one 
#   bootable)
#
# Environment variables (rhcd.conf): ANAPATH, RHVERSION, RHNAME, RHROOT, PKGFILE, 
#   DISTARCH, DISCR, ISODESTDIR, BOOTIMAGE, USEISOMD5 
#
###
# 
#   Copyright 2002-2003 Luigi Bitonti
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#

# Source the user defined variables in the file rhcd.conf
if [ -f ${RHCDPATH}/rhcd.conf ] ; then
    source ${RHCDPATH}/rhcd.conf
else
    echo "Error: missing rhcd.conf (configuration file)"
    exit 1
fi

unset ARCH

# Prepare the permissions and ownerships for splitdistro
chown  -R  root.root  $RHROOT
# This is needed to move the files to prepare the build environment
chmod  -R  u+w  $RHROOT
# Move the files in the "right" directories ($DISTARCH) for splitdistro 
if [ ! -d ${RHROOT}/${DISTARCH} ] ; then
    mkdir  -p  ${RHROOT}/${DISTARCH}
else
    echo "Error: directory ${RHROOT}/${DISTARCH} exists (cannot overwrite it)"
    exit 1
fi
cd $RHROOT
for i in `ls` ; do
    [ $i != "SRPMS" -a $i != $DISTARCH -a $i != $PKGFILE ]  &&  \
	/bin/mv  $i  $DISTARCH
    [ $i = "SRPMS" -a $RHVERSION = "8.0" ]  &&  \
	/bin/mv  $i  $DISTARCH
    [ $i = "SRPMS" -a $RHVERSION = "9" ]  &&  \
	/bin/mv  $i  $DISTARCH
done

# now, after moving the main tree, we need to modify the RHROOT variable,
# saving the old one for splitdistro to work
RHROOTOLD=$RHROOT
RHROOT=${RHROOT}/${DISTARCH}

RHSERIES=$(echo $RHVERSION |cut -c1)

# Rebuild the hdlist{,2} files
${ANAPATH}/genhdlist  $RHROOT 
[ $? -ne 0 ]  &&  echo "*** GENHDLIST FAILED ***"  &&  exit 1 
chmod  644  ${RHROOT}/RedHat/base/hdlist{,2} 

# Update RedHat/base/comps.xml or RedHat/base/comps file if $COMPSFILE exists
if [ -f $COMPSFILE ] ; then
    if [  $RHSERIES -ge 8 ] ; then 
	echo "found new partial comps file...updating with packages informations " 
        #check if the comps-extras package is installed
	rpm -qi comps-extras >/dev/null
	if [ $? -eq 0 ] ; then
	    PARTCOMPS=$(mktemp /tmp/comps-milan.xml.XXXXXX)
	    cat $COMPSFILE |sed 's!</comps>!!g' >$PARTCOMPS
	    /usr/share/comps-extras/getfullcomps.py  comps.xml  \
		$RHROOTOLD  $DISTARCH >> $PARTCOMPS
	    echo '</comps>' >> $PARTCOMPS
	    echo "overwriting the old 'RedHat/base/comps.xml' file..."
	    cp $PARTCOMPS ${RHROOT}/RedHat/base/comps.xml
	    rm $PARTCOMPS
	fi
    else
	cp $COMPSFILE ${RHROOT}/RedHat/base/comps
    fi
fi

# Rebuild the installer
# the following line should be maybe put in the conficuration file
export PYTHONPATH="/usr/lib/anaconda"
if [ $RHVERSION = "9" ] ; then
    LD_LIBRARY_PATH=/usr/X11R6/lib:$LD_LIBRARY_PATH \
	${ANAPATH}/buildinstall  --pkgorder ${RHROOTOLD}/${PKGFILE}  --comp dist-${RHVERSION} \
	--release "Redhat $RHVERSION (${RHNAME})" --product "Redhat $RHVERSION (${RHNAME})" \
	--version $RHVERSION  $RHROOT
elif [ $RHVERSION = "8.0" ] ; then
    LD_LIBRARY_PATH=/usr/X11R6/lib:$LD_LIBRARY_PATH \
	${ANAPATH}/buildinstall  --pkgorder ${RHROOTOLD}/${PKGFILE}  --comp dist-${RHVERSION} \
	--release "Redhat $RHVERSION (${RHNAME})" --version $RHVERSION  $RHROOT
else
    LD_LIBRARY_PATH=/usr/X11R6/lib:$LD_LIBRARY_PATH \
	${ANAPATH}/buildinstall  --pkgorder ${RHROOTOLD}/${PKGFILE}  --comp dist-${RHVERSION} \
	--version $RHVERSION  $RHROOT
fi
[ $? -ne 0 ]  &&  echo "*** BUILDINSTALL FAILED ***"  &&  exit 1


# Split the distribution (to burn it on CDRs)
${ANAPATH}/splitdistro  --fileorder ${RHROOTOLD}/${PKGFILE}  --release \
    "Redhat $RHVERSION (${RHNAME})"  $RHROOTOLD   $DISTARCH 
[ $? -ne 0 ]  &&  echo "*** SPLIT DISTRIBUTION FAILED ***"  &&  exit 1

# Re-generate the hdlist{,2} files
${ANAPATH}/genhdlist  --fileorder ${RHROOTOLD}/${PKGFILE}  --withnumbers \
    ${RHROOTOLD}/${DISTARCH}-disc${DISCR}
[ $? -ne 0 ]  &&  echo "*** GENHDLIST(2) FAILED ***"  &&  exit 1

# Generate the iso images
if [ ! -d $ISODESTDIR ] ; then
    mkdir -p $ISODESTDIR
   [ $? -ne 0 ] && echo "Cannot create $ISODESTDIR"  && exit 1
fi
for i in `echo 1 2 3 4 5` ; do
    cd ${RHROOTOLD}/${DISTARCH}-disc${i}
    if [ $i -eq 1 ]  ; then
	# if version is 7.x
	if [ $RHSERIES -le 7 ] ; then
	    mkisofs  -r  -J  -T  -v  -V "Red Hat $RHVERSION (${RHNAME}) disc $i"  \
		-c $BOOTCATALOG  -b ${BOOTIMAGE} -o ${ISODESTDIR}/${DISTARCH}-disc${i}.iso  .
	    [ $? -ne 0 ]  &&  echo "*** MKISOFS(${i}) FAILED ***"  &&  exit 1
	else
	    mkisofs  -r  -J  -T  -v  -V "Red Hat $RHVERSION (${RHNAME}) disc $i"  \
		-c $BOOTCATALOG  -b ${BOOTIMAGE} -no-emul-boot -boot-load-size 4 \
		-boot-info-table -o ${ISODESTDIR}/${DISTARCH}-disc${i}.iso  .
	    [ $? -ne 0 ]  &&  echo "*** MKISOFS(${i}) FAILED ***"  &&  exit 1
	fi
    else
      mkisofs  -r  -J  -T  -v  -V "Red Hat $RHVERSION (${RHNAME}) disc $i"  \
          -o ${ISODESTDIR}/${DISTARCH}-disc${i}.iso  .
      [ $? -ne 0 ]  &&  echo "*** MKISOFS(${i}) FAILED ***"  &&  exit 1
    fi
done

# Write the md5 signatures on the images and check them if requested
if [ "/$(echo $USEISOMD5 |tr [A-Z] [a-z])" = "/yes" ] ; then
    cd $ISODESTDIR
    if [ -f ${ANAPATH}/implantisomd5 -a -f ${ANAPATH}/checkisomd5 ] ; then
	for j in `ls ${ISODESTDIR}/${DISTARCH}-disc*.iso` ; do
	    #${ANAPATH}/implantisomd5  $j
	    ${ANAPATH}/implantisomd5  $j 2>&1 | grep "Done!" > /dev/null
	    [ $? -ne 0 ]  &&  echo "*** IMPLANTISOMD5(${j}) FAILED ***"  &&  exit 1
	    ${ANAPATH}/checkisomd5  $j  2>&1 | grep "Md5sums match." > /dev/null
	    #${ANAPATH}/checkisomd5  $j  2>&1 |grep "PASS" >/dev/null
	    [ $? -ne 0 ]  &&  echo "*** CHECKISOMD5(${j}) FAILED ***"  &&  exit 1
	done
    fi
fi

exit 0

#@ updateBuild.sh
