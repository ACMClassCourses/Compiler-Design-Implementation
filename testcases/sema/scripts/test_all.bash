#!/bin/bash

# Usage: scripts/test_all.bash <compiler> <sema_dir>
# Example:
#     scripts/test_all.bash '../../mxc -fsyntax-only' testcases/sema

if [ $# -ne 2 ]; then
    echo "Usage: $0 <complier> <sema_dir>" >&2
    echo "       If you need to pass arguments to the compiler, please use" >&2
    echo "       quotation mark(') to pack the arguments along with the compiler" >&2
    echo "       command. For example," >&2
    echo "       $0 './my_compiler -a -b -c' testcases/sema." >&2
    exit 1
fi

COMPILER=$1
SEMA_DIR=$2
if [ ${SEMA_DIR: -1:1} != "/" ]; then
    SEMA_DIR="$SEMA_DIR/"
fi

print_red_msg() {
    echo -e "\033[31m$1\033[0m" >&2
}
print_green_msg() {
    echo -e "\033[32m$1\033[0m" >&2
}

if [ ! -x ${SEMA_DIR}scripts/test.bash ]; then
    echo "ERROR: '${SEMA_DIR}scripts/test.bash' is not avaible." >&2
    exit 1
elif [ ! -f ${SEMA_DIR}judgelist.txt ]; then
    echo "ERROR: '${SEMA_DIR}judgelist.txt' not found." >&2
    exit 1
fi

# judge_one_testscase <testcase>
judge_one_testcase() {
    ${SEMA_DIR}scripts/test.bash "$COMPILER" $1 > /dev/null 2>&1
    if [ $? -ne 0 ]; then
        print_red_msg "Fail to pass testcase: '$1'."
        return 1
    else
        print_green_msg "Pass testcases: '$1'"
        return 0
    fi
}
wrong_count=0
total_count=0
while read line; do
    (( total_count += 1 ))
    judge_one_testcase $SEMA_DIR$line
    if [ $? -ne 0 ]; then
        (( wrong_count += 1 ))
    fi
done < ${SEMA_DIR}judgelist.txt
if [ $wrong_count -eq 0 ]; then
    print_green_msg "Passed all testcases."
else
    print_red_msg "$(( total_count - wrong_count ))/$total_count passed, $wrong_count/$total_count failed."
fi
