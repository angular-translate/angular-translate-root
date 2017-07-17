#!/bin/bash

# Go into master project
pushd repo/angular-translate
npm run -s upload-github-release
popd
