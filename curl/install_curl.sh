#!/usr/bin/env bash

# Put the cURL tarball in ~/src
# Put the signature file there too
# Check auth/integr of cURL tarball
# Get root CA certs from cacert.org
# Check auth/integr certificate bundle from cacert
# configure, make, make install

MIRROR=http://curl.haxx.se/download/
FETCH=wget
PROGRAM='curl'
VERSION='7.27.0'
CFLAGS="--enable-static --disable-shared --prefix=$HOME --with-ca-path=$HOME/share/ca-certificate"

wget http://www.cacert.org/certs/root.crt
cat root.crt >> /opt/local/share/curl/curl-ca-

cd ~/src \
    && $FETCH $MIRROR/$PROGRAM/$PROGRAM-$VERSION.tar.gz \
    && $FETCH $MIRROR/$PROGRAM/$PROGRAM-$VERSION.tar.gz.asc \
    && gpg --verify $PROGRAM-$VERSION.tar.gz.asc \
    && tar zvfx $PROGRAM-$VERSION.tar.gz  \
    && cd $PROGRAM-$VERSION \
    && ./configure $CFLAGS \
    && make -k 1>stdout_make.log 2>stderr_make.log\
    && make check \
    && make install
    && $FETCH http://www.cacert.org/certs/root.crt
    # Verify authenticity and integrity of certificate bundle
    && cat root.crt >> $HOME/share/curl/curl-ca-certificate/curl-ca-bundle.crt

