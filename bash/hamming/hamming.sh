#!/bin/env bash

set -o errexit #Exit if there is an error
set -o nounset #Exit if unset variables
#set -x #Useful for debugging

main() {

    [[ $# != 2 ]] && echo 'Usage: hamming.sh <string1> <string2>' &&  exit 1

    [[ ${#1} != ${#2} ]] && echo 'left and right strands must be of equal length' && exit 1

    local -i res=0

    for (( i = 0; i < ${#1}; i++ )); do
        [[ ${1:i:1} != ${2:i:1} ]] && res=$res+1
    done

    echo $res

}

main "$@"