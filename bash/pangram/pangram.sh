
#!/bin/env bash

set -o errexit #Exit if there is an error
set -o nounset #Exit if unset variables
#set -x #Useful for debugging

main(){

    input=$(echo $@ | awk '{print tolower($0)}')

    for i in {a..z}; do
        [[ $input =~ "$i" ]] || { echo false; exit 0; } # { } brackets are used to group commands within the same shell
    done

    echo true
}

main $@