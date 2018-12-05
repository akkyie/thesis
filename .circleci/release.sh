#!/usr/bin/env bash

set -eux

git config --global user.email "aky@keio.jp"
git config --global user.name "Akio Yasui (Circle CI)"

PDF_FILE="build/thesis.pdf"
REDPEN_FILES="build/redpen.*.xml"
DATE=$(date +'%Y/%m/%d %H:%M:%S')

if [ $CIRCLE_BRANCH = "master" ]; then
  TAG=$(date +'%Y.%m.%d-%H%M%S')
else
  TAG="$(date +'%Y.%m.%d')-$CIRCLE_BRANCH"
fi

git tag -f $TAG
git push -f --tags
echo "New tag: $TAG"

echo "Cleaning up under build/"
find build/* ! -name "*.pdf" ! -name "*.xml" | xargs rm -rf

echo "Uploading artifacts"
$GHR -n "$DATE" --prerelease --delete --replace "$TAG" build
