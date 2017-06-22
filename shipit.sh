#!/bin/bash

[[ "$PREV_RELEASE" == "" ]] && echo "Missing env PREV_RELEASE" && exit 1
[[ "$NEXT_RELEASE" == "" ]] && echo "Missing env NEXT_RELEASE" && exit 1

nvm use
GITHUB_ACCESS_TOKEN=$(cat github-access.json | jq -r '.secretToken')

echo "Confirm shadow repositories will be resetted HARD" && read
npm run -s shadowrepo-git-reset
echo

echo "Confirm shadow repositories will be bumped" && read
npm run -s shadowrepo-package-bumpversion
echo

echo "Confirm making release" && read
npm run -s make-release
echo

echo "Confirm docs & shadow repositories should be published via GIT" && read
npm run -s repo-git-push
echo

echo "Confirm shadow repositories should be published via NPM" && read
npm run -s repo-npm-publish
echo

echo "Confirm upload release to GitHub" && read
GH_TOKEN=$GITHUB_ACCESS_TOKEN npm run -s upload-github-release
echo 
