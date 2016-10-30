#!/bin/bash

# go one up
cd ..

function checkout_unless_exist() {
    REPO="$1"
    if [ -e "$REPO" ]; then
        echo "Skipping $REPO (exists already)"
    else
        echo "Cloning $REPO..."
        git clone git@github.com:angular-translate/$REPO.git
        if [ $? != 0 ]; then
            echo "Cloning of $REPO failed."
            exit 1
        fi
    fi
}

checkout_unless_exist 'angular-translate'
checkout_unless_exist 'bower-angular-translate'
checkout_unless_exist 'bower-angular-translate-handler-log'
checkout_unless_exist 'bower-angular-translate-interpolation-messageformat'
checkout_unless_exist 'bower-angular-translate-loader-partial'
checkout_unless_exist 'bower-angular-translate-loader-static-files'
checkout_unless_exist 'bower-angular-translate-loader-url'
checkout_unless_exist 'bower-angular-translate-storage-cookie'
checkout_unless_exist 'bower-angular-translate-storage-local'
checkout_unless_exist 'docs'

echo
echo "Happy coding!"
echo
exit 0