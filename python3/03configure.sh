#!/usr/bin/env bash

source 00globals.sh

# Subroutines
# -----------

# Configure the build instructions
function configure_build ()
{
    cd "$localroot/$srcdir"
    ./configure --prefix="$HOME"
}

# Main Program
# ------------

configure_build

