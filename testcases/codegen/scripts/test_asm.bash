#!/bin/bash

# Usage: scripts/test_asm.bash <compiler> <testcase> [builtin] [tempdir]
# The builtin and tempdir are optional. If there are three arguments, the
# script will check whether the third argument is a file. If it is a file,
# then it will be treated as the builtin file. Otherwise, it will be treated
# as the tempdir.
# Example:
#     scripts/test.bash 'bin/mxc -S' testcases/codegen/t1.mx bin/builtin.s
# The script will
# 1. Get an temporary directory
# 2. Execute <compiler> < <testcase> > "$TEMPDIR/output.s"
# 3. Get the test.in and test.ans from <testcase> using sed
# 4. Execute ravel --input-file="$TEMPDIR/test.in" --output-file="$TEMPDIR/test.out" "$TEMPDIR/output.s" [builtin]
# 5. Compare the output and exit code

# Usage
if [ $# -ne 2 ] && [ $# -ne 3 ] && [ $# -ne 4 ]; then
    cat << EOF >&2 
Usage: $0 <compiler> <testcase> [builtin] [tempdir]
       The builtin and tempdir are optional. If there are three arguments, the
       script will check whether the third argument is a file. If it is a file,
       then it will be treated as the builtin file. Otherwise, it will be
       treated as the tempdir.
       If you need to pass arguments to the compiler, please use
       quotation mark(') to pack the arguments along with the compiler
       command. For example,
       $0 'bin/mxc -a -b -c' testcases/codegen/t1.mx bin/builtin.s
EOF
    exit 1
fi

# Set variables
COMPILER=$1
TESTCASE=$2

# Test whether the testcase file and builtin file exist or not
if [ ! -f $TESTCASE ]; then
    echo "Error: testcase file $TESTCASE does not exist." >&2
    exit 1
fi
source $(dirname $0)/utils.bash

# Test whether ravel is installed
# If not installed, please follow the document at
# <https://github.com/Engineev/ravel>.
# Note: If you just follow the steps in the README, you need to put the last
# line (export PATH="/usr/local/opt/bin:$PATH") in your .bashrc or .zshrc
# (depending on which shell you are using).
test_bin ravel

# 1. Make temp directory
if [ $# -eq 4 ]; then
    HAS_BUILTIN=1
    BUILTIN=$3
    TEMPDIR=$4
    USER_DEFINED_TEMPDIR=1
elif [ $# -eq 3 ]; then
    if [ ! -f $3 ]; then
        HAS_BUILTIN=0
        TEMPDIR=$3
    else
        HAS_BUILTIN=1
        BUILTIN=$3
        USER_DEFINED_TEMPDIR=0
        TEMPDIR="$(mktemp -d -p /tmp mxc.XXXXXXXXXX)"
        if [ $? -ne 0 ]; then
            echo "Error: Failed to create temp directory." >&2
            exit 1
        fi
    fi
else
    HAS_BUILTIN=0
    USER_DEFINED_TEMPDIR=0
    TEMPDIR="$(mktemp -d -p /tmp mxc.XXXXXXXXXX)"
    if [ $? -ne 0 ]; then
        echo "Error: Failed to create temp directory." >&2
        exit 1
    fi
fi
if [ ! -d $TEMPDIR ]; then
    echo "Error: temp directory not exists." >&2
    exit 1
fi

# clean cleans up the temp directory
clean() {
    if [ $USER_DEFINED_TEMPDIR -eq 0 ]; then
        rm -rf "$TEMPDIR"
    fi
}

# print_temp_dir prints the temp directory
# This function is used when the test fails
print_temp_dir() {
    cat << EOF >&2
All generated files are at '$TEMPDIR'. You may check some files there.
For example, you may check the output of your compiler at '$TEMPDIR/output.s'.
Use the following command to clean up the temp directory:
    rm -rf '$TEMPDIR'
EOF
}

# 2. Compile the testcase with your compiler
echo "Compiling '$TESTCASE' with your compiler..." >&2
$COMPILER < $TESTCASE > "$TEMPDIR/output.s"
if [ $? -ne 0 ]; then
    echo "Error: Failed to compile $TESTCASE." >&2
    clean
    exit 1
fi

# 3. Get the test.in, test.ans exit code from <testcase> using sed
sed -n '/=== input ===/,/=== end ===/{//!p}' $TESTCASE > "$TEMPDIR/test.in"
if [ $? -ne 0 ]; then
    echo "Error: Failed to get input from $2." >&2
    clean
    exit 1
fi
sed -n '/=== output ===/,/=== end ===/{//!p}' $TESTCASE > "$TEMPDIR/test.ans"
if [ $? -ne 0 ]; then
    echo "Error: Failed to get output from $2." >&2
    clean
    exit 1
fi
EXPECTED_EXIT_CODE=$(grep "ExitCode:" $TESTCASE | awk '{print $2}')

# 4. Execute the code with ravel
ravel --input-file="$TEMPDIR/test.in" --output-file="$TEMPDIR/test.out" "$TEMPDIR/output.s" $BUILTIN > "$TEMPDIR/ravel_output.txt"
if [ $? -ne 0 ]; then
    cat << EOF >&2
Error: Ravel exits with a non-zero value.
You may run the following command again to see the error message:
    ravel --input-file='$TEMPDIR/test.in' --output-file='$TEMPDIR/test.out' '$TEMPDIR/output.s' $BUILTIN
EOF
    print_temp_dir
    exit 1
fi

# 5. Compare the output and exit code
HAS_PROBLEM=0
diff -ZB "$TEMPDIR/test.out" "$TEMPDIR/test.ans" >&2
if [ $? -ne 0 ]; then
    echo "Error: Output mismatch." >&2
    print_temp_dir
    HAS_PROBLEM=1
fi
EXIT_CODE=$(grep 'exit code' "$TEMPDIR/ravel_output.txt" | awk '{print $3}')
if [ $EXIT_CODE -ne $EXPECTED_EXIT_CODE ]; then
    echo "Error: Exit code mismatch." >&2
    print_temp_dir
    HAS_PROBLEM=1
fi

if [ $HAS_PROBLEM -eq 0 ]; then
    print_green_msg "Passed"
    clean
    exit 0
else
    print_red_msg "Failed"
    print_temp_dir
    exit 1
fi
