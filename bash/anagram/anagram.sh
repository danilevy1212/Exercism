
#!/bin/env bash

set -o errexit #Exit if there is an error
set -o nounset #Exit if unset variables
#set -x #Useful for debugging

countLetters(){
    : '
        Recives as an argument a string of letters and a word string. Returns a string containing the occurences of each letter
        IE:

            countLetters "aec" "papa" => a2b0c0 
            countLetters "amp" "mapa" => a2m1p1 
    '
    res=""

    for ((i = 0; i < ${#1}; i++)); do
        local -i count=$( tr -cd "${1:i:1}" <<< "$2" | wc -c)
        res+="${1:i:1}$count"
    done

    echo $res
}

letterSortedSeq(){
    echo $1 | grep -o . | sort -u | tr -d "\n"
}

main(){

    inp="${1,,}"
    inp_count=$(countLetters $(letterSortedSeq $inp) $inp)
    shift

    res=''

    for j in "$@"; do
        can=${j,,}

        (( ${#can} == ${#inp} )) && [[ $inp != $can ]] || continue

        can_count=$(countLetters $(letterSortedSeq $can) $can)

        [[ $can_count == $inp_count ]] && res+="$j "

    done

    echo $res

}

main "$@"