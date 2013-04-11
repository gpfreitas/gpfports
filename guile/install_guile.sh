#!/usr/bin/env bash

MIRROR='http://ftp.gnu.org/gnu'
PROGRAM='guile'
VERSION='1.8.8'
FETCH="/Users/guilherme/bin/curl -C -L -O"
CFLAGS="--enable-static --disable-shared --prefix=$HOME"

cd ~/src \
    && $FETCH $MIRROR/$PROGRAM/$PROGRAM-$VERSION.tar.gz \
    && $FETCH $MIRROR/$PROGRAM/$PROGRAM-$VERSION.tar.gz.sig \
    && gpg --verify $PROGRAM-$VERSION.tar.gz.sig \
    && tar zvfx $PROGRAM-$VERSION.tar.gz  \
    && cd $PROGRAM-$VERSION \
    && ./configure $CFLAGS \
    && make -k 1>stdout_make.log 2>stderr_make.log\
    && make check \
    && make install

