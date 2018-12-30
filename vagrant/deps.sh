#!/bin/bash

# Install rust compiler
curl https://sh.rustup.rs -sSf | sh
source $HOME/.cargo/env

# Install dependencies
sudo yum install -y gcc gcc-c++ file make perl git wget systemd-devel

# Clone Parity Ethereum repository
cd /tmp && git clone https://github.com/paritytech/parity-ethereum
cd parity-ethereum
git checkout stable

# Install cmake version 3.6
cd /tmp && wget https://cmake.org/files/v3.6/cmake-3.6.2.tar.gz
tar -zxvf cmake-3.6.2.tar.gz
rm -rf cmake-3.6.2.tar.gz
cd cmake-3.6.2
sudo ./bootstrap --prefix=/usr/local
sudo make
sudo make install

# Build Parity Ethereum binary
cd /tmp/parity-ethereum && cargo build --release --features final
echo "[+] Finished! Result binary is inside target/release folder"
