#!/usr/bin/env bash

set -o errexit
set -o nounset
#set -x

main() {
  [[ $1 == "total" ]] && echo "18446744073709551615" && exit
  (( $1 > 0 && $1 <= 64 )) && echo $(( 1 << $1-1 )) | tr -d '-' || { echo "Error: invalid input"; exit 1; }
}

main $@
