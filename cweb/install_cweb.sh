#!/usr/bin/env bash

# Description, Instructions Conventions and Overview
# ==================================================

# Description: this script will compile and install the The CWEB System of
# Structured Documentation (CWEB) to $INSTALL_DIR following more or less GNU
# conventions.

# Instructions: Set the variables in the section 'Hand-Coded Definitions' and
# run run the script. If you can choose which version of the CWEB to install by
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
LIBPREFIX="cweb"

# Remote names
REMOTE_SOURCE="ftp://ftp.cs.stanford.edu/pub/cweb/cweb.tar.gz"
REMOTE_CHECKSUM=""



# Local commands and paths
FETCH="curl -O"
UNPACK="tar zfx"
AUTHENTICATE=""
CHECK_INTEGRITY=""
INSTALL_DIR="$HOME" 

# Set to 1 to make cautious compilation, 0 otherwise.
MAKECAUTIOUS=1


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
if [ ! -d "$INSTALL_DIR/src/$LIBPREFIX" ]; then
	mkdir "$INSTALL_DIR/src/$LIBPREFIX"
fi
cd "$INSTALL_DIR/src/$LIBPREFIX"

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

## 6. Configure
## ============
#
#echo "
#Configuring $PACKAGENAME...
#---------------------------
#"
#
#cd $PACKAGENAME
#
#./configure --disable-shared --prefix=$INSTALL_DIR
#
#
## 7. Compile
## ==========
#
#make
#
#
## 8. Check Compilation
## ====================
#
#if [ $MAKECHECK = 1 ]
#then 
#	echo "Checking compilation... Check log file at $INSTALL_DIR/src."
#	echo "-----------------------------------------------------------"
#	make check > log 2>&1 
#else
#	echo "Not checking compilation."
#	echo "-------------------------"
#fi
#
#
## 9. Install
## ==========
#
#
#echo "
#Installing $PACKAGENAME at $INSTALL_DIR...
#------------------------------------------
#"
#make install
#
#echo "
#======================
#Installation Complete.
#======================
#"
#
