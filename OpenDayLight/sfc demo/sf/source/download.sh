#!/bin/bash

# clone from github
git clone https://github.com/opendaylight/sfc sfc_git
cd sfc_git
git reset --hard cd12dda6
cd ..
# remove useless files
mv sfc_git/sfc-py/sfc/* ./
rm -rf sfc_git