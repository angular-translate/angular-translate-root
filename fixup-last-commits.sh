#!/bin/bash

PREV_RELEASE=2.12.0
NEXT_RELEASE=2.12.1

function fixupLastCommit() {
    _ID="$1"
    pushd ../bower-$_ID/
    git commit -q --amend --no-edit . && git tag -d $NEXT_RELEASE && git tag -a -m -f $NEXT_RELEASE
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
