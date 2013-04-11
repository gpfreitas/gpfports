# Local variables
INSTALL_DIR=/Users/guilherme

# Go to local sources dir
cd $INSTALL_DIR/src

# Fetch
git clone https://github.com/libevent/libevent.git

# Bring up/checkout a specific stable release
cd libevent
git checkout release-2.0.17-stable

# Configure
./autogen.sh
./configure --prefix=$INSTALL_DIR --disable-shared

# Compile and check
make
make verify

# Install
make install

