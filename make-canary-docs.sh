#!/bin/bash

# Go into master project
cd ../angular-translate

./generate_site.sh

pushd ../docs-canary
rm -rf {css,docs,data,font,img,js,partials,plato,de,en,fr,ru,uk,zh-cn,zh-tw,index.html,favicon.ico}
mv ../angular-translate/site/* .
cp -prf docs/en/* .
cp -rf docs/{de,en,fr,ru,uk,zh-cn,zh-tw} .
git add -A
git commit -m "Snapshot `date`" .
popd