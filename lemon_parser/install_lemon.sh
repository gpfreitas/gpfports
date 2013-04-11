#!/usr/bin/env sh

# the parser used by SQLite. In two files. =)

cd ~/src
mkdir -p lemon; cd lemon

# the parser generator itself
curl -L -o "lemon.c" "http://www.sqlite.org/src/artifact?ci=trunk&filename=tool/lemon.c"
# template for the parser subroutine that lemon generates
curl -L -o "lempar.c" "http://www.sqlite.org/src/artifact?ci=trunk&filename=tool/lempar.c"
# documentation
curl -O http://www.hwaci.com/sw/lemon/lemon.html

