#!/usr/bin/env bash
set -e

STOW_APPS="$*"

DIR=$(echo $0 | rev | cut -d '/' -f2- | rev)
mv $DIR ~/.dot-files
cd ~/.dot-files
stow $STOW_APPS
