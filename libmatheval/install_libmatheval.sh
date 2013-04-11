#!/usr/bin/env bash

PROGRAM='libmatheval'
VERSION='1.1.8'
FETCH='curl -O -L -C'
CFLAGS="--enable-static --disable-shared --prefix=$HOME"

cd ~/src
$FETCH http://ftp.gnu.org/gnu/$PROGRAM/$PROGRAM-$VERSION.tar.gz
$FETCH http://ftp.gnu.org/gnu/$PROGRAM/$PROGRAM-$VERSION.tar.gz.sig
gpg --verify $PROGRAM-$VERSION.tar.gz.sig \
    && tar zvfx $PROGRAM-$VERSION.tar.gz  \
    && cd $PROGRAM-$VERSION \
    && ./configure $CFLAGS \
    && make \
    && make check \
    && make install

