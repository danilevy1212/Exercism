
#!/bin/env bash

set -o errexit #Exit if there is an error
set -o nounset #Exit if unset variables
#set -x Useful for debugging

argn=$#

if [[ argn -eq 1 ]]
then
    echo "Hello, $1"
    exit 0
else
    echo "Usage: ./error_handling <greetee>"
    exit 1
fi
