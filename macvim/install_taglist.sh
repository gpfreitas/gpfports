#!/usr/bin/env bash

# Description, Instructions Conventions and Overview
# ==================================================

# Description: this script will compile and install MacVim to $INSTALL_DIR. In
# the end, the user has to drag and drop MacVim.app to the desired folder
# manually.

# Instructions: Set the variables in the section 'Hand-Coded Definitions' and
# run the script.

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

# Remote names
REMOTE_SOURCE="https://github.com/vim-scripts/taglist.vim.git"


# Local commands and paths
FETCH="git clone"
INSTALL_DIR="$HOME" 
SRCDIR='taglist.vim'
VIMDIR="$HOME"/.vim



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
echo "
Downloading/Updating Source Code ...
------------------------------------
"
$FETCH $REMOTE_SOURCE

# 4. Install
# ============


cd $SRCDIR
cp -rf * $VIMDIR


