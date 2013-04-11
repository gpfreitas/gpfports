#!/usr/bin/env bash

cd ~/src
curl ftp://ftp.gnu.org/gnu/plotutils/plotutils-2.6.tar.gz |tar xz
cd plotutils-2.6
./configure --prefix=$HOME --disable-shared
make
make check
make install

