
#!/bin/env bash

set -o errexit #Exit if there is an error
set -o nounset #Exit if unset variables
#set -x #Useful for debugging

: ' This script was realized in a Mac OS X system, as result the date command 
    has a slightly different syntax than the GNU core tools'


main(){

    local -i gigasecond=10**9
    local -i datetime
    
    (( ${#1}==20 )) &&
        datetime=$(date -u -j -f "%Y-%m-%d %H:%M:%SZ" "$1" "+%s") ||
        datetime=$(date -u -j -f "%Y-%m-%dZ %H:%M:%S" "$1 00:00:00" "+%s")

    local -i total=gigasecond+datetime
    
    echo `TZ=UTC date -r $total`
}

main "$@"