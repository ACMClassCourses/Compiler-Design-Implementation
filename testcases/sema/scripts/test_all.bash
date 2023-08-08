#!/bin/bash

# This script should be used in the directory 'testcases/sema'.
# Usage: scripts/test_all.bash <compiler>
# Example:
#     scripts/test_all.bash '../../mxc -fsyntax-only'

error_from_wrong_working_directory() {
    echo "ERROR: The working directory is not okay!" >&2
    echo "       Please make sure that you are in the 'testcases/sema' directory," >&2
    echo "       'scripts/test.bash' is an executable file and 'judgelist.txt' exists." >&2
    exit 1
}

print_red_err() {
    echo -e "\033[31m$1\033[0m" >&2
}

if [ ! -x scripts/test.bash ]; then
    echo "ERROR: 'scripts/test.bash' is not avaible." >&2
    error_from_wrong_working_directory
elif [ ! -f judgelist.txt ]; then
    echo "ERROR: 'judgelist.txt' not found." >&2
    error_from_wrong_working_directory
fi

# judge_one_testscase <testcase>
judge_one_testcase() {
    scripts/test.bash "$COMPILER" $1 > /dev/null 2>&1
    if [ $? -ne 0 ]; then
        print_red_err "Fail to pass testcase: '$1'."
        return 1
    else
        return 0
    fi
}

if [ $# -ne 1 ]; then
    echo "Usage: $0 <complier>" >&2
    echo "       If you need to pass arguments to the compiler, please use" >&2
    echo "       quotation mark(') to pack the arguments along with the compiler" >&2
    echo "       command. For example, $0 './my_compiler -a -b -c'." >&2
    exit 1
else
    COMPILER=$1
    wrong_count=0
    total_count=0
    while read line; do
        (( total_count += 1 ))
        judge_one_testcase $line
        if [ $? -ne 0 ]; then
            (( wrong_count += 1 ))
        fi
    done < judgelist.txt
    if [ $wrong_count -eq 0 ]; then
        echo -e "\033[32mPassed all testcases.\033[0m" >&2
    else
        echo "$(( total_count - wrong_count ))/$total_count passed, $wrong_count/$total_count failed." >&2
    fi
fi
