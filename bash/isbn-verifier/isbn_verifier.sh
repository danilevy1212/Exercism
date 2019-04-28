
#!/bin/env bash

set -o errexit #Exit if there is an error
set -o nounset #Exit if unset variables
#set -x

main(){

    input=${1//[^[:alnum:]]/}

    local -i res=0
    local -i len=${#input}-1

    (( $len != 9 )) && { echo false; exit; }

    for ((i = 0;i < ${#input}-1; i++)); do
        [[ ${input:i:1} =~ [[:digit:]] ]] || { echo false; exit; } #if not a number exit
        
        local -i xcoef=10-$i

        res+=${input:i:1}*$xcoef
    done

    [[ ${input:len:1} == "X" ]] && res+=10 ||
    { [[ ${input:len:1} =~ [[:digit:]] ]] && res+=${input:len:1} ||
    { echo false; exit; } }

    (( res%11 == 0 )) && echo true || echo false

}

main "$@"