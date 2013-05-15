#!/usr/bin/env bash

PREFIX="${HOME}/local"

cd "$PREFIX"/src
curl http://valgrind.org/downloads/valgrind-3.8.1.tar.bz2 | tar jx
cd valgrind-3.8.1
./configure --prefix="$PREFIX"
make
make install

