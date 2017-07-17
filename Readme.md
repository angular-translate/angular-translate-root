# angular-translate: org

This are _developer only_ utilities.

## Usage

Checkout this repository with

```sh
git clone git@github.com:angular-translate/org.git angular-translate
```

(alternatively use HTTP via https://github.com/angular-translate/org.git)

Jump into the repository and execute `npm run init` which will automatically checkout all required repositories:

```sh
cd angular-translate
npm run init
```

After this, you have the following project structure (let's say, you have a directory `git` on top)

```
/git
     /angular-translate (that's *this* repository)
        /repo
                /angular-translate
                /bower-angular-translate
                /bower-angular-translate-handler-log
                /bower-angular-translate-interpolation-messageformat
                /bower-angular-translate-loader-partial
                /bower-angular-translate-loader-static-files
                /bower-angular-translate-loader-url
                /bower-angular-translate-storage-cookie
                /bower-angular-translate-storage-local
                /docs
                /docs-canary
```

## Config

You can place a file named `git-config.json` at the root of this project.

```json
{
  "config": {
    "user.email": "knallisworld@googlemail.com",
    "user.name": "knalli"
  }
}
```

Each entry of `$.config` will be used as a custom Git local config entry. Maybe useful for dedicated user settings like name or gpg signing keys.

## Release making

Everything is automated, just follow `npm start`.