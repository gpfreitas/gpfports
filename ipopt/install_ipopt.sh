#!/usr/bin/env bash

# TODO: Check authenticity (signature) and integrity of the downloaded files.
# Build shared libraries properly (not really necessary, but from a technical
# point of view, I'd like to learn it; it seems to require a GNU gcc, instead
# of Apple's).

# Description, Instructions Conventions and Overview
# ==================================================

# Description: this script will compile and install IPOPT to
# $INSTALL_DIR following GNU conventions.

# Instructions: Set the variables in the section 'Hand-Coded Definitions' and
# run run the script. If you can choose which version of IPOPT to install by
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
LIBPREFIX="Ipopt"

# Remote names
REMOTE_SOURCE="http://www.coin-or.org/download/source/Ipopt/Ipopt-3.10.1.tgz"



# Local commands and paths
FETCH="curl -O"
UNPACK="tar zfx"
AUTHENTICATE=""
CHECK_INTEGRITY=""
INSTALL_DIR="$HOME" 
ASL_DIR="$INSTALL_DIR/src/ampl/solvers"
#HSL="$PWD/mc19ad.f $PWD/ma27ad.f"
HSL="$PWD/ma57ad.f"

# Set to 1 to check compilation, 0 otherwise.
MAKECHECK=1

CONFFLAGS=--disable-shared \
  --with-blas="-framework vecLib" --with-lapack="-framework vecLib"
  #--with-blas=BUILD --with-lapack=BUILD
  F77=gfortran FFLAGS="-fexceptions -m64 -fbackslash" \
  CFLAGS="-fno-common -no-cpp-precomp -fexceptions -arch x86_64 -m64" \
  CXXFLAGS="-fno-common -no-cpp-precomp -fexceptions -arch x86_64 -m64"


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
if [ ! -f $LIBPREFIX*.tgz ]
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
PACKAGE=`find . -name "$LIBPREFIX*.tgz" -depth 1`
PACKAGE=${PACKAGE:2:100}
PACKAGENAME=${PACKAGE%.tgz} #something like `gsl-1.15`

echo "
Unpacking $PACKAGE...
-----------------------------
"
$UNPACK $PACKAGE


# 4. Check authenticity of the files (TODO)
# =========================================

echo "
Not checking authenticity of downloaded files...
------------------------------------------------
"


# 5. Check integrity of the files (TODO)
# ======================================

echo "
Not checking integrity of downloaded files...
---------------------------------------------
"

# 6. Configure
# ============

echo "
Configuring $PACKAGENAME...
---------------------------
"

cd $PACKAGENAME

for lincode in $HSL
do
    cp $lincode ThirdParty/HSL
done

#cd ThirdParty/Blas
#./get.Blas
#cd ../..
#
#cd ThirdParty/Lapack
#./get.Lapack
#cd ../..

cd ThirdParty/Metis
./get.Metis
cd ../..

cd ThirdParty/ASL
./get.ASL
cd ../..

#cd ThirdParty/Mumps
#./get.Mumps
#cd ../..

mkdir build64_hslma57
cd build64_hslma57

../configure "$CONFFLAGS"


# 7. Compile
# ==========

make


# 8. Check Compilation
# ====================

if [ $MAKECHECK = 1 ]
then 
	echo "Checking compilation... Check log file at $INSTALL_DIR/src."
	echo "---------------------------------------------------------------"
	make test > log 2>&1 
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

