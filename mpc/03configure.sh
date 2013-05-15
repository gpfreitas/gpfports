#!/usr/bin/env bash

source 00globals.sh


# Subroutines
# -----------

# Configure the build instructions
function configure_build ()
{
    cd "$localroot/$srcdir"
    CC="clang" CXX="clang++" ./configure --build=x86_64-apple-darwin12.2.0 --prefix=$PREFIX --with-gmp=$PREFIX --with-mpfr=$PREFIX --enable-valgrind-tests
}

# Main Program
# ------------

configure_build
