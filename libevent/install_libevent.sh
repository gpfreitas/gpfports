#!/usr/bin/env sh

PREFIX="${HOME}/local"

cd "${PREFIX}"/src
curl -J -L -O 'https://github.com/downloads/libevent/libevent/libevent-2.0.21-stable.tar.gz'
tar zvfx libevent-2.0.21-stable.tar.gz
cd "${PREFIX}"/src/libevent-2.0.21-stable
./configure --prefix="${PREFIX}" --disable-shared \
  && make \
  && make verify \
  && make install

