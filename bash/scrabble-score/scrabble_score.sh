#!/bin/env bash

set -o errexit #Exit if there is an error
set -o nounset #Exit if unset variables
#set -x

main(){
    local -i res=0
    input="${1^^}"

    for ((i = 0;i < ${#input}; i++)); do
        case "${input:i:1}" in
        [AEIOULNRST])
            res+=1
            ;;
        [DG])
            res+=2
            ;;
        [BCMP])
            res+=3
            ;;
        [FHVWY])
            res+=4
            ;;
        [K])
            res+=5
            ;;
        [JX])
            res+=8
            ;;
        [QZ])
            res+=10
            ;;
        *)
            :
            ;;
        esac
    done

    echo $res
}

main "$@"

