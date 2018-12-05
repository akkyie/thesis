#!/usr/bin/env bash

set -eux

PDF_FILE="build/thesis.pdf"
HASH=($(md5sum $PDF_FILE))
TAG=$(date +'%Y%m%d')-$HASH
DATE=$(date +'%Y/%m/%d')

git tag $TAG
git push --tags
echo "New tag: $TAG"

$GHR -n $DATE --prerelease --delete --replace $TAG $PDF_FILE
