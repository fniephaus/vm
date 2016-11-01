#!/bin/bash
set -e

readonly REV_NEWSPEAK="7fed4bc928ac3fa85fa28493ca1e26c359f875ac"
readonly REV_NSBOOT="abb722e474e2126203f05245e9da45c065efe991"
readonly GH_BASE="https://github.com/newspeaklanguage"
readonly TMP_DIR=$(mktemp -d 2>/dev/null || mktemp -d -t 'newspeak')

echo "Starting Newspeak bootstrapping process..."

pushd "${TMP_DIR}" > /dev/null

curl -f -s -L --retry 3 -o "newspeak.zip" "${GH_BASE}/newspeak/archive/${REV_NEWSPEAK}.zip"
curl -f -s -L --retry 3 -o "nsboot.zip" "${GH_BASE}/nsboot/archive/${REV_NSBOOT}.zip"

unzip -q "newspeak.zip"
unzip -q "nsboot.zip"

cd "nsboot"*

if [[ "${ARCH}" = *"64x64" ]]; then
  BUILD_SCRIPT="build64.sh"
else
  BUILD_SCRIPT="build32.sh"
fi

case "$(uname -s)" in
  "Linux")
    NSVM="${TRAVIS_BUILD_DIR}/products/"*/nsvm
    sudo cat >"/etc/security/limits.d/nsvm.conf" <<END
*       hard    rtprio  2
*       soft    rtprio  2
END
    ;;
  "Darwin")
    VM_BUILD_DIR="${TRAVIS_BUILD_DIR}/build.${ARCH}/${FLAVOR}"
    NSVM="${VM_BUILD_DIR}/CocoaFast.app/Contents/MacOS/Newspeak Virtual Machine"
    ;;
esac

exec setuidgid "${USER}" "./{$BUILD_SCRIPT}" -t -u -v "${NSVM}"

popd > /dev/null
