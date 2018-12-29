#!/bin/bash

sources_dir=/root/rpmbuild/SOURCES
spec_dir=/root/rpmbuild/SPEC

rpmbuild -ba $spec_dir/parity.spec
rm -rf $sources_dir/*.tar.gz
