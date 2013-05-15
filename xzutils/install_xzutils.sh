#!/usr/bin/env bash

PREFIX="${HOME}/local"

cd "$PREFIX"/src
curl -O http://tukaani.org/xz/xz-5.0.4.tar.gz
tar -zxvf xz-5.0.4.tar.gz
cd xz-5.0.4
./configure --prefix="$PREFIX"
make
make check
make install
