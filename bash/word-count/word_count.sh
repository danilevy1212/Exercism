
#!/bin/env bash

set -o errexit #Exit if there is an error
set -o nounset #Exit if unset variables
#set -x #Useful for debugging

main(){
    
    filter=$(printf "$@" 2> /dev/null |tr '\n' ' '|tr ',' ' ')
    input=(${filter,,})

    declare -A words

    for word in "${input[@]}"; do
        filt_word=$(sed -e "s|^[[:punct:]]*||; s|[[:punct:]]*$||;" <<< ${word})

        local -i sum=${words[$filt_word]:-0}+1
        words["$filt_word"]=$sum
    done

    res=''

    for K in "${!words[@]}"; do 
        echo "$K: ${words[$K]} "
    done

}

main "$@"