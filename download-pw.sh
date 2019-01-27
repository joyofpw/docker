#!/usr/bin/env sh
# Download Processwire to pw directory
rm ./pw/.gitkeep
rm ./pw/.DS_Store
git clone git://github.com/processwire/processwire.git -b dev ./pw
rm -rf ./pw/.git
