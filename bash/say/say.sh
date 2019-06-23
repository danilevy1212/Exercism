#!/usr/bin/env bash

set -euo pipefail

die(){
    echo "$1" >&2 && exit 1
}

separateInto(){
    echo -e "$(sed "s/.\{$1\}/& /g" <<< "$2")"
}

separateDigits(){
    separateInto 1 "$1"
}

separateHundreds(){
    rev <<< "$(separateInto 3 "$(rev <<< "$1")")" # Reversed so it adds spaces starting from the right
}

composeDec(){
    local -i n="$1"
    local -A irr=([10]="ten" [11]="eleven" [12]="twelve" [13]="thirteen")
    local -a units=("one" "two" "three" "four"
                    "five" "six" "seven" "eight" "nine")
    local -a dec=("teen" "twenty" "thirty" "forty"
                  "fifty" "sixty" "seventy" "eighty" "ninety")
    case $n in
        [0-9])
            echo -n "${units[$((n-1))]}"
            ;;
        1[0-9])
            if [[ "${irr[$n]+_}" ]]; then
                echo -n "${irr[$n]}"
            else
                local -a ind=( $(separateDigits "$n") )
                echo -n "${units[$((ind[1]-1))]}${dec[$((ind[0]-1))]}"
            fi
            ;;
        [1-9][0-9])
            local -a ind=( $(separateDigits "$n") )
            if (( ind[1] == 0 )); then
                echo -n "${dec[$((ind[0]-1))]}"
            else
                echo -n "${dec[$((ind[0]-1))]}-${units[$((ind[1]-1))]}"
            fi
            ;;
    esac

}

composeHundreds(){
    local n="$(echo $1 | sed 's/^0*//')" # Trim zeroes on left
    local c=""
    local x=""

    (( n > 99 )) && c="hundred $(composeDec "${n:0:1}")" && n="${n:1:2}"

    (( n > 0 )) && x="$(composeDec "$n") "

    echo -n "$x$c"
}

main(){
    local -i number=$1

    (( number < 0 || number > 999999999999 )) && die "input out of range"

    local -a hundreds=( $(separateHundreds "$number") )
    local -a term=( "thousand" "million" "billion" )
    local -i j=0
    local -a hundred_above=($(for ((i="${#hundreds[@]}-2"; i>=0; i--)); do
                                  if ((  "${hundreds[$i]}" > 0 )); then
                                     echo -n " ${term[$j]} $(composeHundreds "${hundreds[$i]}")"
                                  fi
                                  j=$((1+j))
                              done)) # Numbers are composed into words in reverse order
    local res

    res="$(tac -s' ' <<< " $(composeHundreds "${hundreds[-1]}") ${hundred_above[@]}" | xargs)" # then reversed back into proper order

    [[ $res == "" ]] && res="zero" # Taking care of zero edge case

    say "$res" && echo "$res" # OSX say
}

main "$@"
