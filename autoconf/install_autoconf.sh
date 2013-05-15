#!/usr/bin/env bash

PREFIX="${HOME}/local"

cd "${PREFIX}"/src \
    && curl -O http://ftp.gnu.org/gnu/autoconf/autoconf-2.69.tar.gz \
    && curl -O http://ftp.gnu.org/gnu/autoconf/autoconf-2.69.tar.gz.sig \
    && gpg --verify  autoconf-2.69.tar.gz.sig \
    && tar zvfx autoconf-2.69.tar.gz \
    && cd autoconf-2.69 \
    && ./configure --prefix="$PREFIX" \
    && make \
    && make install


