#!/usr/bin/env bash

source 00globals.sh

# Subroutines
# -----------

# Build documentation
function build_documentation ()
{
    cd "$localroot/$srcdir"
}

# Build the program
function build_program ()
{
    cd "$localroot/$srcdir"
    make -j2 all
}

# Main Program
# ------------

build_documentation && build_program

