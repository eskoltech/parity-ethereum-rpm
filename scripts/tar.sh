#!/bin/bash

export HOME=/home/rpmuser
sources_dir=$HOME/rpmbuild/SOURCES

# Fix ownership of output files
finish() {
    # Fix ownership of output files
    user_id=$(stat -c '%u:%g' $sources_dir)
    chown -R ${user_id} $sources_dir
}
trap finish EXIT

rm -rf $sources_dir/*.tar.gz
tar czf $sources_dir/parity-$PARITY_VERSION.tar.gz -C $sources_dir parity-$PARITY_VERSION
ls -la $sources_dir
