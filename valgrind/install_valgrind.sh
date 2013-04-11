#!/usr/bin/env bash

cd ~/src
curl http://valgrind.org/downloads/valgrind-3.7.0.tar.bz2 | tar jx
cd valgrind-3.7.0
./configure --prefix=$HOME
make
make install

