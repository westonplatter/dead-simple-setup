# Dead Simple Setup
The "dead simple" OSX package install script.

## Why does this repo exist?
I got tired of doing one off brew installs for java, ruby, python, npm, etc. I
love the technical thoroughness of [thoughtbot's laptop](https://github.com/thoughtbot/laptop)
system, and wanted a less robust / simplified version. At the core, I wanted
a way to define collections of packages to install quickly as I worked 
across multiple Mac machines.

## Install

Install [homebrew](https://brew.sh/) and git (after installing homebrew, `brew install git`).

```bash
git clone git@github.com:westonplatter/dead-simple-setup.git
cd dead-simple-setup
chmod +x ./setup.sh

#
# live examples in use
#
./setup.sh personal_apps
./setup.sh personal_data
./setup.sh personal_code
```

## Credits
This [simple github gist](https://gist.github.com/codeinthehole/26b37efa67041e1307db) by David Winterbottom

Justin Johnson's [feedback](https://twitter.com/balduncle/status/874583640285556736)

thoughtbot's [laptop repo](https://github.com/thoughtbot/laptop)

## License
MIT. See LICENSE file.
