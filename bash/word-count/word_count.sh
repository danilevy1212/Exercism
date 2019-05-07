
#!/bin/env bash

set -o errexit #Exit if there is an error
set -o nounset #Exit if unset variables
#set -x #Useful for debugging

main(){    
    local -A words

    IFS=', ' read -ra input <<< "${1,,}"

    for word in "${input[@]}"; do
        filt_word=$(sed -e "s|^[[:punct:]]*||; s|[[:punct:]]*$||;" <<< ${word})
        local -i sum=${words[$filt_word]:-0}+1
        words["$filt_word"]=$sum
    done

    for K in "${!words[@]}"; do 
        echo "$K: ${words[$K]} "
    done

}

main "$@"