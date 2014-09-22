#!/bin/bash

PREV_RELEASE=2.3.0
NEXT_RELEASE=2.4.0

# Go into master project
cd ../angular-translate

# Ensure master is merged
#git checkout master
#git merge canary

grunt changelog:$PREV_RELEASE
git commit -m "Append changelog $NEXT_RELEASE"
git tag $NEXT_RELEASE

function copy_lib() {
    _ID="$1"
    cp -rf dist/$_ID/$_ID.js ../bower-$_ID/
    cp -rf dist/$_ID/$_ID.min.js ../bower-$_ID/
    pushd ../bower-$_ID/
    git commit -m "Release $NEXT_RELEASE" . && git tag $NEXT_RELEASE
    popd
}

# Main Lib
cp -rf dist/angular-translate.js ../bower-angular-translate/
cp -rf dist/angular-translate.min.js ../bower-angular-translate/
pushd ../bower-angular-translate/
git commit -m "Release 2.4.0" *.js && git tag $NEXT_RELEASE
popd

# Prepare bower satellite repositories
copy_lib "angular-translate-handler-log"
copy_lib "angular-translate-interpolation-messageformat"
copy_lib "angular-translate-loader-partial"
copy_lib "angular-translate-loader-static-files"
copy_lib "angular-translate-loader-url"
copy_lib "angular-translate-storage-cookie"
copy_lib "angular-translate-storage-local"

./generate-site.sh
# TODO prepeare https://github.com/angular-translate/angular-translate/wiki/Making-a-release