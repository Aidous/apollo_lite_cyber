#! /bin/bash
set -e

SCRIPTS_PATH=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

function run_all_test() {
    cd apollo/bin
    ls
    source "${SCRIPTS_PATH}/cyber/setup.bash"
    declare -i file_count
    
    file_count=0
    for file in `ls *test`
    do 
        echo -e "\033[43;35m >>>>>>>> testing file: $file \033[0m" 
        ./$file
        file_count=$file_count+1
    done
    echo "Test $file_count files Over"
}

run_all_test
