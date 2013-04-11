#!/usr/bin/env bash

# This script should restore the local root source tree to its state before
# installation of this program was ever attempted.

source 00globals.sh

./07wipe_source.sh
./08port_clean.sh
rm -rf $localroot/$tarball
rm -rf $localroot/$sigfile
