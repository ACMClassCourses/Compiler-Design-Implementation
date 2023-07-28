#!/usr/bin/python

# examples
# //#include filename
# //#include filename TYPE:int
# //#input test.in
# //#output test.ans
# //#dump ...

import argparse
import os
import sys


def include(line: str, kv=None):
    if kv is None:
        kv = {}
    args = line.split()
    args.pop(0)  # pop //#include
    filename = args[0].strip()
    kvs = [arg.strip().split(sep=":") for arg in args[1:]]
    for k, v in kvs:
        kv[k] = v

    directory, _ = os.path.split(filename)
    cwd = os.getcwd()
    if directory:
        os.chdir(directory)
    with open(filename, "r") as f:
        for line in f.readlines():
            for old, new in kv.items():
                line = line.replace(old, new)
            if line.startswith("//#include"):
                include(line, kv=kv.copy())
                continue
            print(line, end="")
    os.chdir(cwd)


def input_or_output(line: str):
    assert line.startswith("//#input") or line.startswith("//#output")
    filename = line.split()[1]
    is_input = line.startswith("//#input")
    print("Input:" if is_input else "Output:")
    print("=== " + line.split()[0][3:] + " ===")
    with open(filename) as f:
        print(f.read())
    print("=== end ===")


def dump(line: str):
    assert line.startswith("//#dump")
    print(line[len("//#dump"):].strip())


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("input_file")
    args = parser.parse_args()
    directory, filename = os.path.split(args.input_file)
    os.chdir(directory)

    with open(filename) as f:
        for line in f.readlines():
            if not line.startswith("//#"):
                print(line, end="")
                continue
            if line.startswith("//#include"):
                include(line)
                continue
            if line.startswith("//#input") or line.startswith("//#output"):
                input_or_output(line)
                continue
            if line.startswith("//#dump"):
                dump(line)
                continue
            print("ignoring " + line, file=sys.stderr)
            continue


if __name__ == '__main__':
    main()
