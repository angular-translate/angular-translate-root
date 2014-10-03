#!/bin/bash

PREV_RELEASE=2.4.0
NEXT_RELEASE=2.4.1

# Go into master project
cd ../angular-translate

# Ensure version in bower/package.json is now $NEXT_RELEASE

# Ensure master is merged
#git checkout master
#git merge canary

grunt prepare-release

grunt changelog:$PREV_RELEASE
git commit -m "Append changelog $NEXT_RELEASE" .
git tag $NEXT_RELEASE

# TODO
# npm publish

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
pushd ../bower-angular-translate/; git commit -m "Release $NEXT_RELEASE" *.js && git tag $NEXT_RELEASE; popd

# Prepare bower satellite repositories
copy_lib "angular-translate-handler-log"
copy_lib "angular-translate-interpolation-messageformat"
copy_lib "angular-translate-loader-partial"
copy_lib "angular-translate-loader-static-files"
copy_lib "angular-translate-loader-url"
copy_lib "angular-translate-storage-cookie"
copy_lib "angular-translate-storage-local"

./generate_site.sh
# TODO prepeare https://github.com/angular-translate/angular-translate/wiki/Making-a-release

pushd ../docs
rm -rf {css,docs,data,font,img,js,partials,plato,de,en,fr,ru,uk,zh-cn,zh-tw,index.html,favicon.ico}
mv ../angular-translate/site/* .
cp -prf docs/en/* .
cp -rf docs/{de,en,fr,ru,uk,zh-cn,zh-tw} .
git add -A
git commit -m "Release $NEXT_RELEASE" .
popd