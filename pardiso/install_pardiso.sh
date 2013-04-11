#!/usr/bin/env bash

# TODO: Check authenticity (signature) and integrity of the downloaded files.
# Build shared libraries properly (not really necessary, but from a technical
# point of view, I'd like to learn it; it seems to require a GNU gcc, instead
# of Apple's).

# Description, Instructions Conventions and Overview
# ==================================================

# Description: this script will compile and install PARDISO to
# $INSTALL_DIR following GNU conventions.

# Instructions: Set the variables in the section 'Hand-Coded Definitions' and
# run run the script. If you can choose which version of PARDISO to install by
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
LIBPREFIX="pardiso"

# Remote names
REMOTE_SOURCE="http://www.pardiso-project.org/download/bb6ex6hze7cvjhuz15/libpardiso412-MACOS-X86-64.dylib"



# Local commands and paths
FETCH="curl -O"
UNPACK="tar zfx"
INSTALL_DIR="$HOME" 

# 2. Setup License
# ================

# License expires every 3 months
cp pardiso.lic $HOME

# 2. Fetch the source code and install
# ====================================

echo "
=======================
Beginning Installation.
=======================
"

cd "$INSTALL_DIR/lib"

# Download source code if necessary
if [ ! -f *$LIBPREFIX* ]
then
	echo "Source not downloaded. Downloading it now..."
	echo "--------------------------------------------"
	$FETCH $REMOTE_SOURCE
else
	echo "Source already downloaded."
	echo "--------------------------------------------"
fi

