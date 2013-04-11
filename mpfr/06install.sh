#!/usr/bin/env bash

source 00globals.sh

# Subroutines
# -----------

# Install the program in the appropriate place
function install_program ()
{
    cd "$localroot/$srcdir"
    make install
}

# Main Program
# ------------

install_program
