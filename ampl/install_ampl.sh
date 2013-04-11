#!/usr/bin/env sh

INSTALL_DIR=$HOME

# 1. Download  everything
# =======================

hostname='ftp://netlib2.cs.utk.edu'
solvers_dir='ampl/solvers'
student_dir='ampl/student/macosx/x86_32'

for d in "$solvers_dir" "$student_dir";
do
    localpath="$INSTALL_DIR/src/$d"
    remotepath="$hostname/$d/"
    mkdir -p $localpath
    cd $localpath
    ftp $remotepath <<EOF
    binary
    prompt off
    mget *
    quit
EOF
done

# 2. Compile and install the AMPL Solver Library (ASL)
# ====================================================

cd "$INSTALL_DIR"/src/"$solvers_dir"
chmod +x configurehere
./configurehere
make

ln -s amplsolver.a $INSTALL_DIR/lib # Install library

for header in *.h;
do
    ln -s $header $INSTALL_DIR/include  # Install header files
done

# 3. Install the AMPL and Solver Binaries
# =======================================

cd "$INSTALL_DIR"/src/"$student_dir"
gunzip *gz

for pkg in *.tar
do
    tar xf $pkg
done

for solver in "ampl gurobix cplex snopt gjh minos"
do
    chmod +x $solver
    cp $solver $INSTALL_DIR/bin
done

cp libgurobi*.so $INSTALL_DIR/lib

