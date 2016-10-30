#!/bin/bash

[[ "$PREV_RELEASE" == "" ]] && echo "Missing env PREV_RELEASE" && exit 1
[[ "$NEXT_RELEASE" == "" ]] && echo "Missing env NEXT_RELEASE" && exit 1

function resetLastCommit() {
    _ID="$1"
    pushd ../bower-$_ID/ || (echo "Could not find $_ID" && exit 1)
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
