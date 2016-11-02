#!/bin/bash
set -e

if [[ "${FLAVOR}" = "newspeak"* ]]; then
  case "$(uname -s)" in
    "Linux")
      sudo bash -c "ulimit -r 2 && exec setuidgid ${USER} ./tests/newspeakBootstrap.sh"
      ;;
    "Darwin")
      ./tests/newspeakBootstrap.sh
      ;;
  esac
fi
