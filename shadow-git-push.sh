#!/bin/bash

function resetLastCommit() {
    _ID="$1"
    pushd ../bower-$_ID/ >> /dev/null
    git push origin
    git push --tags origin
    popd >> /dev/null
}

# Prepare bower satellite repositories
resetLastCommit "angular-translate"
resetLastCommit "angular-translate-handler-log"
resetLastCommit "angular-translate-interpolation-messageformat"
resetLastCommit "angular-translate-loader-partial"
resetLastCommit "angular-translate-loader-static-files"
resetLastCommit "angular-translate-loader-url"
resetLastCommit "angular-translate-storage-cookie"
resetLastCommit "angular-translate-storage-local"
