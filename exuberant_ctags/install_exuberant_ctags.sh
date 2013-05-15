#!/usr/bin/env bash

PREFIX="${HOME}/local"

cd "$PREFIX/src"
curl -J -L -O http://prdownloads.sourceforge.net/ctags/ctags-5.8.tar.gz
tar zvfx ctags-5.8.tar.gz
cd ctags-5.8
./configure --prefix="${PREFIX}"
make -j 2 && make install


