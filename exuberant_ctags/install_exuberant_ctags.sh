#!/usr/bin/env bash

# TODO: Check authenticity (signature) and integrity of the downloaded files.
# Build shared libraries properly (not really necessary, but from a technical
# point of view, I'd like to learn it; it seems to require a GNU gcc, instead
# of Apple's).

# Description, Instructions Conventions and Overview
# ==================================================

# Description: this script will compile and install Exuberant Ctags to
# $INSTALL_DIR.

# Instructions: Set the variables in the section 'Hand-Coded Definitions' and
# run run the script. If you can choose which version of ctags to install by
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

# Library Info
LIBPREFIX="ctags"


# Remote names
REMOTE_SOURCE="https://ctags.svn.sourceforge.net/svnroot/ctags/tags/ctags-5.8"
REMOTE_SIGNATURE=""
REMOTE_CHECKSUM=""



# Local commands and paths
FETCH="svn co"
UNPACK=""
AUTHENTICATE=""
CHECK_INTEGRITY=""
INSTALL_DIR="$HOME" 

# Set to 1 to check compilation, 0 otherwise.
MAKECHECK=1


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
if [ ! -d $LIBPREFIX* ]
then
	echo "Source not downloaded. Downloading it now..."
	echo "--------------------------------------------"
	$FETCH $REMOTE_SOURCE
	#$FETCH $REMOTE_SIGNATURE
	#$FETCH $REMOTE_CHECKSUM
else
	echo "Source already downloaded."
	echo "--------------------------------------------"
fi

# Find the name of the source file to redefine $PACKAGE. This allows us to use
# a manually downloaded package.
PACKAGE=`find . -name "$LIBPREFIX*" -depth 1`
echo $PACKAGE
PACKAGE=${PACKAGE:2:100}
PACKAGENAME=${PACKAGE%} #something like `gsl-1.15`


# 6. Configure
# ============

echo "
Configuring $PACKAGENAME...
---------------------------
"

cd $PACKAGENAME

autoheader
autoconf
./configure --disable-shared --prefix=$INSTALL_DIR


# 7. Compile
# ==========

make


# 8. Check Compilation
# ====================

if [ $MAKECHECK = 1 ]
then 
	echo "Checking compilation... Check log file at $INSTALL_DIR/src."
	echo "---------------------------------------------------------------"
	make check > log 2>&1 
else
	echo "Not checking compilation."
	echo "-------------------------"
fi


# 9. Install
# ==========


echo "
Installing $PACKAGENAME at $INSTALL_DIR...
------------------------------------------
"
make install

echo "
======================
Installation Complete.
======================
"

make clean

