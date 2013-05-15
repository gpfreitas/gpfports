# Globals
# -------

# Local machine
PREFIX="${HOME}/local"
localroot="${PREFIX}/src"
portdir=$PWD

# Remote information
name=Python
version=3.3.1 #  Sat Oct  6 23:39:44 PDT 2012
program="$name-$version"
srcdir="$name-$version"
tarball="$name-$version".tar.bz2
sigfile="$tarball".asc
mirror="http://www.python.org/ftp/python/$version"

# Environment Variables
export CC="clang"
export CXX="clang++"


