#!/usr/bin/env bash

STOW_APPS="$*"

DIR=$(echo $0 | rev | cut -d '/' -f2- | rev)
cd $DIR

OVERRIDE="bash"
TARGET=~/
for k in $OVERRIDE; do
for i in $(find ./.$k -type f | cut -d '/' -f3-) ; do
rm -f $TARGET$i
done
done

stow --target=$TARGET $STOW_APPS
