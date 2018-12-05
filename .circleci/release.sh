#!/usr/bin/env bash

set -eux

PDF_FILE="build/thesis.pdf"
HASH=($(md5sum $PDF_FILE))
TAG=$(date +'%Y%m%d')-$HASH
DATE=$(date +'%Y/%m/%d')

git tag $TAG
git push --tags
echo "New tag: $TAG"

echo "Installing ghr"
curl -Lo - 'https://github.com/tcnksm/ghr/releases/download/v0.12.0/ghr_v0.12.0_linux_amd64.tar.gz' | \
  tar zxvf - -C ghr --strip-components 1

./ghr/ghr -n $DATE --prerelease --delete --replace $TAG $PDF_FILE
