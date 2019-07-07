#!/usr/bin/env bash
set -eou pipefail
set -o noglob

main(){
    local -i N="$1"
    local -i N_sqrd=N**2
    local -i a b

    for ((a = 1; a < N - 1; a++)); do
        for ((b = a + 1; b < N; b++)); do
            local -i c_sqrd="a**2+b**2"
            if (( c_sqrd == (N-a-b)**2 )); then
                local -i c=$(bc <<< "scale=0; sqrt($c_sqrd)" )
                echo "$a,$b,$c"
            elif (( c_sqrd > N_sqrd)); then
                break # No sense in looking if c is larger than N
            fi
        done
    done

    # Explanation: Since we know that a^2+b^2=c^2 and a+b+c=N
    # we can rewrite the first expression to be c=sqrt(a^2+b^2)
    # and plug into the second expression. Moving some symbols around
    # we arrive to c^2 = (N-a-b)^2, which becomes our target
    # The computational cost is 0(N^2)
}

main "$@"
