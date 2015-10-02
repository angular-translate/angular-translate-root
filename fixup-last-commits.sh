#!/bin/bash

NEXT_RELEASE=2.8.0

function fixupLastCommit() {
    _ID="$1"
    pushd ../bower-$_ID/
    git commit -q --amend --no-edit . && git tag -d -f $NEXT_RELEASE && git tag -a -m -f $NEXT_RELEASE
    popd
}

# Prepare bower satellite repositories
fixupLastCommit "angular-translate"
fixupLastCommit "angular-translate-handler-log"
fixupLastCommit "angular-translate-interpolation-messageformat"
fixupLastCommit "angular-translate-loader-partial"
fixupLastCommit "angular-translate-loader-static-files"
fixupLastCommit "angular-translate-loader-url"
fixupLastCommit "angular-translate-storage-cookie"
fixupLastCommit "angular-translate-storage-local"