#!/usr/bin/env bash

PREFIX="${HOME}/local"

cd "$PREFIX"/src
git clone git://github.com/b4winckler/macvim.git
cd macvim/src
./configure --prefix="$PREFIX" \
            --with-features=huge \
            --enable-pythoninterp \
            --enable-cscope \  # no need to install cscope; macvim has its own
            --with-macsdk=10.8
nice make -j 2

# 8. Install
# ==========

echo "Now drag and drop MacVim.app at the desired folder..."
sleep 1

open Macvim/build/Release


