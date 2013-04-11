#!/usr/bin/env bash

source 00globals.sh


# Subroutines
# -----------

# Configure the build instructions
function configure_build ()
{
    cd "$localroot/$srcdir"
    CC="clang" CXX="clang++" ./Configure -s --prefix=$HOME --with-gmp=$HOME --with-readline=$HOME
}

# Main Program
# ------------

configure_build
