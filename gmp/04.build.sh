#!/usr/bin/env bash

source 00globals.sh

# Subroutines
# -----------

# Build documentation
function build_documentation ()
{
    echo ""
}

# Build the program
function build_program ()
{
    cd "$localroot/$srcdir"
    make 1>stdout_make.log 2>stderr_make.log
}

# Main Program
# ------------

build_documentation
build_program
