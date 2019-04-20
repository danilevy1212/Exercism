
#!/bin/env bash

set -o errexit #Exit if there is an error
set -o nounset #Exit if unset variables

input="$1"
reverse=""

for ((i = ${#input};i >= 0; i--)) #Reverse for-loop
do
    reverse+=${input:$i:1} #Substring of 1 char
done

echo "$reverse"
