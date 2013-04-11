

# Hand-Coded Definitions
# ======================

# Library Info
LIBPREFIX="math-atlas"

# Remote names
REMOTE_SOURCE="https://github.com/rcwhaley/math-atlas.git"

# Local commands and paths
FETCH="git clone"
UNPACK=""
AUTHENTICATE=""
CHECK_INTEGRITY=""
INSTALL_DIR="$HOME" 

# Set to 1 to check compilation, 0 otherwise.
MAKECHECK=1

CONFFLAGS=--disable-shared \
  --with-blas="-framework vecLib" --with-lapack="-framework vecLib"
  #--with-blas=BUILD --with-lapack=BUILD
  F77=gfortran FFLAGS="-fexceptions -m64 -fbackslash" \
  CFLAGS="-fno-common -no-cpp-precomp -fexceptions -arch x86_64 -m64" \
  CXXFLAGS="-fno-common -no-cpp-precomp -fexceptions -arch x86_64 -m64"


# Fetch the source code
# =====================


# If $INSTALL_DIR/src does not exist, create it and go there
if [ ! -d "$INSTALL_DIR/src" ]; then
	mkdir "$INSTALL_DIR/src"
fi
cd "$INSTALL_DIR/src"

# Download source code if necessary
if [ ! -f $LIBPREFIX*.tgz ]
then
	echo "Source not downloaded. Downloading it now..."
	echo "--------------------------------------------"
	$FETCH $REMOTE_SOURCE
	#$FETCH $REMOTE_SIGNATURE
	#$FETCH $REMOTE_CHECKSUM
else
	echo "Source already downloaded."
	echo "--------------------------------------------"
fi

# Find the name of the source file to redefine $PACKAGE. This allows us to use
# a manually downloaded package.
PACKAGE=`find . -name "$LIBPREFIX*.tgz" -depth 1`
PACKAGE=${PACKAGE:2:100}
PACKAGENAME=${PACKAGE%.tgz} #something like `gsl-1.15`

echo "
Unpacking $PACKAGE...
-----------------------------
"
$UNPACK $PACKAGE


# Check authenticity of the files (TODO)
# ======================================

echo "
Not checking authenticity of downloaded files...
------------------------------------------------
"

# Check integrity of the files (TODO)
# ===================================

echo "
Not checking integrity of downloaded files...
---------------------------------------------
"

# Configure
# =========

echo "
Configuring $PACKAGENAME...
---------------------------
"

cd $PACKAGENAME

./configure "$CONFFLAGS"


# Compile
# =======

make


# Check Compilation
# =================

if [ $MAKECHECK = 1 ]
then 
	echo "Checking compilation... Check log file at $INSTALL_DIR/src."
	echo "---------------------------------------------------------------"
	make test > log 2>&1 
else
	echo "Not checking compilation."
	echo "-------------------------"
fi


# Install
# =======


echo "
Installing $PACKAGENAME at $INSTALL_DIR...
------------------------------------------
"
make install

echo "
======================
Installation Complete.
======================
"

