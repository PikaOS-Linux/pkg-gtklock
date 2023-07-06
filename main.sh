#! /bin/bash

DEBIAN_FRONTEND=noninteractive

# Clone Upstream
git clone https://github.com/jovanlanik/gtklock.git --recurse-submodules
cd gtklock
git checkout v2.1.0
cp -rvf ../debian ./

sed -e 's /usr/local /usr g' -i makefile

# Get build deps
apt-get build-dep ./ -y

# Build package
dpkg-buildpackage --no-sign

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/
