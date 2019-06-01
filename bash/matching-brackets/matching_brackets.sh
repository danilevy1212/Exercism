#!/usr/bin/env bash

set -o nounset
set -o errexit
# set -x

main(){
    local -A closing=( [']']='['
                       ['}']='{'
                       [')']='(' )
    local -A opening=( ['[']=']'
                       ['{']='}'
                       ['(']=')' )
    local -a stack=()

    local input="$@"

    for ((i=0; i<${#input}; i++)); do
        local tmp="${input:i:1}"

        [[ "${opening[$tmp]+_}" ]] && stack+=("$tmp") && continue
        [[ "${closing[$tmp]+_}" ]] &&
            { (( "${#stack[@]}" > 0 )) && [[ "${closing[$tmp]}" == "${stack[-1]}" ]] && unset stack[-1] || { echo "false"; exit; }; }
    done

    (( "${#stack[@]}" == 0 )) && echo "true" || echo "false"
}

main "$@"
