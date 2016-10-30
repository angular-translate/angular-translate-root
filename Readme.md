# angular-translate-root

This are _developer only_ utilities.

## Usage

Using a terminal, go to the designated place for your _translate_ repository. Create an umbrella directory and switch into it.

```sh
mkdir translate
cd translate
```

Checkout this repository with

```sh
git clone git@github.com:angular-translate/angular-translate-root.git
```

(alternatively use HTTP via https://github.com/angular-translate/angular-translate-root.git)

Jump into the repository and execute `shadowrepo-git-checkoutall` which will automatically checkout all repositories:

```sh
cd angular-translate-root
npm run shadowrepo-git-checkoutall
```

After this, you have the following project structure (let's say, you have a directory `git` on top)

```
/git
     /translate
                /angular-translate
                /angular-translate-root
                /bower-angular-translate
                /bower-angular-translate-handler-log
                /bower-angular-translate-interpolation-messageformat
                /bower-angular-translate-loader-partial
                /bower-angular-translate-loader-static-files
                /bower-angular-translate-loader-url
                /bower-angular-translate-storage-cookie
                /bower-angular-translate-storage-local
                /docs
```

## Release making

Everything is automated, just follow `npm start`.