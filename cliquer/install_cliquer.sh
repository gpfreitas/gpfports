#!/usr/bin/env sh

cd ~/src
curl http://users.tkk.fi/~pat/cliquer/cliquer-1.21.tar.gz |tar zvx
cd cliquer-1.21
mkdir doc
cd doc
curl -O http://users.tkk.fi/~pat/cliquer/cliquer.pdf
cd ..
make
make test



