#!/usr/bin/env sh

# clone
cd ~/archive/Fossil
fossil clone  http://www.fossil-scm.org/  fossil.fossil

# install source
cd ~/src
mkdir -p fossil; cd fossil
fossil open ~/archive/Fossil/fossil.fossil

# update/install binaries
cd ~/src/fossil
fossil update

# make standard build
cd ~/src/fossil
make clean
mkdir -p build_`uname -sm|tr -s ' ' '_'`
cd build_`uname -sm|tr -s ' ' '_'`
../configure --prefix="$HOME"
make


# make static build; works in chroot jails, doesn't seem to work on Mac OS X
#cd ~/src/fossil
#make clean
#mkdir -p build_`uname -sm|tr -s ' ' '_'`_static
#cd build_`uname -sm|tr -s ' ' '_'`_static
#../configure --prefix="$HOME" --static
#make
