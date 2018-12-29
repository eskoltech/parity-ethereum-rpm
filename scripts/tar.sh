#!/bin/bash

sources_dir=/home/rpmuser/rpmbuild/SOURCES

rm -rf $sources_dir/*.tar.gz
tar czf $sources_dir/parity-$PARITY_VERSION.tar.gz -C $sources_dir parity-$PARITY_VERSION
ls -la $sources_dir
