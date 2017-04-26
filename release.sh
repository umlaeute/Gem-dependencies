#!/bin/sh

VERSION="v0.0.$(date +%Y%m%d.%H%M%S)"

git tag -m "released ${VERSION}" "$@" "${VERSION}"
