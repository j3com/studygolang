#!/usr/bin/env bash

set -e

if [ ! -f install.sh ]; then
	echo 'install must be run within its container folder' 1>&2
	exit 1
fi

CURDIR=`pwd`
OLDGOPATH="$GOPATH"
export GOPATH="$CURDIR"

if [ ! -d log ]; then
	mkdir log
fi

go install server/...

export GOPATH="$OLDGOPATH"
export PATH="$OLDPATH"

echo 'finished'

