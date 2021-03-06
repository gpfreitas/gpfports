#!/usr/bin/env sh

PREFIX="$HOME/local"

test -d "$PREFIX"/src || mkdir "$PREFIX"/src

cd "$PREFIX"/src \
    && curl -O http://www.ivarch.com/programs/sources/pv-1.4.6.tar.gz \
    && curl -O http://www.ivarch.com/programs/sources/pv-1.4.6.tar.gz.txt \
    && gpg --verify pv-1.4.6.tar.gz.txt pv-1.4.6.tar.gz \
    && gunzip pv-1.4.6.tar.gz && tar -xf pv-1.4.6.tar \
    && cd pv-1.4.6 \
    && ./configure --prefix="$PREFIX" \
    && make \
    && make install


