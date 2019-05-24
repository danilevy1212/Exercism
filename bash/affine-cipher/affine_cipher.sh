#!/bin/env bash

set -o errexit #Exit if there is an error
set -o nounset #Exit if unset variables
# set -x #Useful for debugging

mmi(){
    local -i mO=$m
    local -i y=0 
    local -i x=1
    local -i a=$1

    while (( $a > 1 )); do 
        local -i q=$a/$mO 
        local -i t=$mO
   
        mO=$a%$mO 
        a=$t 
        t=$y 
  
        y=$x-$q*$y 
        x=$t 
    done
  
    if (( $x < 0 )); then 
	    x+=$m
    fi
  
    echo $x
}

encode(){
    for (( i=0; i < ${#3}; i++ )); do
        if [[ "${3:i:1}" =~ [A-Z] ]]; then
            local -i cip=$((${alpha2Index["${3:i:1}"]}*$1+$2))%$m
            echo -n ${alpha[$cip]}
        else
            echo -n "${3:i:1}"
        fi
    done
}

decode(){
    local inv_a=$(mmi $1)

    for (( i=0; i < ${#3}; i++ )); do
        if [[ "${3:i:1}" =~ [A-Z] ]]; then
            local -i cip=$(($inv_a*(${alpha2Index["${3:i:1}"]}-$2)))%$m
            echo -n ${alpha[$cip]}
        else
            echo -n "${3:i:1}"
        fi
    done
}

main(){
    declare -i m=26
    m_factors=( 2 13 )

    for i in "${m_factors[@]}"; do
        (( $2%$i==0 )) && { echo "a and m must be coprime."; exit 1; }
    done

    input=${4//[^[:alnum:]]/}
    alpha=( {a..z} )
    declare -A alpha2Index=( ['A']=0 ['B']=1 ['C']=2 ['D']=3 ['E']=4
                             ['F']=5 ['G']=6 ['H']=7 ['I']=8 ['J']=9 
                             ['K']=10 ['L']=11 ['M']=12 ['N']=13 ['O']=14
                             ['P']=15 ['Q']=16 ['R']=17 ['S']=18 ['T']=19
                             ['U']=20 ['V']=21 ['W']=22 ['X']=23 ['Y']=24
                             ['Z']=25 )
 
    case "$1" in
        "encode")
            tmp=$(encode $2 $3  ${input^^})
            echo $(sed 's/.\{5\}/& /g' <<< $tmp)
            ;;
        "decode")
            echo $(decode $2 $3  ${input^^})
            ;;
        *)
            echo "Invalid option"
            exit 1
            ;;
    esac
}

main "$@"
