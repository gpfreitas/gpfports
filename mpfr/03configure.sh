#!/usr/bin/env bash

source 00globals.sh


# Subroutines
# -----------

# Configure the build instructions
function configure_build ()
{
    cd "$localroot/$srcdir"
    CC="clang" CXX="clang++" MACOSX_DEPLOYMENT_TARGET="10.8" ./configure --build=x86_64-apple-darwin12.3.0 --prefix=$PREFIX --with-gmp=$PREFIX
}

# Main Program
# ------------

configure_build
