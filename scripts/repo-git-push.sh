#!/bin/bash

function pushShadowRepo() {
    _ID="$1"
    pushd repo/bower-$_ID/ >> /dev/null
    git push origin
    git push --tags origin
    popd >> /dev/null
}

function pushRepo() {
    _ID="$1"
    pushd repo/$_ID/ >> /dev/null
    git push origin
    git push --tags origin
    popd >> /dev/null
}

pushShadowRepo "angular-translate"
pushShadowRepo "angular-translate-handler-log"
pushShadowRepo "angular-translate-interpolation-messageformat"
pushShadowRepo "angular-translate-loader-partial"
pushShadowRepo "angular-translate-loader-static-files"
pushShadowRepo "angular-translate-loader-url"
pushShadowRepo "angular-translate-storage-cookie"
pushShadowRepo "angular-translate-storage-local"

pushRepo "angular-translate"
pushRepo "docs"
pushRepo "docs-canary"
