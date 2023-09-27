#!/bin/bash

# Usage: scripts/test.bash <compiler> <testcase>
# Example:
#     scripts/test.bash '../../mxc -fsyntax-only' ./array-package/array-1.mx

# Usage
if [ $# -ne 2 ]; then
    echo "Usage: $0 <complier> <testcase>" >&2
    exit 1
fi

COMPILER=$1
TESTCASE=$2

if [ ! -f "$TESTCASE" ]; then
    echo "Error: testcase file $TESTCASE does not exist" >&2
    exit 1
fi

# Get verdict
# VERDICT = 1 if PASS, 0 if FAIL
if [ "$(grep -c "Verdict:" "$TESTCASE")" -ne 1 ]; then
    echo "Error: Verdict line not found in '$TESTCASE'." >&2
    echo "Please make sure this is a valid testcase file." >&2
    exit 1
fi
VERDICT_STRING=$(grep "Verdict:" "$TESTCASE" | awk '{print $2}')
if [ "$VERDICT_STRING" == "Fail" ]; then
    VERDICT=0
else
    VERDICT=1
fi

# Run the compiler
pass() {
    echo "Passed" >&2
    exit 0
}
fail() {
    echo "Failed" >&2
    exit 1
}
$COMPILER < "$TESTCASE" > /dev/null
RETURN_CODE=$?
if [ $RETURN_CODE -ne 0 ]; then
    if [ $VERDICT -eq 0 ]; then
        pass
    else
        fail
    fi
else
    if [ $VERDICT -eq 0 ]; then
        fail
    else
        pass
    fi
fi
