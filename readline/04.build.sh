#!/usr/bin/env bash

source 00globals.sh

# Subroutines
# -----------

# Build documentation
function build_documentation ()
{
    echo "No docs to be built."
}

# Build the program
function build_program ()
{
    cd "$localroot/$srcdir"
    make
}

# Main Program
# ------------

build_documentation \
    && build_program
