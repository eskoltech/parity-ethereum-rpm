#!/bin/bash

export HOME=/root
sources_dir=$HOME/rpmbuild/SOURCES

rm -rf $sources_dir/*.tar.gz
tar czf $sources_dir/parity-$PARITY_VERSION.tar.gz -C $sources_dir parity-$PARITY_VERSION
