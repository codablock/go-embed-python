#!/bin/sh

set -e

DIR=$(cd $(dirname $0) && pwd)
cd $DIR/..

PYTHON_STANDALONE_VERSION=$1
PYTHON_VERSION=$2

if [ "$PYTHON_STANDALONE_VERSION" = "" ]; then
  echo "missing python-standalone version"
  exit 1
fi

if [ "$PYTHON_VERSION" = "" ]; then
  echo "missing python version"
  exit 1
fi

if [ ! -z "$(git status --porcelain)" ]; then
  echo "working directory is dirty!"
  #exit 1
fi

go run ./python/generate --python-standalone-version=$PYTHON_STANDALONE_VERSION --python-version $PYTHON_VERSION
go run ./pip/generate
