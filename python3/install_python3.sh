#!/usr/bin/env sh

# Globals
PREFIX="${HOME}"/local
VERSION=3.3


# Auxiliary function
build_docs () {
    cd "$PREFIX"/src/cpython/Doc \
        && make html
}

build_program () {
cd  "$PREFIX"/src/cpython \
        && CFLAGS="-Wno-unused-value -Wno-empty-body" ./configure --prefix="$PREFIX" \
        && make -s -j2 \
        && make test \
        && make install
}

install_distribute_and_pip () {
cd  "$PREFIX"/src/ \
    && [ -d distribute-py ] || mkdir distribute-py \
    && cd "$PREFIX"/src/distribute-py \
    && curl -O http://python-distribute.org/distribute_setup.py \
    && "$PREFIX"/bin/python"$VERSION" distribute_setup.py \
    && easy_install-"$VERSION" pip
}


# Main
if [ cd "$PREFIX"/src/cpython && hg update "$VERSION" ]
then
    build_docs
    build_program
else
    cd "$PREFIX"/src
    hg clone http://hg.python.org/cpython && cd cpython && hg update "$VERSION"
    build_docs
    build_program
fi

install_distribute_and_pip


