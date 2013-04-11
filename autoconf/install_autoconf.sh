#!/usr/bin/env bash

cd ~/src \
    && ~/bin/curl -O http://ftp.gnu.org/gnu/autoconf/autoconf-2.69.tar.gz \
    && ~/bin/curl -O http://ftp.gnu.org/gnu/autoconf/autoconf-2.69.tar.gz.sig \
    && gpg --verify  autoconf-2.69.tar.gz.sig \
    && tar zvfx autoconf-2.69.tar.gz \
    && cd autoconf-2.69 \
    && ./configure --prefix=$HOME \
    && make \
    && make install



