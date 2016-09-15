#!/bin/bash

PREV_RELEASE=2.12.0
NEXT_RELEASE=2.12.1

function resetLastCommit() {
    _ID="$1"
    pushd ../bower-$_ID/
    git tag -d $NEXT_RELEASE
    git reset --hard $PREV_RELEASE
    popd
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
