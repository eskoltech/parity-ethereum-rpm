#!/bin/bash

sources_dir=/home/rpmuser/rpmbuild/SOURCES
spec_dir=/home/rpmuser/rpmbuild/SPECS

rpmbuild -ba $spec_dir/parity.spec
rm -rf $sources_dir/*.tar.gz
