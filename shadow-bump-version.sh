#!/bin/bash

PREV_RELEASE=2.12.0
NEXT_RELEASE=2.12.1

function updateMeta() {
    _ID="$1"
    pushd ../bower-$_ID/ >> /dev/null
    [[ -e bower.json ]] && perl -p -i -e 's/2.12.0/2.12.1/g' bower.json
    [[ -e package.json ]] && perl -p -i -e 's/2.12.0/2.12.1/g' package.json
    popd >> /dev/null
}

# Prepare bower satellite repositories
updateMeta "angular-translate"
updateMeta "angular-translate-handler-log"
updateMeta "angular-translate-interpolation-messageformat"
updateMeta "angular-translate-loader-partial"
updateMeta "angular-translate-loader-static-files"
updateMeta "angular-translate-loader-url"
updateMeta "angular-translate-storage-cookie"
updateMeta "angular-translate-storage-local"
