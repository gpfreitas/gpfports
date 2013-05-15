# Globals
# -------

# Local machine
PREFIX="${HOME}/local"
localroot="$PREFIX/src"
portdir=$PWD

# Remote information
name=mpc
version=1.0.1 # Sun Oct  7 16:22:55 PDT 2012
program="$name-$version"
srcdir="$program"
tarball="$program".tar.gz
sigfile="$tarball".sig
mirror="http://ftp.gnu.org/gnu/$name"

# Environment Variables
export MACOSX_DEPLOYMENT_TARGET=10.8
# export CFLAGS="-arch x86_64 -arch i386"
# export CCFLAGS="-arch x86_64 -arch i386 "
# export CXXFLAGS="-arch x86_64 -arch i386"
# export LDFLAGS="-arch x86_64 -arch i386"
