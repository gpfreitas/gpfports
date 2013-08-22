#!/usr/bin/env sh

PREFIX="$HOME/local"
tarball="parallel-20130822.tar.bz2"


cd "$PREFIX"/src \
    && curl -O http://ftp.gnu.org/gnu/parallel/"$tarball" \
    && curl -O http://ftp.gnu.org/gnu/parallel/"$tarball".sig \
    && gpg --verify "$tarball".sig "$tarball" \
    && tar jfxv "$tarball" \
    && cd $(basename "$tarball" .tar.bz2) \
    && ./configure --prefix="$PREFIX" \
    && make \
    && make install


