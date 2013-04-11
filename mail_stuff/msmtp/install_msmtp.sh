#!/usr/bin/env bash

cd ~/src
git clone git://msmtp.git.sourceforge.net/gitroot/msmtp/msmtp
cd msmtp
autoreconf -i
./configure --prefix=$HOME --with-ssl=openssl --with-macosx-keyring
make
make install

