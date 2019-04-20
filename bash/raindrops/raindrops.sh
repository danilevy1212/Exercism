
#!/bin/env bash

set -o errexit #Exit if there is an error
set -o nounset #Exit if unset variables
#set -x Useful for debugging

main(){

    word=""

    if (( $1 % 3  == 0 )) ; then
        word=$word"Pling"
    fi

    if (( $1 % 5  == 0 )) ; then
        word=$word"Plang"
    fi

    if (( $1 % 7  == 0 )) ; then
        word=$word"Plong"
    fi

    echo ${word:-$1}
}

main $@