#!/bin/bash

# Usage: scripts/test.bash <compiler> <testcase> <builtin> [tempdir]
# Example:
#     scripts/test.bash 'bin/mxc -emit-llvm' testcases/codegen/t1.mx bin/builtin.ll
# The script will
# 1. Get an temporary directory
# 2. Execute <compiler> < <testcase> > "$TEMPDIR/output.ll"
# 3. Get the test.in and test.ans from <testcase> using sed
# 4. Execute clang -S --target=riscv32-unknown-elf
# 5. Execute ravel --input-file="$TEMPDIR/test.in" --output-file="$TEMPDIR/test.out" "$TEMPDIR/builtin.s" "$TEMPDIR/output.s" > "$TEMPDIR/ravel_output.txt"

# Get the llc
# LLVM makes a breaking change starting from LLVM 15, making opaque pointers
# the default. We need to use the newer version of llc to compile the builtin
# functions.
# If you are using an old version of llc, you may need to change the following
# code to use the correct version of llc. For example, if you are using LLVM 14,
# you need to comment or delete the following lines in get_llc() and replace
# them with 'echo llc-14'.
# For maintainers: please update the following code when a new version of LLVM
# is released.
get_clang() {
    (which clang-15 > /dev/null 2> /dev/null && echo clang-15) || \
    (which clang-16 > /dev/null 2> /dev/null && echo clang-16) || \
    (which clang-17 > /dev/null 2> /dev/null && echo clang-17) || \
    (which clang-18 > /dev/null 2> /dev/null && echo clang-18) || \
    (which clang > /dev/null 2> /dev/null && echo clang)
}
CLANG=$(get_clang)

# Usage
if [ $# -ne 3 ] && [ $# -ne 4 ]; then
    cat << EOF >&2 
Usage: $0 <complier> <testcase> <builtin> [tempdir]
       If you need to pass arguments to the compiler, please use
       quotation mark(') to pack the arguments along with the compiler
       command. For example,
       $0 'bin/mxc -a -b -c' testcases/codegen/t1.mx bin/builtin.ll
EOF
    exit 1
fi


if [ ! -f $2 ]; then
    echo "Error: testcase file $2 does not exist." >&2
    exit 1
fi
if [ ! -f $3 ]; then
    echo "Error: builtin file $3 does not exist." >&2
    exit 1
fi
source $(dirname $0)/utils.bash

test_bin ravel

# 1. Make temp directory
if [ $# -eq 4 ]; then
    TEMPDIR=$4
    USER_DEFINED_TEMPDIR=1
else
    TEMPDIR="$(mktemp -d -p /tmp mxc.XXXXXXXXXX)"
    USER_DEFINED_TEMPDIR=0
    if [ $? -ne 0 ]; then
        echo "Error: Failed to create temp directory." >&2
        exit 1
    fi
fi

clean() {
    if [ $USER_DEFINED_TEMPDIR -eq 0 ]; then
        rm -rf "$TEMPDIR"
    fi
}

print_temp_dir() {
    cat << EOF >&2
All generated files are at '$TEMPDIR'. You may check some files there.
For example, you may check the output of your compiler at '$TEMPDIR/output.ll'.
Use the following command to clean up the temp directory:
    rm -rf '$TEMPDIR'
EOF
}

# 2. Compile the testcase
echo "Compiling '$2' with your compiler..." >&2
$1 < $2 > "$TEMPDIR/output.ll"
if [ $? -ne 0 ]; then
    echo "Error: Failed to compile $2." >&2
    clean
    exit 1
fi

# 3. Get the test.in and test.ans from <testcase> using sed
sed -n '/=== input ===/,/=== end ===/{//!p}' $2 > "$TEMPDIR/test.in"
if [ $? -ne 0 ]; then
    echo "Error: Failed to get input from $2." >&2
    clean
    exit 1
fi
sed -n '/=== output ===/,/=== end ===/{//!p}' $2 > "$TEMPDIR/test.ans"
if [ $? -ne 0 ]; then
    echo "Error: Failed to get output from $2." >&2
    clean
    exit 1
fi
EXPECTED_EXIT_CODE=$(grep "ExitCode:" $2 | awk '{print $2}')

# 4. Execute the code with clang
echo "Compling your output '$TEMPDIR/output.ll' with clang..." >&2
$CLANG -S --target=riscv32-unknown-elf "$TEMPDIR/output.ll" -o "$TEMPDIR/output.s.source" >&2
if [ $? -ne 0 ]; then
    echo "Error: Failed to compile '$TEMPDIR/output.ll'." >&2
    print_temp_dir
    exit 1
fi
echo "Compling your builtin '$3' with clang..." >&2
$CLANG -S --target=riscv32-unknown-elf "$3" -o "$TEMPDIR/builtin.s.source" >&2
if [ $? -ne 0 ]; then
    echo "Error: Failed to compile '$TEMPDIR/builtin.ll'." >&2
    print_temp_dir
    exit 1
fi
# remove the '@plt' suffix of the function name that is not supported by ravel
remove_plt() {
    sed 's/@plt$//g' $1 > $2
}
remove_plt "$TEMPDIR/output.s.source" "$TEMPDIR/output.s"
remove_plt "$TEMPDIR/builtin.s.source" "$TEMPDIR/builtin.s"

# 5. Execute the code
echo "Executing the code..." >&2
ravel --input-file="$TEMPDIR/test.in" --output-file="$TEMPDIR/test.out" "$TEMPDIR/builtin.s" "$TEMPDIR/output.s" > "$TEMPDIR/ravel_output.txt"
if [ $? -ne 0 ]; then
    cat << EOF >&2
Error: Ravel exits with a non-zero value.
You may run the following command again to see the error message:
    ravel --input-file='$TEMPDIR/test.in' --output-file='$TEMPDIR/test.out' '$TEMPDIR/builtin.s' '$TEMPDIR/output.s'
EOF
    print_temp_dir
    exit 1
fi

HAS_PROBLEM=0
diff -ZB "$TEMPDIR/test.out" "$TEMPDIR/test.ans" >&2
if [ $? -ne 0 ]; then
    echo "Error: Output mismatch." >&2
    print_temp_dir
    HAS_PROBLEM=1
fi
EXIT_CODE=$(grep 'exit code' "$TEMPDIR/ravel_output.txt" | sed 's/exit code: //')
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
