set -o errexit
set -o nounset
#set -x 

collatz(){
    local -i n=$1
    local -i step=$2

    (( $n == 1 )) && echo $step && return 0 #base–case

    step+=1
    (( $n%2 == 0 )) && n=n/2 || n=n*3+1
    collatz $n $step
}

main(){
    (( $1 <= 0 )) && { echo "Error: Only positive numbers are allowed"; exit 1; }
    echo $( collatz $1 0 )
}

main "$@"