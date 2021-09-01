function parser() {
    if [[ -f $1 && -r $1 ]]; then
        while IFS=";" read -r arg1 arg2
        do
            for i in "${!words[@]}"; do
                if [[ ${words[$i]} == $arg1 ]]; then
                    ${tab_func[$i]} $arg2 $2
                    if [ $? == 84 ];then
                        return 84
                    fi
                fi
            done
        done < <(cut -d ";" -f1,2 $1)
    else
        exit 84
    fi
}

function find_args() {
    if [[ -f $1 && -r $1 ]]; then
        while IFS=";" read -r arg1 arg2
        do
            if [[ $arg1 == $2 ]]; then
                echo "$arg2"
            fi
        done < <(cut -d ";" -f1,2 $1)
    else
        exit 84
    fi
}

function parse_c_files() {
    tmp="false"
    if [[ -f $1 && -r $1 ]]; then
        while IFS=";" read -r arg1 arg2
        do
            if [[ $arg1 = *".c" ]]; then
                tmp="true"
                fill_c_tab $arg1
            fi
        done < <(cut -d ";" -f1,2 $1)
    else
        exit 84
    fi
    if [[ $tmp == "false" ]];then
        return 84
    fi
    return 0
}

function parse_headers() {
    if [[ -f $1 && -r $1 ]]; then
        while IFS=";" read -r arg1 arg2
        do
            if [[ $arg2 = *".h"* ]]; then
                tmp="true"
                fill_headers $arg2
            fi
        done < <(cut -d ";" -f1,2 $1)
    else
        exit 84
    fi
    return 0
}