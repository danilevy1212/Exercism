#!/usr/bin/env bash

set -eou pipefail

main(){
    local plain="$1"
    local -i rot="$2"%26
    local lowCase="abcdefghijklmnopqrstuvwxyz"
    local upperCase="${lowCase^^}"
    local key="${lowCase:$rot:${#lowCase}-$rot}${lowCase:0:$rot}${upperCase:$rot:${#upperCase}-$rot}${upperCase:0:$rot}"

    echo "$(tr "$lowCase$upperCase" "$key" <<< "$plain")"
}

main "$@"
