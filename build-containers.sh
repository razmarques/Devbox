#!/bin/bash

CONTAINERDIR=$HOME/container-files

usage () {
    echo "Usage: $(basename $0) [-h]"
    exit 1
}

build () {
    echo "Building devbox"
    distrobox assemble create --file $CONTAINERDIR/recipes/main.ini
}

while getopts ':lnhr' OPTION; do
  case "$OPTION" in
    b) build ;;
    h) usage ;;
    ?) usage ;;
  esac
done
