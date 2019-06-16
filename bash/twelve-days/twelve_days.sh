#!/usr/bin/env bash

set -euo pipefail

die(){ echo "$1" >&2; exit 1; }

main(){
    local -i start=$1-1 end=$2-1

    (( end < start )) && die "End cannot be larger than the start"

    local -a verses=( " a Partridge in a Pear Tree." " two Turtle Doves, and" " three French Hens,"
                      " four Calling Birds," " five Gold Rings," " six Geese-a-Laying,"
                      " seven Swans-a-Swimming," " eight Maids-a-Milking," " nine Ladies Dancing,"
                      " ten Lords-a-Leaping," " eleven Pipers Piping," " twelve Drummers Drumming," )
    local -a day=( "first" "second" "third" "fourth" "fifth" "sixth"
                   "seventh" "eighth" "ninth" "tenth" "eleventh" "twelfth" )
    local history

    for ((i=start; i<=end; i++)); do
        history=$(for ((j=i; j>=0; j--)); do echo -n "${verses[$j]}"; done)
        echo "On the ${day[$i]} day of Christmas my true love gave to me:$history"
    done
}

main "$@"
