#!/usr/bin/env bash

set -o errexit
set -o nounset
# set -x

macroExtender(){
    local new=$1 && shift
    local -i ind=$1 && shift
    local -a arr=( $@ )

    (( $ind >=  ${#arr[@]} )) && { echo ${arr[@]}; return 0; } # Base-case
    [[ ${arr[@]} =~ "$new" ]] && { echo "illegal self-referencing expression"; return 1; } # Error-case

    if ! [[ ${macro[${arr[$ind]}]+_} ]]; then
			  ind+=1
		    macroExtender $new $ind "${arr[@]}"
		else
			  arr[$ind]=${macro[${arr[$ind]}]}
			  macroExtender $new $ind "${arr[@]}"
		fi
}

processMacro(){
    local -a arr=( $1 )

    if [[ ${arr[0]} == ':' ]]; then
		    if [[ ${arr[$((${#arr[@]}-1))]} != ';' ]]; then
			      echo "macro not terminated with semicolon" >&2
			      exit 1
		    elif (( ${#arr[@]} < 4 )); then
			      echo "empty macro definition" >&2
			      exit 1
		    elif [[ ${arr[1]} =~ [0-9] ]]; then
			      echo "illegal operation" >&2
			      exit 1
		    else
			      macro[${arr[1]}]=`macroExtender "${arr[1]}" 0 $(for (( j=2; j<${#arr[@]}-1; j++ )); do echo "${arr[$j]}"; done)` ||
                { echo "illegal self-referencing expression"; exit 1; }
		    fi
    fi
}

expand(){
    local -i ind=$1 && shift
    local -a arr=( $@ )

    (( $ind >=  ${#arr[@]} )) && { echo ${arr[@]}; return 0; } # Base-case

    if [[ ${macro[${arr[$ind]}]+_} ]]; then
		    if [[ ${arr[0]} == ':' ]] && (( $ind == 1 )); then
			      ind+=1
			      expand $ind "${arr[@]}"
		    else
			      arr[$ind]=${macro[${arr[$ind]}]}
			      expand $ind "${arr[@]}"
		    fi
	  elif [[ ${arr[$ind]} == ':' ]] && (( $ind != 0 )); then
		    echo "wrong syntax"
		    return 1
    elif [[ ${arr[$ind]} == ';' ]] && (( $ind <  $((${#arr[@]}-1)) )); then
		    echo "wrong syntax"
		    return 1
    else
		    ind+=1
		    expand $ind "${arr[@]}"
    fi
}

pop(){
    poped=${stack[$((${#stack[@]}-1))]}
    unset -v "stack[$((${#stack[@]}-1))]"
}

push(){
    stack+=( $1 )
}

over(){
    pop && local -i second=$poped && pop && first=$poped
    push $first && push $second && push $first
}

swap(){
    pop && local -i second=$poped && pop && first=$poped
    push $second && push $first
}

dup(){
    pop && local -i repl=$poped
    push $repl && push $repl
}

div(){
    pop && local -i second=$poped && pop && local -i first=$poped
    (( $second > 0 )) && push $(($first/$second)) || { echo "Cannot divide by zero" >&2; exit 1; }
}

mult(){
    pop && local -i second=$poped && pop && local -i first=$poped
    push $(($first*$second))
}

sub(){
    pop && local -i second=$poped && pop && local -i first=$poped
    push $(($first-$second))
}

add(){
    pop && local -i second=$poped && pop && local -i first=$poped
    push $(($first+$second))
}

main(){
    declare -A inst=( ['+']="add" ['-']="sub" ['#']="mult" ['/']='div'
		                  ['dup']="dup" ['drop']="pop" ['swap']="swap" ['over']="over" )
    declare -A macro=()
    declare -a stack=()
    declare -i poped

    while read line; do
		    local tmp && tmp=`expand 0 "$(tr '*' '#' <<< "${line,,}")"` || { echo "$tmp" >&2; exit 1; }

		    [[ ${tmp:0:1} == ':' ]] && { processMacro "$tmp"; continue; }

		    declare -a input=( $tmp )

		    for item in ${input[@]}; do
			      [[ "$item" =~ [0-9] ]] && { push "$item"; continue; }

			      [[ ${inst["$item"]+_} ]] || { echo "undefined operation: $item" >&2; exit 1; }

			      case ${inst[$item]} in
				        'add'|'sub'|'mult'|'div'|'swap'|'over')
					          (( "${#stack[@]}" == 0 )) && { echo "empty stack" >&2; exit 1; }  
					          (( "${#stack[@]}" < 2 )) && { echo "only one value on the stack" >&2; exit 1; }
					          "${inst[$item]}"
					          ;;
				        'dup'|'pop')
					          (( "${#stack[@]}" == 0 )) && { echo "empty stack" >&2; exit 1; }  
					          "${inst[$item]}"
					          ;;
				        *)
					          echo "undefined operation: $item" >&2
					          exit 1
					          ;;
			      esac
		    done
    done < "${1:-/dev/stdin}"

    echo "${stack[@]}"
}

main
