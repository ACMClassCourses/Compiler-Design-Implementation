#!/bin/bash

# This script should be used in the directory 'testcases/sema'.
DIR=oj/data
make_input() {
    cp $1 $DIR/$2.in
}
make_output() {
    grep "Verdict:" $1 | awk '{print $2}' > $DIR/$2.out
}

mkdir -p $DIR
count=0

# Make input and output files
while read line; do
    (( count += 1 ))
    make_input $line $count
    make_output $line $count
done < judgelist.txt

cp oj/spj.cpp $DIR/spj.cpp

# Make config

# print_group <index> <total>
print_group() {
    echo "        {" >> $DIR/config.json
    echo "            \"GroupID\": $1," >> $DIR/config.json
    echo "            \"GroupName\": \"$1\",">> $DIR/config.json
    echo "            \"GroupScore\": 1," >> $DIR/config.json
    echo "            \"TestPoints\": [ $1 ]" >> $DIR/config.json
    if [ $1 -eq $2 ]; then
        echo "        }" >> $DIR/config.json
    else
        echo "        }," >> $DIR/config.json
    fi
}
print_detail() {
    echo "        {" >> $DIR/config.json
    echo "            \"ID\": $1," >> $DIR/config.json
    echo "            \"Dependency\": 0," >> $DIR/config.json
    echo "            \"TimeLimit\": 1000," >> $DIR/config.json
    echo "            \"MemoryLimit\": 536870912," >> $DIR/config.json
    echo "            \"DiskLimit\": -536870912," >> $DIR/config.json
    echo "            \"FileNumberLimit\": 10," >> $DIR/config.json
    echo "            \"ValgrindTestOn\": false" >> $DIR/config.json
    if [ $1 -eq $count ]; then
        echo "        }" >> $DIR/config.json
    else
        echo "        }," >> $DIR/config.json
    fi
}
echo "{" > $DIR/config.json
echo "    \"Groups\": [" >> $DIR/config.json
for (( i = 1; i <= $count; i++ )); do
    print_group $i $count
done
echo "    ]," >> $DIR/config.json
echo "    \"Details\": [" >> $DIR/config.json
for (( i = 1; i <= $count; i++ )); do
    print_detail $i
done
echo "    ]," >> $DIR/config.json
echo "    \"CompileTimeLimit\": 120000," >> $DIR/config.json
echo "    \"SPJ\": 1," >> $DIR/config.json
echo "    \"CompilerStage\": \"-fsyntax-only\"" >> $DIR/config.json
echo "}" >> $DIR/config.json
