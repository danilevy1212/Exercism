set -o errexit
set -o nounset
# set -x

main(){

    input=( $@ )
    declare -A colors=( ['black']=0 ['brown']=1 ['red']=2 ['orange']=3 ['yellow']=4
			['green']=5 ['blue']=6 ['violet']=7 ['grey']=8 ['white']=9 )

    res=$(for i in ${input[@]}; do [[ ${colors[$i]+_} ]] && echo -n ${colors[$i]} || return 1; done) ||
	{ echo "invalid color"; exit 1; }

    echo $res
}

main "$@"
