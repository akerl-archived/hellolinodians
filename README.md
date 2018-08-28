hellolinodians
=========

[![Build Status](https://img.shields.io/travis/com/akerl/hellolinodians.svg)](https://travis-ci.com/akerl/hellolinodians)
[![Code Quality](https://img.shields.io/codacy/089fd438148c4972a4531ca6f0824bae.svg)](https://www.codacy.com/app/akerl/hellolinodians)
[![MIT Licensed](https://img.shields.io/badge/license-MIT-green.svg)](https://tldrlegal.com/license/mit-license)

Twitter bot for announcing new Linodians (https://twitter.com/hello\_linodians)

## Usage

I deploy this using [dock0/hellolinodians](https://github.com/dock0/hellolinodians). You essentially feed it twitter params via environment vars as well as optionally a URL for checking in to [Dead Man's Snitch](https://deadmanssnitch.com/).

It supports a handful of flags to tell it what to do:

```
# ./bin/check -h
Usage: ./bin/check [opts]
    -u, --update                     Update the DB with new data
    -d, --diff                       Compare against last data
    -a, --alert                      Alert on changes
    -c, --checkin                    Check in with DeadManSnitch
    -p, --prod                       Enable all production settings
```

## License

hellolinodians is released under the MIT License. See the bundled LICENSE file for details.

