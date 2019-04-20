
#!/bin/env bash

set -o errexit #Exit if there is an error
set -o nounset #Exit if unset variables
#set -x Useful for debugging

input="$1"




if [[ $((input % 4)) == 0 ]]
then
    if [[ $((input % 100)) == 0 ]]
    then
       if [[ $((input % 400)) == 0 ]]
       then
	        echo "true"
       else
           echo "false"
       fi
    else
       echo "true"
    fi
else
    echo "false"
fi
