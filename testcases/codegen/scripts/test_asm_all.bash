#!/bin/bash

# Usage: scripts/test.bash <compiler> <codegen_dir> <builtin>
# Example:
#    scripts/test.bash 'bin/mxc -S' ./testcases/codegen bin/builtin.s

if [ $# -ne 3 ]; then
    cat << EOF >&2 
Usage: $0 <complier> <codegen_dir> <builtin>
       If you need to pass arguments to the compiler, please use
       quotation mark(') to pack the arguments along with the compiler
       command. For example,
       $0 'bin/mxc -a -b -c' testcases/codegen bin/builtin.s
EOF
    exit 1
fi

if [ ! -d $2 ]; then
    echo "Error: codegen_dir $2 does not exist." >&2
    exit 1
fi
if [ ! -f $3 ]; then
    echo "Error: builtin file $3 does not exist." >&2
    exit 1
fi

source $(dirname $0)/utils.bash

COMPILER=$1
CODEGEN_DIR=$2
BUILTIN=$3
if [ ${CODEGEN_DIR:0:1} != "/" ]; then
    CODEGEN_DIR="$CODEGEN_DIR/"
fi

if [ ! -x ${CODEGEN_DIR}scripts/test_asm.bash ]; then
    echo "Error: ${CODEGEN_DIR}scripts/test_asm.bash does not exist or is not executable." >&2
    exit 1
elif [ ! -f ${CODEGEN_DIR}judgelist.txt ]; then
    echo "Error: ${CODEGEN_DIR}judgelist.txt not found." >&2
    exit 1
fi

TEMPDIR="$(mktemp -d -p /tmp mxc.XXXXXXXXXX)"
if [ $? -ne 0 ]; then
    echo "Error: Failed to create temp directory." >&2
    exit 1
fi

FAILED_TESTCASE=""
# judge_one_testscase <testcase> <name>
judge_one_testcase() {
    local TESTDIR="$TEMPDIR/$2"
    mkdir -p $TESTDIR
    ${CODEGEN_DIR}scripts/test_asm.bash "$COMPILER" $1 $BUILTIN $TESTDIR > /dev/null 2>&1
    if [ $? -ne 0 ]; then
        FAILED_TESTCASE="$2"
        print_red_msg "Fail to pass testcase: '$1'."
        return 1
    else
        rm -rf $TESTDIR
        print_green_msg "Pass testcases: '$1'"
        return 0
    fi
}
wrong_count=0
total_count=0
while read line; do
    (( total_count += 1 ))
    judge_one_testcase $CODEGEN_DIR$line $line
    if [ $? -ne 0 ]; then
        (( wrong_count += 1 ))
    fi
done < ${CODEGEN_DIR}judgelist.txt
if [ $wrong_count -eq 0 ]; then
    rm -rf $TEMPDIR
    print_green_msg "Passed all testcases."
else
    print_red_msg "$(( total_count - wrong_count ))/$total_count passed, $wrong_count/$total_count failed."
    cat <<EOF >&2
All generated files are at '$TEMPDIR'. You may check some files there.
For example, you may check the output of your compiler at
'$TEMPDIR/$FAILED_TESTCASE/output.s'.
Use the following command to clean up the temp directory:
    rm -rf "$TEMPDIR"
EOF
fi
