#!/usr/bin/env bash

cd ~/src
curl -O http://www.hpl.hp.com/personal/Hans_Boehm/gc/gc_source/gc-7.2d.tar.gz
tar zvfx gc-7.2d.tar.gz
cd gc-7.2
CC="clang" CXX="clang++" ./configure --prefix=$HOME --enable-static -disable-shared
make
make check
make install
