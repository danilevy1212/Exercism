set -o errexit
set -o nounset
#set -x 

roman_num(){
    local -i dec=$1
    res=$2

    (( $dec == 0 )) && echo $res && return 0 # base–case

    for i in ${rom[@]}; do
        (( dec-${rom2num["$i"]} >= 0 )) && { res+=$i; (( dec-=${rom2num["$i"]} )); break; } || continue
    done

    roman_num $dec $res
}

main(){
    declare -A rom2num=(['M']=1000 ['CM']=900 ['D']=500 ['CD']=400 ['C']=100 
                        ['XC']=90  ['L']=50   ['XL']=40 ['X']=10   ['IX']=9 
                        ['V']=5    ['IV']=4   ['I']=1)
    rom=('M' 'CM' 'D' 'CD' 'C' 'XC' 'L' 'XL' 'X' 'IX' 'V' 'IV' 'I')

    echo $( roman_num $1 '' )
}

main "$@"