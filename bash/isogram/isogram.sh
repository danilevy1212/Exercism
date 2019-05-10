
#!/bin/env bash

set -o errexit #Exit if there is an error
set -o nounset #Exit if unset variables
#set -x #Useful for debugging

main(){    
    declare -A chars
    input=$(tr -d "[:blank:][:punct:]" <<< "${1,,}")

    for (( i = 0; i < ${#input}; i++ )); do
        test ${chars[${input:i:1}]+_} && { echo 'false'; exit; } || chars[${input:i:1}]="1"
    done

    echo 'true'
}

main "$@"