
#!/bin/env bash

set -o errexit #Exit if there is an error
set -o nounset #Exit if unset variables
#set -x #Useful for debugging

main(){

    input="$@"

    local -i res=0

    for (( i = 0; i < ${#input}; i++ )); do
        local -i num=${input:i:1}
        res+=num**${#input}
    done

    [[ res -eq input ]] && echo true || echo false
}

main $@