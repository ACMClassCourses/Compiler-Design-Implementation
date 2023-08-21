#!/bin/bash

# Usage: scripts/test.bash <compiler> <testcase>
# Example:
#     scripts/test.bash '../../mxc -fsyntax-only' ./array-package/array-1.mx

# Usage
if [ $# -ne 2 ]; then
    echo "Usage: $0 <complier> <testcase>" >&2
    exit 1
fi

if [ ! -f $2 ]; then
    echo "Error: testcase file $2 does not exist" >&2
    exit 1
fi

# Get verdict
# VERDICT = 1 if PASS, 0 if FAIL
if [ $(grep "Verdict:" $2 | wc -l) -ne 1 ]; then
    echo "Error: Verdict line not found in '$2'." >&2
    echo "Please make sure this is a valid testcase file." >&2
    exit 1
fi
VERDICT_STRING=$(grep "Verdict:" $2 | awk '{print $2}')
if [ $VERDICT_STRING == "Fail" ]; then
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
$1 < $2 > /dev/null
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
