#!/usr/bin/env bash

MIRROR='http://ftp.gnu.org/gnu'
PROGRAM='mpfr'
VERSION='3.1.1'
FETCH="/Users/guilherme/bin/curl -C -L -O"
CFLAGS="--disable-shared --enable-static --build=x86_64-apple-darwin11.4.0 --prefix=$HOME"

cd ~/src \
    && $FETCH $MIRROR/$PROGRAM/$PROGRAM-$VERSION.tar.bz2 \
    && $FETCH $MIRROR/$PROGRAM/$PROGRAM-$VERSION.tar.bz2.sig \
    && gpg --verify $PROGRAM-$VERSION.tar.bz2.sig \
    && tar jvfx $PROGRAM-$VERSION.tar.bz2  \
    && cd $PROGRAM-$VERSION \
    && ./configure $CFLAGS \
    && make 1>stdout_make.log 2>stderr_make.log\
    && make check \
    && make install


