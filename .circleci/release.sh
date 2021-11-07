#!/usr/bin/env bash

set -eux

PDF_FILE="build/thesis.pdf"
TAG=$(date +'%Y.%m.%d-%H.%M.%S')
DATE=$(date +'%Y/%m/%d %H:%M:%S')

if [ $CIRCLE_BRANCH = 'masatora' ]; then
  PRERELEASE=''
else
  PRERELEASE='--prerelease'
fi

git tag $TAG
git remote -v
git push --tags
echo "New tag: $TAG"

echo "Cleaning up under build/"
find build/* ! -name "*.pdf" ! -name "*.xml" | xargs rm -rf

echo "Uploading artifacts"
$GHR -t $GITHUB_TOKEN -n "$DATE" $PRERELEASE --delete --replace "$TAG" build
