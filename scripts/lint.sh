#!/bin/bash

export HOME=/root
spec_dir=$HOME/rpmbuild/SPECS

rpmlint $spec_dir/parity.spec
