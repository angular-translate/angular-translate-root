#!/bin/bash

[[ "$PREV_RELEASE" == "" ]] && echo "Missing env PREV_RELEASE" && exit 1
[[ "$NEXT_RELEASE" == "" ]] && echo "Missing env NEXT_RELEASE" && exit 1

echo
echo
echo "angular-translate release process"
echo "================================="
echo
echo " - Ensure canary is merged into master (git merge canary)."
echo " - Ensure active branch is master (git checkout master)."
echo " - Ensure bower.json & package.json in master already updated to '$NEXT_RELEASE'."
echo
read

# Go into master project
cd ../angular-translate

echo "Using NodeJS `node -v`"
export PATH=node_modules/.bin:$PATH

grunt prepare-release

grunt changelog:$PREV_RELEASE
git commit -m "Append changelog $NEXT_RELEASE" .
git tag $NEXT_RELEASE

#npm publish

function copy_lib() {
  _ID="$1"
  cp -rf dist/$_ID/$_ID.js ../bower-$_ID/
  cp -rf dist/$_ID/$_ID.min.js ../bower-$_ID/
  pushd ../bower-$_ID/
  #https://github.com/KidkArolis/kn-release/blob/master/bin/release
  git commit -m "Release $NEXT_RELEASE" . && git tag $NEXT_RELEASE
  popd
}

# Main Lib
cp -rf dist/angular-translate.js ../bower-angular-translate/
cp -rf dist/angular-translate.min.js ../bower-angular-translate/
pushd ../bower-angular-translate/; git commit -m "Release $NEXT_RELEASE" . && git tag $NEXT_RELEASE; popd

# Prepare bower satellite repositories
copy_lib "angular-translate-handler-log"
copy_lib "angular-translate-interpolation-messageformat"
copy_lib "angular-translate-loader-partial"
copy_lib "angular-translate-loader-static-files"
copy_lib "angular-translate-loader-url"
copy_lib "angular-translate-storage-cookie"
copy_lib "angular-translate-storage-local"

npm run build-site

pushd ../docs
rm -rf {css,docs,data,font,img,js,partials,plato,de,en,fr,ru,uk,zh-cn,zh-tw,index.html,favicon.ico}
mv ../angular-translate/site/* .
cp -prf docs/en/* .
cp -rf docs/{de,en,es,fr,ru,uk,zh-cn,zh-tw} .
git add -A
git commit -m "Release $NEXT_RELEASE" .
popd
