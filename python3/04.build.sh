#!/usr/bin/env bash

source 00globals.sh

# Subroutines
# -----------

# Build documentation
function build_documentation ()
{
    cd "$localroot/$srcdir"
    cd Doc
    make html
    make epub
    # Documentation now available at $localroot/$srcdir/Doc/build
}

# Build the program
function build_program ()
{
    cd "$localroot/$srcdir"
    make
}

# Main Program
# ------------

build_documentation
build_program
