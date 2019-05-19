
#!/bin/env bash

set -o errexit #Exit if there is an error
set -o nounset #Exit if unset variables
#set -x #Useful for debugging

main(){
    input=${2//[^[:alnum:]]/}
    tmp=$(tr '[a-z]' '[zyxwvutsrqponmlkjihgfedcba]' <<< ${input,,})
 
    case "$1" in
        "encode")
            echo $(sed 's/.\{5\}/& /g' <<< $tmp)
            ;;
        "decode")
            echo $tmp
            ;;
        *)
            echo "Invalid option"
            exit 1
            ;;
    esac
}

main "$@"