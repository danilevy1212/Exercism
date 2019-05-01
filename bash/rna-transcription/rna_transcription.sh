
#!/bin/env bash

set -o errexit #Exit if there is an error
set -o nounset #Exit if unset variables
#set -x #Useful for debugging

main(){

    input=${1:-""}
    res=''
    
    for (( i = 0; i < ${#input}; i++ )); do
        case "${input:i:1}" in
        G)
            res+="C"
            ;;
        C)
            res+="G"
            ;;
        T)
            res+="A"
            ;;
        A)
            res+="U"
            ;;
        *)
            echo "Invalid nucleotide detected."
            exit 1
            ;;
        esac
    done

    echo "$res"
}

main $@