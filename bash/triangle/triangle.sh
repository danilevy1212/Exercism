
#!/bin/env bash

set -o errexit #Exit if there is an error
set -o nounset #Exit if unset variables
#set -x #Useful for debugging

valEquality(){
    sum12=$(bc -l <<< "$1+$2")
    sum13=$(bc -l <<< "$1+$3")
    sum23=$(bc -l <<< "$2+$3")

    (( $(bc -l <<< "$sum12 > $3") )) && 
    (( $(bc -l <<< "$sum13 > $2") )) &&
    (( $(bc -l <<< "$sum23 > $1") )) &&
    true || false
}

equilateral(){
    [[ $1 == $2 && $1 == $3 && $2 == $3 ]] &&
    true || false
}

isosceles(){
    [[ $1 == $2 || $1 == $3 || $2 == $3 ]] &&
    true || false
}

main(){
    (valEquality $2 $3 $4) &&
    case "$1" in
        "equilateral")
            shift
            equilateral $1 $2 $3 &&
            echo true || echo false
            ;;
        "isosceles")
            shift
            isosceles $1 $2 $3 &&
            echo true || echo false
            ;;
        "scalene")
            shift
            isosceles $1 $2 $3 &&
            echo false || echo true
            ;;
        *)
            "Invalid option" && exit 1
        ;;
    esac || echo false
}

main $@