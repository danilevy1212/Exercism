
#!/bin/env bash

set -o errexit #Exit if there is an error
set -o nounset #Exit if unset variables
#set -x #Useful for debugging

main(){

    local -i A=0
    local -i C=0
    local -i G=0
    local -i T=0
    
    for (( i = 0; i < ${#1}; i++ )); do
        case "${1:i:1}" in
        "A")
            A+=1
            ;;
        "C")
            C+=1
            ;;
        "G")
            G+=1
            ;;
        "T")
            T+=1
            ;;
        *)
            echo "Invalid nucleotide in strand"
            exit 1
            ;;
        esac
    done

    echo -e "A: $A\nC: $C\nG: $G\nT: $T"
}

main $@