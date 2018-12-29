#!/bin/bash

export HOME=/home/rpmuser
sources_dir=$HOME/rpmbuild/SOURCES
spec_dir=$HOME/rpmbuild/SPECS

id

cat /etc/group

sudo chown -R $(id -u):$(id -g) $HOME/rpmbuild
rpmbuild -ba $spec_dir/parity.spec
rm -rf $sources_dir/*.tar.gz
