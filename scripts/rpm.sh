#!/bin/bash

export HOME=/home/rpmuser
sources_dir=$HOME/rpmbuild/SOURCES
spec_dir=$HOME/rpmbuild/SPECS

rpmbuild -ba $spec_dir/parity.spec
rm -rf $sources_dir/*.tar.gz
