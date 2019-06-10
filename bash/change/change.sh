set -euo pipefail
# set -x

main(){
    local -i target=$1 && shift

    (( $target < 0 )) && echo "target can't be negative" && exit 1
    (( $target == 0 )) && echo "" && exit 0

    local -a coins=( $@ )
    local -a changeArr=()

    # Initializes an array to solve the minimum change problem.
    changeArr+=(0)
    local -i i

    for (( i=1; i <= $target; i++ )); do
        changeArr+=($(($target+1)))
    done

    for (( i=1; i <= $target; i++ )); do
        local -a curArr=( ${changeArr[$i]} )
        local -i cur_n=${curArr[0]}
        local -a cur_comb="${curArr[@]:1}"

        for coin in "${coins[@]}"; do
            if(( $i - $coin >= 0 ));then
                local -a comptoArr=( ${changeArr[$i-$coin]} )
                local -i compto_n=${comptoArr[0]}+1

                if (( $cur_n > $compto_n )); then
                    changeArr[$i]="$compto_n $coin ${comptoArr[@]:1}"
                    curArr=( ${changeArr[$i]} )
                    cur_n=${curArr[0]}
                    cur_comb="${curArr[@]:1}"
                fi
            fi
        done
    done

    local -a tmp=( ${changeArr[$target]} )

    (( ${tmp[0]} == $target + 1 )) && echo "can't make target with given coins" && exit 1

    res=`for (( i=1; i<=${tmp[0]}; i++ )); do echo -n "${tmp[$i]} "; done`

    echo "${res:0:-1}"
}

main "$@"
