#!/bin/bash

#packages for fuzzing
apt update
apt install -y git libevent-dev libboost-system-dev libboost-filesystem-dev libboost-test-dev libboost-thread-dev build-essential libtool autotools-dev automake pkg-config bsdmainutils curl ca-certificates ccache python3 rsync git procps clang llvm

# fuzzing blobs
git clone https://github.com/bitcoin-core/qa-assets
git clone https://github.com/bitcoin/bitcoin

# depends, ccache?

which clang

cd bitcoin
./autogen.sh
./configure --enable-fuzz --with-sanitizers=fuzzer,address,undefined,integer CC=clang CXX=clang++ --with-boost-process
make
echo "done"