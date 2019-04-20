
#!/bin/env bash

set -o errexit #Exit if there is an error
set -o nounset #Exit if unset variables
set -x #Useful for debugging

input="$1"


#if ((${#input} != 1)) || [ "$input" -eq "$input" ]
#then
#    echo "Usage: leap.sh <year>"
#fi

if [[ $# != 1 ]] || ! [[ $input =~ ^[0-9]+$  ]] ; then
    echo "Usage: leap.sh <year>"
    exit 1
fi


if [[ $((input % 4)) -eq 0 ]]
then
    if [[ $((input % 100)) -eq 0 ]]
    then
       if [[ $((input % 400)) -eq 0 ]]
       then
	    echo true
       else
           echo false
       fi
    else
       echo true
    fi
else
    echo false
fi
