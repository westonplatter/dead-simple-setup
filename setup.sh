#!/bin/sh

# Welcome to the thoughtbot laptop script!
# Be prepared to turn your laptop (or desktop, no haters here)
# into an awesome development machine.

fancy_echo() {
  local fmt="$1"; shift
  # shellcheck disable=SC2059
  printf "\\n$fmt\\n" "$@"
}

# shellcheck disable=SC2154
trap 'ret=$?; test $ret -ne 0 && printf "failed\n\n" >&2; exit $ret' EXIT

set -e

if [ ! -d "$HOME/.bin/" ]; then
  mkdir "$HOME/.bin"
fi

HOMEBREW_PREFIX="/usr/local"

if [ -d "$HOMEBREW_PREFIX" ]; then
  if ! [ -r "$HOMEBREW_PREFIX" ]; then
    sudo chown -R "$LOGNAME:admin" /usr/local
  fi
else
  sudo mkdir "$HOMEBREW_PREFIX"
  sudo chflags norestricted "$HOMEBREW_PREFIX"
  sudo chown -R "$LOGNAME:admin" "$HOMEBREW_PREFIX"
fi

fancy_echo "Setup ... executing agaist bundle_$1"

if ! command -v brew >/dev/null; then
  fancy_echo "Installing Homebrew ..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if brew list | grep -Fq brew-cask; then
  fancy_echo "Uninstalling old Homebrew-Cask ..."
  brew uninstall --force brew-cask
fi

fancy_echo "Setup ... updating Homebrew formulae"

brew update --force # https://github.com/Homebrew/brew/issues/1151
brew bundle --file=$1

if [ -f "./post_bundle_$1.sh" ]; then
  fancy_echo "Setup ... running post bundle shell file"
  # shellcheck disable=SC1090
  . "./post_bundle_$1.sh"
fi

if [ -f "$HOME/.laptop.local" ]; then
  fancy_echo "Setup ... Rrnning your customizations from ~/.laptop.local"
  # shellcheck disable=SC1090
  . "$HOME/.laptop.local"
fi

fancy_echo "Setup ... done :)"
