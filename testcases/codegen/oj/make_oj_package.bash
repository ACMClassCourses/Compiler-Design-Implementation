#!/bin/bash

# This script should be used in the directory 'testcases/sema'.
DIR=oj/data
make_input() {
    cp $1 $DIR/$2.in
}
make_output() {
    sed -n '/=== input ===/,/=== end ===/p' $1> $DIR/$2.out
    sed -n '/=== output ===/,/=== end ===/p' $1 >> $DIR/$2.out
    grep "ExitCode:" $1 >> $DIR/$2.out
}

mkdir -p $DIR
count=0

# Make input and output files
while read line; do
    (( count += 1 ))
    make_input $line $count
    make_output $line $count
done < judgelist.txt

cp oj/spj_bin $DIR/spj_bin

# Make config

# print_group <index> <total> <name>
print_group() {
    echo "        {" >> $DIR/config.json
    echo "            \"GroupID\": $1," >> $DIR/config.json
    echo "            \"GroupName\": \"$3\",">> $DIR/config.json
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
    echo "            \"TimeLimit\": 10000," >> $DIR/config.json
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
total=$count
count=0
while read line; do
    (( count += 1 ))
    print_group $count $total $line
done < judgelist.txt
echo "    ]," >> $DIR/config.json
echo "    \"Details\": [" >> $DIR/config.json
for (( i = 1; i <= $count; i++ )); do
    print_detail $i
done
echo "    ]," >> $DIR/config.json
echo "    \"CompileTimeLimit\": 120000," >> $DIR/config.json
echo "    \"SPJ\": 1," >> $DIR/config.json
echo "    \"CompilerStage\": \"-S\"" >> $DIR/config.json
echo "}" >> $DIR/config.json
