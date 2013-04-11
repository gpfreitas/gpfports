#!/usr/bin/env bash

# Description, Instructions Conventions and Overview
# ==================================================

# Description: this script will compile and install the ExifTool Library
# (exiftool) to $INSTALL_DIR

# Instructions: Set the variables in the section 'Hand-Coded Definitions' and
# run run the script. If you can choose which version of the exiftool to
# install by either setting the variables in the section 'Hand-Coded
# Definitions' or by downloading the source to $INSTALL_DIR/src.

# Conventions: For any macro that refers to a command, use a verb; for all
# others, use nouns. Print messages telling the user what is going on.

# Overview of the script:

# 1. Set hand-coded definitions.
# 2. Set automatic definitions.
# 3. Fetch the source code and supporting files. Download to $INSTALL_DIR/src.
# 4. Check autenticity of the files, if possible.
# 5. Check integrity of the files, if possible.
# 6. Configure.
# 7. Compile.
# 8. Check compilation.
# 9. Install. Make sure to use Unix conventions for the following directories:
#    src, lib, include, bin, share, doc, man


# 1. Hand-Coded Definitions
# =========================

# Libray Info
LIBPREFIX="Image-ExifTool"
exiflib='exiflib'


# Remote names
REMOTE_SOURCE="http://owl.phy.queensu.ca/~phil/exiftool/Image-ExifTool-8.75.tar.gz"
#REMOTE_SIGNATURE="http://www.mpfr.org/mpfr-current/mpfr-3.1.0.tar.gz.asc"
#REMOTE_CHECKSUM=""
#PATCH1="http://www.mpfr.org/mpfr-current/allpatches"

# Local commands and paths
FETCH="curl -O"
UNPACK="tar zfx"
#AUTHENTICATE=""
#CHECK_INTEGRITY=""
INSTALL_DIR="$HOME" 

# Possible archs: i386 ppc x86_64 ppc64.
#ARCH="x86_64"
 
# Number of cpus to use during compile.
COMPILETHREADS=2
 
#COMPILER=gcc
#COMPILER=/Developer/usr/bin/llvm-g++-4.2
#COMPILER=/Developer/usr/bin/llvm-gcc-4.2
 
# configure flags
CONFFLAGS="--disable-shared"
 
# compiler flags
COMPFLAGS="-g -O2"
 
# Set to 1 to check compilation, 0 otherwise.
#MAKECHECK=1


# 2. Automatic Definitions (Don't touch these)
# ============================================


# 3. Fetch the source code
# ========================

echo "
=======================
Beginning Installation.
=======================
"

# If $INSTALL_DIR/src does not exist, create it and go there
if [ ! -d "$INSTALL_DIR/src" ]; then
	mkdir "$INSTALL_DIR/src"
fi
cd "$INSTALL_DIR/src"

# Download source code if necessary
if [ ! -f $LIBPREFIX*.tar.gz ]
then
	echo "\n---> Source not downloaded. Downloading it now...\n"
	$FETCH $REMOTE_SOURCE
	#$FETCH $REMOTE_SIGNATURE
	#$FETCH $REMOTE_CHECKSUM
else
	echo "\n---> Source already downloaded.\n"
fi

# Find the name of the source file to redefine $PACKAGE. This allows us to use
# a manually downloaded package.
PACKAGE=`find . -name "$LIBPREFIX*.tar.gz" -depth 1`
PACKAGE=${PACKAGE:2:100}
PACKAGENAME=${PACKAGE%.tar.gz} #something like `gsl-1.15`

echo "
---> Unpacking $PACKAGE...
"
$UNPACK $PACKAGE


# 4. Check authenticity of the files (TODO)
# =========================================

echo "
---> Not checking authenticity of downloaded files...
"


# 5. Check integrity of the files (TODO)
# ======================================

echo "
---> Not checking integrity of downloaded files...
"

# 6. Configure
# ============


#echo "
#---> Configuring $PACKAGENAME...
#"
#
cd $PACKAGENAME
sed -i -e "s#\/lib#\/$exiflib#" exiftool
#
## Download patch
#$FETCH $PATCH1
#patch -N -Z -p1 < ./`basename ${PATCH1}`

# sh autogen.sh # OBSOLETE. Trying to use Mac OS X's libtool to enable shared
# libraries. When used, gave me the following message:
# If you use a recent version of autotools, this script is obsolete
# Just run autoreconf -i -f -v
# followed by ./configure --enable-maintainer-mode. So that's what we will do.
# autoreconf -i -f -v

#env CC="$COMPILER" CFLAGS="-I$INSTALL_DIR/include  $COMPFLAGS" LDFLAGS="-L$INSTALL_DIR/lib" ./configure $CONFFLAGS --prefix=$INSTALL_DIR


# 7. Compile
# ==========

perl Makefile.PL
#nice make -j $COMPILETHREADS

# 8. Check Compilation
# ====================

make test > log 2>&1 

# 9. Install
# ==========


echo "
---> Installing $PACKAGENAME at $INSTALL_DIR...
"
cp exiftool "$INSTALL_DIR"/bin
cp -r lib "$INSTALL_DIR/bin/$exiflib"

echo "
======================
Installation Complete.
======================
"

