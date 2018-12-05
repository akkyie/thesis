#!/usr/bin/env bash

set -eux

git config --global user.email "aky@keio.jp"
git config --global user.name "Akio Yasui (Circle CI)"

PDF_FILE="build/thesis.pdf"
DATE=$(date +'%Y/%m/%d %H:%M:%S')

if [ $CIRCLE_BRANCH = "master" ]; then
  TAG=$(date +'%Y.%m.%d-%H%M%S')
else
  TAG="$(date +'%Y.%m.%d')-$CIRCLE_BRANCH"
fi

git tag -f $TAG
git push -f --tags
echo "New tag: $TAG"

$GHR -n "$DATE" --prerelease --delete --replace "$TAG" "$PDF_FILE"
