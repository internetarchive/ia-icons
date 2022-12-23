# IA Icons Monorepo

This monorepo builds JS source, tests, and test pages, from a subdirectory of svg files:

[svg/](svg/)

Each `.svg` source file can then be individually imported via JS/TS like:
```js
import twitter from 'https://esm.archive.org/@internetarchive/ia-icons/src/twitter.js'
```

Each `.js` file defines an `<ia-icon>` LitElement component.


## Updating

Please run:
```sh
./bin/build.sh
```
in a `git clone` of this repo to rebuild/update [src/](src/) and [test/](test/) files.

You can add a new `.svg` file to the [svg/](svg/) subdir,
and the [bin/build.sh](bin/build.sh) script
will automatically created the relevant JS and test files
