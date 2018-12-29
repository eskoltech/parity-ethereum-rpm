#!/bin/bash

export HOME=/root
sources_dir=$HOME/rpmbuild/SOURCES
spec_dir=$HOME/rpmbuild/SPECS

chown -R root:root $HOME/rpmbuild
rpmbuild -ba $spec_dir/parity.spec
rm -rf $sources_dir/*.tar.gz
