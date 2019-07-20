#!/usr/bin/env bash
set -euo pipefail

main() {
    local planet=$1 && shift
    local earth_years=$(echo "$1 / 31557600" | bc -l)
    local -A to_earth_years=( ["Earth"]=1
                              ["Mercury"]=0.2408467
                              ["Venus"]=0.61519726
                              ["Mars"]=1.8808158
                              ["Jupiter"]=11.862615
                              ["Saturn"]=29.447498
                              ["Uranus"]=84.016846
                              ["Neptune"]=164.79132 )

    if [[ "${to_earth_years[$planet]+_}" ]]; then
        printf "%.2f\n" "$(echo "$earth_years / ${to_earth_years[$planet]}" | bc -l)"
    else
        echo "not a planet" >&2; exit 1;
    fi
}

main "$@"
