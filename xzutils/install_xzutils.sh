#!/usr/bin/env bash

cd ~/src
curl -O http://tukaani.org/xz/xz-5.0.4.tar.gz
tar -zxvf xz-5.0.4.tar.gz
cd xz-5.0.4
./configure --prefix=$HOME
make
make check
make install
