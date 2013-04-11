#!/usr/bin/env bash

cd ~/src
#curl -O http://www.math.uiuc.edu/Macaulay2/Downloads/SourceCode/Macaulay2-1.4-r12617-src.tar.bz2
svn co -q svn://svn.macaulay2.com/Macaulay2/trunk/M2
#patch -p0 < /Users/guilherme/archive/config_scripts/mLionMBA/macaulay2/Macaulay2-1.4-r12617-l01.patch 
cd M2
#svn update
make
cd BUILD && mkdir -p gpfmba && cd gpfmba
CC="clang" CXX="clang++" ../../configure --prefix=$HOME --enable-static --disable-shared --with-veclib --enable-download
make
make check
