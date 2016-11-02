#!/bin/bash
set -e

if [[ "${FLAVOR}" = "newspeak"* ]]; then
  ./tests/newspeakBootstrap.sh
fi
