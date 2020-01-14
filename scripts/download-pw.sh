#!/usr/bin/env sh
echo "Downloading Processwire to pw directory"
git clone git://github.com/processwire/processwire.git -b dev ./pw
rm -rf ./pw/.git
rm ./pw/.gitkeep
rm ./pw/.DS_Store
rm ./pw/.gitattributes
