#!/bin/bash

TOOLS_GO_PATH=$1

usage () {
  echo "usage:"
  echo "$0 [tools.go file path(relative to script execution directory)]"
}

if [ -z ${TOOLS_GO_PATH} ]; then
  usage
  exit 1
fi

if [ ! -e ${TOOLS_GO_PATH} ]; then
  echo "$TOOLS_GO_PATH is not exist"
  usage
  exit 1
fi

PATTERN="_ \"(.+)\""
while read line ; do
  if [[ $line =~ $PATTERN ]]; then
    PKG=${BASH_REMATCH[1]}
    echo "installing" $PKG
    go install $PKG
  fi
done < $TOOLS_GO_PATH