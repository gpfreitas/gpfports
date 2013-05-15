#!/usr/bin/env sh
PREFIX="${HOME}/local"

cd "$PREFIX"/src
curl -O http://ftp.gnu.org/gnu/glpk/glpk-4.49.tar.gz
curl -O http://ftp.gnu.org/gnu/glpk/glpk-4.49.tar.gz.sig
gpg --verify glpk-4.49.tar.gz.sig && tar zfvx glpk-4.49.tar.gz
cd glpk-4.49
./configure CFLAGS="-I$PREFIX/include -L$PREFIX/lib" --prefix="$PREFIX" --disable-shared --with-gmp \
    && make \
    && make check \
    && make install


