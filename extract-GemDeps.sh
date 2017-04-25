#!/bin/sh

## extract Gem dependencies to their proper places
# platform: OSX (only!)
# requires: root-priviliges


error() {
    echo "$@" 1>&2
}

usage() {
    error "usage: $0 [ <depsdir>]"
    error "This script is intended to be included into  GemDeps release packages,"
    error " as distributed via https://github.com/umlaeute/Gem-dependencies/releases/"
    error "It can then be run to extract the contents of such a package"
    error " to the proper places..."
    error
    exit 1
}
checkpkg() {
if [  ! -e "${BASEDIR}/$1" ]; then
    error "ERROR: missing package '$1'"
    error
    usage
fi
}
BREW() {
  echo "BREW $@"
  brew "$@"
}

extract_brew() {
    checkpkg brew.tgz
    tar -xvf brew.tgz --directory /usr/local/Cellar
    tar -tf  brew.tgz | grep "/$" | grep -v "/.*/" | while read p; do
        pkg=${p%/}
        BREW unlink ${pkg}
        BREW link ${pkg}
    done                                                   
}
extract_deps() {
    checkpkg deps.tgz
    tar -xvf deps.tgz --strip-components --directory "${TARGETDIR}"
}


BASEDIR=${0%/*}
TARGETDIR=$1

checkpkg brew.tgz
checkpkg deps.tgz
if [ -z "${TARGETDIR}" ]; then
    TARGETDIR=$(pwd)
fi
mkdir -p "${TARGETDIR}"

extract_brew
extract_deps
