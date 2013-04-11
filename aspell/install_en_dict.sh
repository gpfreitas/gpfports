#!/usr/bin/env bash

cd ~/src
curl -O ftp://ftp.gnu.org/gnu/aspell/dict/en/aspell6-en-6.0-0.tar.bz2
tar jvfx aspell6-en-6.0-0.tar.bz2
cd aspell6-en-6.0-0
./configure
make
make install

