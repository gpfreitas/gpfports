#!/usr/bin/env bash

PREFIX="${HOME}/local"

cd "${PREFIX}"/src \
    && curl -O http://mirrors.kernel.org/gnu/automake/automake-1.13.1.tar.gz \
    && curl -O http://mirrors.kernel.org/gnu/automake/automake-1.13.1.tar.gz.sig \
    && gpg --verify automake-1.13.1.tar.gz.sig  \
    && tar zvfx automake-1.13.1.tar.gz \
    && cd automake-1.13.1 \
    && ./configure --prefix="$PREFIX" \
    && make \
    && make install



