
#!/bin/env bash

set -o errexit #Exit if there is an error
set -o nounset #Exit if unset variables
#set -x #Useful for debugging


word="you"
if [[ $# -eq 1 ]]
then
    word="$1"
fi

echo "One for $word, one for me."
