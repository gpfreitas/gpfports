#!/usr/bin/env bash

# TODO: Check authenticity (signature) and integrity of the downloaded files.
# Build shared libraries properly (not really necessary, but from a technical
# point of view, I'd like to learn it; it seems to require a GNU gcc, instead
# of Apple's).

# Description, Instructions Conventions and Overview
# ==================================================

# Description: this script will compile and install the The GNU Multiple
# Precision Arithmetic Library (GMP, also known as GNU MP Bignum Library) to
# $INSTALL_DIR following GNU conventions.

# Instructions: Set the variables in the section 'Hand-Coded Definitions' and
# run run the script. If you can choose which version of the GMP to install by
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
LIBPREFIX="gmp"

# Remote names
REMOTE_SOURCE="ftp://ftp.gmplib.org/pub/gmp-5.0.2/gmp-5.0.2.tar.gz"
REMOTE_SIGNATURE=""
REMOTE_CHECKSUM=""

# Local commands and paths
FETCH="curl -O"
UNPACK="tar zfx"
AUTHENTICATE=""
CHECK_INTEGRITY=""
INSTALL_DIR="$HOME" 

# Possible archs: i386 ppc x86_64 ppc64.
# ARCH="x86_64"
 
# Number of cpus to use during compile.
COMPILETHREADS=2
 
COMPILER="gcc"
#COMPILER=/Developer/usr/bin/llvm-g++-4.2
 
# configure flags
CONFFLAGS="--disable-shared --enable-fat --enable-cxx"
 
# compiler flags
COMPFLAGS="-g -O2"
 
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
if [ ! -f $LIBPREFIX*.tar.gz ]
then
	echo "\n---> Source not downloaded. Downloading it now...\n"
	$FETCH $REMOTE_SOURCE
	$FETCH $REMOTE_SIGNATURE
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

# 6. Patching
# ===========

# For the patch, see
# http://gmplib.org/list-archives/gmp-bugs/2011-July/002308.html

cd $PACKAGENAME

(
cat <<'MACOSXLIONPATCH'
diff -rupN gmp-5.0.2/acinclude.m4 gmp-5.0.2new/acinclude.m4
--- gmp-5.0.2/acinclude.m4	2011-05-08 02:49:29.000000000 -0700
+++ gmp-5.0.2new/acinclude.m4	2011-12-31 00:50:57.000000000 -0800
@@ -1941,8 +1941,8 @@ X86_PATTERN | x86_64-*-*)
 esac
 
 cat >conftest.c <<EOF
-extern const int foo[];		/* Suppresses C++'s suppression of foo */
-const int foo[] = {1,2,3};
+extern const int foo[[]];		/* Suppresses C++'s suppression of foo */
+const int foo[[]] = {1,2,3};
 EOF
 echo "Test program:" >&AC_FD_CC
 cat conftest.c >&AC_FD_CC
diff -rupN gmp-5.0.2/configure gmp-5.0.2new/configure
--- gmp-5.0.2/configure	2011-05-08 02:49:33.000000000 -0700
+++ gmp-5.0.2new/configure	2011-12-31 00:50:53.000000000 -0800
@@ -26446,8 +26446,8 @@ i?86*-*-* | k[5-8]*-*-* | pentium*-*-* |
 esac
 
 cat >conftest.c <<EOF
-extern const int foo;		/* Suppresses C++'s suppression of foo */
-const int foo = {1,2,3};
+extern const int foo[];		/* Suppresses C++'s suppression of foo */
+const int foo[] = {1,2,3};
 EOF
 echo "Test program:" >&5
 cat conftest.c >&5
MACOSXLIONPATCH
) > gmp502.patch

patch -p1 < gmp502.patch

# 7. Configure
# ============

echo "
---> Configuring $PACKAGENAME...
"


# sh autogen.sh # OBSOLETE. Trying to use Mac OS X's libtool to enable shared
# libraries. When used, gave me the following message:
# If you use a recent version of autotools, this script is obsolete
# Just run autoreconf -i -f -v
# followed by ./configure --enable-maintainer-mode. So that's what we will do.
# autoreconf -i -f -v

#env CC="$COMPILER" CFLAGS="-arch $ARCH $COMPFLAGS" LDFLAGS="-arch $ARCH" ./configure $CONFFLAGS --build=$ARCH --prefix=$INSTALL_DIR

env CC="$COMPILER" CFLAGS="$COMPFLAGS" ./configure $CONFFLAGS --prefix=$INSTALL_DIR


# 8. Compile
# ==========

nice make -j $COMPILETHREADS

# 9. Check Compilation
# ====================

if [ $MAKECHECK = 1 ]
then 
	echo "\n---> Checking compilation... Check log file at $INSTALL_DIR/src.\n"
	make check > log 2>&1 
	#make check
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

