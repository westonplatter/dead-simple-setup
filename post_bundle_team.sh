fancy_echo() {
  local fmt="$1"; shift
  # shellcheck disable=SC2059
  printf "\\n$fmt\\n" "$@"
}

# shellcheck disable=SC2154
trap 'ret=$?; test $ret -ne 0 && printf "failed\n\n" >&2; exit $ret' EXIT

set -e


#
# install expected python version
#

VERSION="3.6.8"

if [ -z "$(pyenv versions | grep $VERSION)" ]; then
  fancy_echo "Setup ... installing pyenv version $VERSION"
  eval "$(pyenv init -)"
  pyenv install $VERSION
fi
