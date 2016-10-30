#!/bin/bash

function publishShadowRepo() {
    _ID="$1"
    pushd ../bower-$_ID/ >> /dev/null
    npm publish
    popd >> /dev/null
}

function publishRepo() {
    _ID="$1"
    pushd ../$_ID/ >> /dev/null
    npm publish
    popd >> /dev/null
}

publishRepo "angular-translate"

publishShadowRepo "angular-translate-handler-log"
publishShadowRepo "angular-translate-interpolation-messageformat"
publishShadowRepo "angular-translate-loader-partial"
publishShadowRepo "angular-translate-loader-static-files"
publishShadowRepo "angular-translate-loader-url"
publishShadowRepo "angular-translate-storage-cookie"
publishShadowRepo "angular-translate-storage-local"
