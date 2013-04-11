#!/usr/bin/env bash

cd ~/src
curl -O ftp://ftp.gnu.org/gnu/aspell/aspell-0.60.6.1.tar.gz
tar zvfx aspell-0.60.6.1.tar.gz
cd aspell-0.60.6.1
./configure --prefix=$HOME
make
make install

