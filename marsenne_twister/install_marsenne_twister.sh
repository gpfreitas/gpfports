#!/usr/bin/env sh

cd ~/src
curl -L "http://www.math.sci.hiroshima-u.ac.jp/~m-mat/bin/dl/dl.cgi?SFMT:dSFMT-src-2.2.1.tar.gz" | tar zx
cd dSFMT-src-2.2.1
make sse2-check


