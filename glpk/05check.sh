#!/usr/bin/env bash

source 00globals.sh

# Subroutines
# -----------

# Check build / execute test suite
function check_build ()
{
    cd $localroot/$srcdir
    make check
}

# Main Program
# ------------

check_build




