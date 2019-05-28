#!/usr/bin/env bash

set -o errexit
set -o nounset
# set -x

binarySearch(){
    local -i target=$1
    local -i start=$2
    local -i end=$3

    (( $start > $end )) && { echo "-1"; exit 0; } # Base-Case, not found

    local -i mid=($start+$end)/2

    (( ${arr[$mid]} == $target )) && { echo $mid; exit 0; } # Base-case, success
    (( $target < ${arr[$mid]} )) && binarySearch $target $start $(($mid-1))
    (( $target > ${arr[$mid]} )) && binarySearch $target $(($mid+1)) $end
}

main(){
    local target=$1 && shift
    declare arr=( $@ )

    binarySearch $target 0 $((${#arr[@]}-1))
}

main $@
