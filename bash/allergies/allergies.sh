set -o errexit
set -o nounset
# set -x 

genAllerList(){
    local -i allerScore=$1
    declare -A aller2num=( ['cats']=128 ['pollen']=64 ['chocolate']=32 ['tomatoes']=16 
                           ['strawberries']=8 ['shellfish']=4 ['peanuts']=2 ['eggs']=1 )

    while (( $allerScore > 256 )); do
	    allerScore=$allerScore-256
    done

    for i in ${aller[@]}; do
	    (( $allerScore-${aller2num["$i"]} >= 0 )) && { allerScore=$allerScore-${aller2num["$i"]}; echo -n "$i "; } || continue 
    done    
}

main(){
    aller=( 'cats' 'pollen' 'chocolate' 'tomatoes' 
            'strawberries' 'shellfish' 'peanuts' 'eggs' )
    option="$2"
    aller_list=( `genAllerList $1` )

    case "$option" in
        "allergic_to")
            [[ "${aller_list[@]}" =~ "${3}" ]] && echo "true" || echo "false"
            ;;
        "list")
            echo $( for (( i=${#aller_list[@]}-1 ; i>=0 ; i-- )) ; do echo -n "${aller_list[$i]} "; done )
            ;;
        *)
            echo "Invalid option" && exit 1
            ;;
    esac
}

main "$@"