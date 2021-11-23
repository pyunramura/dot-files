#!/usr/bin/env bash

STOW_APPS="$*"
TARGET=~/

DIR=$(echo $0 | rev | cut -d '/' -f2- | rev)
cd $DIR

for k in $STOW_APPS; do
for i in $(find ./$k -type f | cut -d '/' -f3-) ; do
rm -f $TARGET$i
done
done

stow --target=$TARGET $STOW_APPS
