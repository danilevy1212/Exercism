#!bin/env bash

set -o errexit #Exit if there is an error
set -o nounset #Exit if unset variables
#set -x

main() {
    filtered=$(tr -d '[:space:]' <<< "$1")
    [[ $filtered =~ ^[0-9]+$ ]] && (( ${#filtered} > 1 )) || { echo "false"; exit; }
    temp_arr=( $( for (( j=0; j<${#filtered}; j++ )); do echo "${filtered:$j:1}"; done ) )
    local -i sum=0
    flip="false"
    for (( i=${#temp_arr[@]}-1; i>=0; i-- )); do
        if [[ $flip == "true" ]]; then
            local -i doubled=${temp_arr[$i]}*2
            (( $doubled > 9 )) && doubled=$doubled-9
            temp_arr[$i]=$doubled
            flip="false"
        else
            flip="true"
        fi
        sum+=${temp_arr[$i]}            
    done
    
    IFS=''
    (( $sum%10==0 )) && echo "true" || echo "false"
}

main "$@"