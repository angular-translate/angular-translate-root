#!/bin/bash

# Go into master project
pushd ../angular-translate
npm run -s upload-github-release
popd
