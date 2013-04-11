#!/usr/bin/env bash

VERSION=3.4.2

cd ~/src
curl -O http://www.netlib.org/lapack/lapack-"$VERSION".tgz
tar zfvx lapack-"$VERSION".tgz

