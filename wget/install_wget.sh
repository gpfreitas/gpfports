#!/usr/bin/env sh

PREFIX="${HOME}/local"

cd "$PREFIX/src"
curl -O "http://mirrors.kernel.org/gnu/wget/wget-1.14.tar.gz"
curl -O "http://mirrors.kernel.org/gnu/wget/wget-1.14.tar.gz.sig"
gpg --verify wget-1.14.tar.gz.sig && tar zvfx wget-1.14.tar.gz
cd wget-1.14
./configure --disable-shared --prefix="$PREFIX" \
    && make \
    && make check \
    && make install
