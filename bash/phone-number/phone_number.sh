
#!/bin/env bash

set -o errexit #Exit if there is an error
set -o nounset #Exit if unset variables
#set -x #Useful for debugging

errorOut(){
    echo "Invalid number.  [1]NXX-NXX-XXXX N=2-9, X=0-9"
    exit 1
}

main(){    
    number=${1//[^0-9]/}

    (( ${#number} == 11 )) && { (( ${number:0:1} == 1 )) && number=${number##1} || errorOut; } 
    (( ${#number} > 11 || ${#number} < 9 )) && errorOut
    [[ ${number:0:1} =~ [2-9]  && ${number:3:1} =~ [2-9] ]]  && echo "$number" || errorOut
}

main "$@"