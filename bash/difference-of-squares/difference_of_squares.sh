
#!/bin/env bash

set -o errexit #Exit if there is an error
set -o nounset #Exit if unset variables
#set -x #Useful for debugging


square_of_sum(){
    local -i sq_sum=0

    for (( i = 1; i <= $1; i++ )); do
        sq_sum+=i
    done

    echo $(( $sq_sum**2 ))
}

sum_of_squares(){
    local -i sum=0

    for (( i = 1; i <= $1; i++ )); do
        sum+=i**2
    done

    echo $sum
}

difference(){
    echo $(( $(square_of_sum $1) - $(sum_of_squares $1) ))
}

main(){

    case "$1" in
        "square_of_sum")
            echo $(square_of_sum "$2")
            ;;
        "sum_of_squares")
            echo $(sum_of_squares $2)
            ;;
        "difference")
            echo $(difference $2)
            ;;
        *)
            echo "Invalid option" && exit 1
            ;;
    esac
}

main $@