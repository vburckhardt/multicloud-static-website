#! /bin/bash

set -euo pipefail

PRG=$(basename -- "${0}")

USAGE="
usage:	${PRG}
        [--help]

        Required arguments:
        --catalogName=<catalog name>
        --github_tgz_url=<github url tar gz>
        --version=<version>
"

OFFERING_NAME="Multi Cloud Demo"

CATALOG_NAME=
GITHUB_TAR_URL=
VERSION=

# Loop through all args
for arg in "$@"; do
    found_match=false
    if echo "${arg}" | grep -q -e --catalogName=; then
      CATALOG_NAME=$(echo "${arg}" | awk -F= '{ print $2 }')
      export CATALOG_NAME
      echo "CATALOG_NAME: ${CATALOG_NAME}"
      found_match=true
    fi

    if echo "${arg}" | grep -q -e --github_tgz_url=; then
      GITHUB_TAR_URL=$(echo "${arg}" | awk -F= '{ print $2 }')
      export GITHUB_TAR_URL
      echo "GITHUB_TAR_URL: ${GITHUB_TAR_URL}"
      found_match=true
    fi

    if echo "${arg}" | grep -q -e --version=; then
      VERSION=$(echo "${arg}" | awk -F= '{ print $2 }')
      export VERSION
      echo "VERSION: ${VERSION}"
      found_match=true
    fi

    if [ ${found_match} = false ]; then
      if [ "${arg}" != --help ]; then
        echo "Unknown command line argument:  ${arg}"
      fi
      echo "${USAGE}"
      exit 1
    fi
done

echo

# Verify values have been passed for required args
all_args_exist=true
var_array=( CATALOG_NAME GITHUB_TAR_URL VERSION )
set +u
for var in "${var_array[@]}"; do
  [ -z "${!var}" ] && echo "$var not defined." && all_args_exist=false
done
set -u

if [ ${all_args_exist} == false ]; then
  echo "Missing one ore more required arguments. See usage below:"
  echo "${USAGE}"
  exit 1
fi

# ---------------------------
# steps
# ---------------------------
for VARIATION in "IBM CLoud" "Azure"
do

    echo "importing variation $VARIATION"

    # import version to catalog one variation at a time
    importVersionToCatalog "$CATALOG_NAME" "$OFFERING_NAME" "$VERSION" "${VARIATION}" "terraform" "fullstack"

    # validate

    # mark as ready

    # clean up deployed resources

    echo
done
