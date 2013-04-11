#!/usr/bin/env bash

cd ~/src \
    && ~/bin/curl -O http://ftp.gnu.org/gnu/automake/automake-1.12.tar.gz \
    && ~/bin/curl -O http://ftp.gnu.org/gnu/automake/automake-1.12.tar.gz.sig \
    && gpg --verify  automake-1.12.tar.gz.sig \
    && tar zvfx automake-1.12.tar.gz \
    && cd automake-1.12 \
    && ./configure --prefix=$HOME \
    && make \
    && make install



