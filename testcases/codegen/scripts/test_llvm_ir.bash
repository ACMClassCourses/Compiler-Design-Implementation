#!/bin/bash

# Usage: scripts/test_llvm_ir.bash <compiler> <testcase> [builtin] [tempdir]
# The builtin and tempdir are optional. If there are three arguments, the
# script will check whether the third argument is a file. If it is a file,
# then it will be treated as the builtin file. Otherwise, it will be treated
# as the tempdir.
# Example:
#     scripts/test.bash 'bin/mxc -emit-llvm' testcases/codegen/t1.mx bin/builtin.ll
# The script will
# 1. Get an temporary directory
# 2. Execute <compiler> < <testcase> > "$TEMPDIR/output.ll"
# 3. Get the test.in and test.ans from <testcase> using sed
# 4. Execute clang -S --target=riscv32-unknown-elf
# 5. Execute ravel --input-file="$TEMPDIR/test.in" --output-file="$TEMPDIR/test.out" "$TEMPDIR/builtin.s" "$TEMPDIR/output.s" > "$TEMPDIR/ravel_output.txt"
# 6. Compare the output and exit code

# NOTE: You should have ravel installed in your system.

# Get the clang
# LLVM makes a breaking change starting from LLVM 15, making opaque pointers
# the default. We need to use the newer version of llc to compile the builtin
# functions.
# If you are using an old version of llc, you may need to change the following
# code to use the correct version of llc. For example, if you are using LLVM 14,
# you need to comment or delete the following lines in get_clang() and replace
# them with 'echo llc-14'.
# For maintainers: please update the following code when a new version of LLVM
# is released.
get_clang() {
    (which clang-15 > /dev/null 2> /dev/null && echo clang-15) || \
    (which clang-16 > /dev/null 2> /dev/null && echo clang-16) || \
    (which clang-17 > /dev/null 2> /dev/null && echo clang-17) || \
    (which clang-18 > /dev/null 2> /dev/null && echo clang-18) || \
    (which clang > /dev/null 2> /dev/null && echo clang) || \
    (echo "clang not found" >&2 && exit 1)
}
CLANG=$(get_clang)

# Usage
if [ $# -ne 3 ] && [ $# -ne 4 ]; then
    cat << EOF >&2 
Usage: $0 <compiler> <testcase> [builtin] [tempdir]
       The builtin and tempdir are optional. If there are three arguments, the
       script will check whether the third argument is a file. If it is a file,
       then it will be treated as the builtin file. Otherwise, it will be
       treated as the tempdir.
       If you need to pass arguments to the compiler, please use
       quotation mark(') to pack the arguments along with the compiler
       command. For example,
       $0 'bin/mxc -a -b -c' testcases/codegen/t1.mx bin/builtin.ll
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
For example, you may check the output of your compiler at '$TEMPDIR/output.ll'.
Use the following command to clean up the temp directory:
    rm -rf '$TEMPDIR'
EOF
}

# 2. Compile the testcase with your compiler
echo "Compiling '$TESTCASE' with your compiler..." >&2
$COMPILER < $TESTCASE > "$TEMPDIR/output.ll"
if [ $? -ne 0 ]; then
    echo "Error: Failed to compile $TESTCASE." >&2
    clean
    exit 1
fi

# 3. Get the test.in and test.ans from <testcase> using sed
sed -n '/=== input ===/,/=== end ===/{//!p}' $TESTCASE > "$TEMPDIR/test.in"
if [ $? -ne 0 ]; then
    echo "Error: Failed to get input from $TESTCASE." >&2
    clean
    exit 1
fi
sed -n '/=== output ===/,/=== end ===/{//!p}' $TESTCASE > "$TEMPDIR/test.ans"
if [ $? -ne 0 ]; then
    echo "Error: Failed to get output from $TESTCASE." >&2
    clean
    exit 1
fi
EXPECTED_EXIT_CODE=$(grep "ExitCode:" $TESTCASE | awk '{print $2}')

# 4. Compile the LLVM IR code with clang into RISC-V assembly
echo "Compiling your output '$TEMPDIR/output.ll' with clang..." >&2
$CLANG -S --target=riscv32-unknown-elf "$TEMPDIR/output.ll" -o "$TEMPDIR/output.s.source" >&2
if [ $? -ne 0 ]; then
    echo "Error: Failed to compile '$TEMPDIR/output.ll'." >&2
    print_temp_dir
    exit 1
fi
if [ $HAS_BUILTIN -eq 1 ]; then
    echo "Compiling your builtin '$BUILTIN' with clang..." >&2
    $CLANG -S --target=riscv32-unknown-elf "$BUILTIN" -o "$TEMPDIR/builtin.s.source" >&2
    if [ $? -ne 0 ]; then
        echo "Error: Failed to compile '$TEMPDIR/builtin.ll'." >&2
        print_temp_dir
        exit 1
    fi
fi
# remove the '@plt' suffix of the function name that is not supported by ravel
remove_plt() {
    sed 's/@plt\s*([#;].*)?$//g' $1 > $2
}
remove_plt "$TEMPDIR/output.s.source" "$TEMPDIR/output.s"
if [ $HAS_BUILTIN -eq 1 ]; then
    remove_plt "$TEMPDIR/builtin.s.source" "$TEMPDIR/builtin.s"
fi

# 5. Execute the code
echo "Executing the code..." >&2
if [ $HAS_BUILTIN -eq 1 ]; then
    ravel --input-file="$TEMPDIR/test.in" --output-file="$TEMPDIR/test.out" "$TEMPDIR/builtin.s" "$TEMPDIR/output.s" > "$TEMPDIR/ravel_output.txt"
    RAVEL_EXIT_CODE=$?
else
    ravel --input-file="$TEMPDIR/test.in" --output-file="$TEMPDIR/test.out" "$TEMPDIR/output.s" > "$TEMPDIR/ravel_output.txt"
    RAVEL_EXIT_CODE=$?
fi
if [ $RAVEL_EXIT_CODE -ne 0 ]; then
    if [ $HAS_BUILTIN -eq 1 ]; then
        cat << EOF >&2
Error: Ravel exits with a non-zero value $RAVEL_EXIT_CODE.
You may run the following command again to see the error message:
    ravel --input-file='$TEMPDIR/test.in' --output-file='$TEMPDIR/test.out' '$TEMPDIR/builtin.s' '$TEMPDIR/output.s'
EOF
    else
        cat << EOF >&2
Error: Ravel exits with a non-zero value $RAVEL_EXIT_CODE.
You may run the following command again to see the error message:
    ravel --input-file='$TEMPDIR/test.in' --output-file='$TEMPDIR/test.out' '$TEMPDIR/output.s'
EOF
    fi
    print_temp_dir
    exit 1
fi

# 6. Compare the output and exit code
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
