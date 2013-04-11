#!/usr/bin/env bash
CFLAGS="--enable-static --disable-shared --prefix=$HOME"

cd ~/src
#~/bin/curl -O http://ftp.gnu.org/gnu/libunistring/libunistring-0.9.3.tar.gz
#~/bin/curl -O http://ftp.gnu.org/gnu/libunistring/libunistring-0.9.3.tar.gz.sig
#gpg --verify libunistring-0.9.3.tar.gz.sig && tar zvfx libunistring-0.9.3.tar.gz && cd libunistring-0.9.3
cd libunistring-0.9.3
./configure $CFLAGS && make && make check && make install
#./configure CC="gcc -arch i386" \
#  CXX="g++ -arch i386" \
#  CPP="gcc -E" CXXCPP="g++ -E" \
#  --disable-dependency-tracking\
#  $CFLAGS && make && make check && make install
