#!/usr/bin/env bash

source 00globals.sh

# Subroutines
# -----------

# Configure the build instructions
function configure_build ()
{
    cd "$localroot/$srcdir"
    CC="gcc" MACOSX_DEPLOYMENT_TARGET="10.8" ./configure --prefix=/Users/guilherme
}

# Main Program
# ------------

configure_build
