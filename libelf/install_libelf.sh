#!/usr/bin/env bash

cd ~/src
curl -O http://www.mr511.de/software/libelf-0.8.13.tar.gz
tar zxvf libelf-0.8.13.tar.gz
cd libelf-0.8.13
CC="clang" CXX="clang++" ./configure --disable-shared --enable-static --prefix=$HOME
make && make check && make install


