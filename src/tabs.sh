declare -a words
words[1]="CC"
words[2]="SOURCES_DIR"
words[3]="CFLAGS"
words[4]="HEADERS_DIR"
words[5]="LIBS_DIR"
words[6]="BCK_DIR"
words[7]="ZIP"
words[8]="ZIPFLAGS"
words[9]="UNZIP"
words[10]="UNZIPFLAGS"

declare -a src
declare -a head

declare -a tab_func
tab_func[1]="parser.CC"
tab_func[2]="parser.SOURCES_DIR"
tab_func[3]="parser.CFLAGS"
tab_func[4]="parser.HEADERS_DIR"
tab_func[5]="parser.LIBS_DIR"
tab_func[6]="parser.BCK_DIR"
tab_func[7]="parser.ZIP"
tab_func[8]="parser.ZIPFLAGS"
tab_func[9]="parser.UNZIP"
tab_func[10]="parser.UNZIPFLAGS"

function fill_c_files() {
    tmp=1
    for i in "${!src[@]}"; do
        if [[ $tmp == 1 && ${src[$i]} == *".c"* ]]; then
            echo -e "SRC\t=\t${src[$i]}" >> "$1/Makefile"
            tmp=0
        elif [[ ${src[$i]} == *".c"* ]]; then
            echo -e "\t\t${src[$i]}" >> "$1/Makefile"
        else
            echo -e "${src[$i]}" >> "$1/Makefile"
        fi
    done
    echo -e "\n$eval" >> "$1/Makefile"
}

function fill_headers_file() {
    tmp=1
    for i in "${!head[@]}"; do
        if [[ $tmp == 1 && ${head[$i]} == *".h"* ]]; then
            echo -e "CPPFLAGS\t=\t-I ${head[$i]}" >> "$1/Makefile"
            tmp=0
        elif [[ ${head[$i]} == *".h"* ]]; then
            echo -e "\t\t\t\t-I ${head[$i]}" >> "$1/Makefile"
        else
            echo -e "${head[$i]}" >> "$1/Makefile"
        fi
    done
    echo -e "\n" >> "$1/Makefile"
}

function fill_c_tab() {
    src[${#src[@]} + 1]="$1\t\\"
}

function fill_headers() {
    head[${#head[@]} + 1]="$1\t\\"
}

function parser.EXEC() {
    echo -e "NAME\t=\t${@:1:$#-1}\n" >> "${@: -1}/Makefile"
}

function parser.SOURCES_DIR() {
    if [[ ! -d "${@: -1}/${@:1:$#-1}/" ]];then
        return 84
    else
        eval="\$(eval SRC = \$(addprefix ${@:1:$#-1}/, \$(SRC)))\n"
    fi
}

function parser.CC() {
    echo -e "CC\t=\t${@:1:$#-1}\n" >> "${@: -1}/Makefile"
}

function parser.CFLAGS() {
    echo -e "CFLAGS\t=\t${@:1:$#-1}\n" >> "${@: -1}/Makefile"
}

function parser.HEADERS_DIR() {
    if [[ ! -d "${@: -1}/${@:1:$#-1}/" ]];then
        return 84
    else
        echo -e "CPPFLAGS\t=\t-I ${@:1:$#-1}/\n" >> "${@: -1}/Makefile"
    fi
}

function parser.LIBS_DIR() {
    if [[ ! -d "${@: -1}/${@:1:$#-1}/" ]];then
        return 84
    else
        echo -e "LDFLAGS\t=\t-L ${@:1:$#-1}/\n" >> "${@: -1}/Makefile"
    fi
}

function parser.BCK_DIR() {
    if [[ ! -d "${@: -1}/${@:1:$#-1}/" ]];then
        return 84
    else
        echo -e "BCK_DIR\t=\t${@:1:$#-1}/\n" >> "${@: -1}/Makefile"
    fi
}

function parser.ZIP() {
    echo -e "ZIP\t=\t${@:1:$#-1}\n" >> "${@: -1}/Makefile"
}

function parser.ZIPFLAGS() {
    echo -e "ZIPFLAGS\t=\t${@:1:$#-1}\n" >> "${@: -1}/Makefile"
}

function parser.UNZIP() {
    echo -e "UNZIP\t=\t${@:1:$#-1}\n" >> "${@: -1}/Makefile"
}

function parser.UNZIPFLAGS() {
    echo -e "UNZIPFLAGS\t=\t${@:1:$#-1}\n" >> "${@: -1}/Makefile"
}