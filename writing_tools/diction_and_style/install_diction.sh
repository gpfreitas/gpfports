#!/usr/bin/env bash

cd ~/src
curl -O http://ftp.gnu.org/gnu/diction/diction-1.11.tar.gz
tar zvfx diction-1.11.tar.gz
cd diction-1.11
./configure --prefix=$HOME
make
make check
make install

