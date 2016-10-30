const fs = require('fs');
const path = require('path');

const currentVersion = process.env.PREV_RELEASE;
const nextVersion = process.env.NEXT_RELEASE;

const bumpPackageVersion = (package, filepath, currentVersion, nextVersion) => {
  fs.readFile(filepath, 'utf8', (err, data) => {
    if (err) {
      return;
      // return console.log(err);
      // file does not exist
    }
    const result = data.replace(new RegExp(currentVersion, 'g'), nextVersion);

    fs.writeFile(filepath, result, 'utf8', (err) => {
      if (err) {
        return console.log(err);
      } else {
        console.log(`Succefully replaced file '${filepath}': ${currentVersion} => ${nextVersion}`);
      }
    });
  });
  console.log(package, filepath, currentVersion, nextVersion);
};

[
  "angular-translate",
  "angular-translate-handler-log",
  "angular-translate-interpolation-messageformat",
  "angular-translate-loader-partial",
  "angular-translate-loader-static-files",
  "angular-translate-loader-url",
  "angular-translate-storage-cookie", 
  "angular-translate-storage-local"
].forEach((moduleId) => {
  const bowerFilepath = path.join(path.parse(__dirname).dir, '..', `bower-${moduleId}`, 'bower.json');
  const npmFilepath = path.join(path.parse(__dirname).dir, '..', `bower-${moduleId}`, 'package.json');
  bumpPackageVersion(moduleId, bowerFilepath, currentVersion, nextVersion);
  bumpPackageVersion(moduleId, npmFilepath, currentVersion, nextVersion);
});