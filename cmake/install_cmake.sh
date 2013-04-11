#!/usr/bin/env bash

# Description, Instructions Conventions and Overview
# ==================================================

# Description: this script will compile and install the CMAKE library to
# $INSTALL_DIR

# Instructions: Set the variables in the section 'Hand-Coded Definitions' and
# run run the script. If you can choose which version of CMAKE to install by
# either setting the variables in the section 'Hand-Coded Definitions' or by
# downloading the source to $INSTALL_DIR/src.

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
LIBPREFIX="cmake"

# Remote names
REMOTE_SOURCE="http://www.cmake.org/files/v2.8/cmake-2.8.7.tar.gz"
REMOTE_SIGNATURE=""
REMOTE_CHECKSUM=""

# Local commands and paths
FETCH="curl -O"
UNPACK="tar zfx"
AUTHENTICATE=""
CHECK_INTEGRITY=""
INSTALL_DIR="$HOME" 

# Possible archs: i386 ppc x86_64 ppc64.
ARCH="x86_64"
 
# Number of cpus to use during compile.
COMPILETHREADS=2
 
COMPILER="llvm-gcc"
#COMPILER=/Developer/usr/bin/llvm-g++-4.2
 
# configure flags
# Would like to enable AVX but XCode4 ships gcc without it, and clang crashes
#CONFFLAGS="--disable-shared --enable-avx"
# Hope the following works in Sandy Bridge, which should be avx.
#CONFFLAGS="--disable-shared --enable-sse2"
CONFFLAGS="--disable-shared"
 
# compiler flags
COMPFLAGS="-g -O2"
 
# Set to 1 to check compilation, 0 otherwise.
MAKECHECK=0


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



# 4. Check authenticity of the files (TODO)
# =========================================


echo "
---> Not checking authenticity of downloaded files...
"


# 5. Check integrity of the files (TODO)
# ======================================

#$CHECK_INTEGRITY $PACKAGE

echo "
---> Unpacking $PACKAGE...
"
$UNPACK $PACKAGE

# 6. Patching
# ===========

cd $PACKAGENAME

# 7. Configure
# ============

echo "
---> Configuring $PACKAGENAME...
"

#env CC="$COMPILER" CFLAGS="$COMPFLAGS" ./configure $CONFFLAGS --prefix=$INSTALL_DIR
env CC="$COMPILER" CFLAGS="$COMPFLAGS" ./bootstrap --prefix=$INSTALL_DIR


# 8. Compile
# ==========

nice make -j $COMPILETHREADS

# 9. Check Compilation
# ====================

if [ $MAKECHECK = 1 ]
then 
	echo "\n---> Checking compilation... Check log file at $INSTALL_DIR/src.\n"
	make check > log 2>&1 
else
	echo "\n---> Not checking compilation.\n"
fi

# 10. Install
# ===========


echo "
---> Installing $PACKAGENAME at $INSTALL_DIR...
"
make install

echo "
======================
Installation Complete.
======================
"

