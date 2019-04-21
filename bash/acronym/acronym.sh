
#!/bin/env bash

set -o errexit #Exit if there is an error
set -o nounset #Exit if unset variables
#set -x #Useful for debugging

toupper(){
    echo $(echo $1 | awk '{print toupper($0)}')
}

main(){

    input=$@

    res=$(toupper ${input:0:1})

    for (( i = 1; i < ${#input}-1; i++ )); do
        [[ ${input:i:1} =~ [' -'] ]] && res+=$(toupper ${input:i+1:1})    
    done

    echo $res

    : '
    I thought this community solution was very elegant, so im including it, credit to https://github.com/patbl

    words="${1//[^a-zA-Z]/ }"
    acronym=""

    for word in $words; do
        acronym="$acronym${word:0:1}"
    done

    echo "${acronym^^}"
    '
}

main $@