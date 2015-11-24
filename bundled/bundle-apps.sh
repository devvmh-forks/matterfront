#!/bin/bash
#works on osx, no promises if building on linux

#set up root dir
cd $(dirname "$0")
cd $(dirname "$(pwd)")
ROOT_DIR="$(pwd)"

set -e

#dependencies
#npm install -g appdmg

#cd $ROOT_DIR
#npm install
#npm run build

cd $ROOT_DIR/bundled
rm -f matterfront-osx.dmg matterfront-linux.tar.bz2 matterfront-windows.zip

#OSX
cd $ROOT_DIR/dist/Matterfront-darwin-x64
cp $ROOT_DIR/bundled/{spec-matterfront.json,white600x600.png} .
appdmg spec-matterfront.json matterfront-osx.dmg
mv matterfront-osx.dmg spec-matterfront.json white600x600.png $ROOT_DIR/bundled

#Linux
cd $ROOT_DIR/dist
tar cvjf matterfront-linux.tar.bz2 Matterfront-linux-x64/
mv matterfront-linux.tar.bz2 $ROOT_DIR/bundled

#Windows
cd $ROOT_DIR/dist
zip -rv matterfront-windows.zip Matterfront-win32-x64/
mv matterfront-windows.zip $ROOT_DIR/bundled

cd $ROOT_DIR/bundled

echo 'Done. Check the "bundled" directory for your three bundled apps.'
