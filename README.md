# Dead Simple Setup
The "dead simple" OSX package install script.

## Why?
I got tired of doing one off brew installs for java, ruby, python, npm, etc. I
like [thoughtbot's laptop](https://github.com/thoughtbot/laptop) but I think
it's too opinionated.

## Install

Install [homebrew](https://brew.sh/) and git (after installing homebrew, `brew install git`).

```bash
git clone git@github.com:westonplatter/dead-simple-setup.git
cd dead-simple-setup
chmod +x ./osx_bootstrap.sh
sh ./osx_bootstrap.sh
```

## Credits
This [simple github gist](https://gist.github.com/codeinthehole/26b37efa67041e1307db) by David Winterbottom

Justin Johnson's [feedback](https://twitter.com/balduncle/status/874583640285556736)

thoughtbot's [laptop repo](https://github.com/thoughtbot/laptop)

## License
MIT
