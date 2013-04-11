#!/usr/bin/env bash

cd ~/src
curl ftp://ftp.gnu.org/pub/gnu/miscfiles/miscfiles-1.5.tar.gz |tar zvx
cd miscfiles-1.5
./configure --prefix=$HOME
make
make install

