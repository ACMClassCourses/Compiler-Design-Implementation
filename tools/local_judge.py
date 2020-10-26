#!python3

import os, time


"""
    Modify following configurations to adapt to your environment.
"""
test_cases_dir = '../testcases/semantic/'
# test_cases_dir = '../testcases/codegen/'
# test_cases_dir = '../testcases/optim/'
compile_cmd = "bash ../build.bash"
execute_cmd = "bash ../semantic.bash"
excluded_test_cases = ["foo.mx"]
ravel_path = "ravel --enable-cache"
builtin_path = "./builtin/builtin.s"
halt_on_3_fails = False
calculate_score = False
test_codegen = False
# When test_codegen && use_llvm is true, the output should be a .ll file, and we will use llc to
# compile it into asm. You can test the correctness of your IR-gen with this.
use_llvm = False
llc_cmd = 'llc-10'



color_red = "\033[0;31m"
color_green = "\033[0;32m"
color_none = "\033[0m"

def collect_test_cases():
    test_cases = []
    for f in os.listdir(test_cases_dir):
        if os.path.splitext(f)[1] == '.mx':
            test_cases.append(f)
    for s in excluded_test_cases:
        if s in test_cases: test_cases.remove(s)
    test_cases.sort()
    return test_cases


def parse_test_case(test_case_path):
    with open(test_case_path, 'r') as f:
        lines = f.read().split('\n')
    src_start_idx = lines.index('*/', lines.index('/*')) + 1
    src_text = '\n'.join(lines[src_start_idx:])

    input_start_idx = lines.index('=== input ===') + 1
    input_end_idx = lines.index('=== end ===', input_start_idx)
    input_text = '\n'.join(lines[input_start_idx:input_end_idx])

    output_start_idx = lines.index('=== output ===') + 1
    output_end_idx = lines.index('=== end ===', output_start_idx)
    output_text = '\n'.join(lines[output_start_idx:output_end_idx])

    return src_text, input_text, output_text

if calculate_score:
    import pandas as pd
    import numpy as np
    df = pd.read_csv('./optim.csv', index_col=['name'], thousands=',')

def main():
    if os.system(compile_cmd):
        print(color_red + "Fail when building your compiler...")
        return
    test_cases = collect_test_cases()
    os.system('cp %s ./builtin.s' % builtin_path)
    total = 0
    passed = 0
    continue_fail = 0
    score = []
    max_len = max(len(i) for i in test_cases)
    for t in test_cases:
        if halt_on_3_fails and (continue_fail > 2):
            exit(1)
        total += 1
        src_text, input_text, output_text = parse_test_case(test_cases_dir + t)
        case_name = t[:-3]
        with open('test.mx', 'w') as f:
            f.write(src_text)
        with open('test.in', 'w') as f:
            f.write(input_text)
        with open('test.ans', 'w') as f:
            f.write(output_text)

        print(t + ':', end='')
        for i in range(len(t), max_len):
            print(end = ' ')
        start = time.time()
        if os.system('%s < ./test.mx > test.s' % execute_cmd):
            print(color_red + "Compilation failed" + color_none)
            continue_fail += 1
            continue
        print("(T=%.2fs)" % (time.time() - start), end=" ")
        if test_codegen:
            if use_llvm:
                os.system('mv ./test.s ./test.ll')
                os.system(llc_cmd + ' --march=riscv32 -mattr=+m -o test.s test.ll')

            if os.system('%s --oj-mode < test.in 1>ravel.out 2>/dev/null'
                         % ravel_path):
                print(color_red + "Runtime error" + color_none)
                continue
            if os.system('diff -B -b test.out test.ans > diff.out'):
                print(color_red + "Wrong answer" + color_none)
                continue
        passed += 1
        continue_fail = 0

        ravel_out = open("ravel.out")
        time_field = None
        while True:
            s = ravel_out.readline()
            if s.count("time") > 0:
                time_field = int(s[5:-1])
                break
        if calculate_score:
            x1 = df.loc['O1'][case_name] * 1.5
            x2 = df.loc['O1'][case_name]
            y1 = 1.0
            y2 = 4.0
            k = (y2 - y1) / (x2 - x1)
            sc = np.clip(k * (time_field - x1) + y1, 0, 5)
            score.append(sc)
        else:
            sc = -1
        print(color_green + "Accepted" + color_none + (" %10d [%.2f]" % (time_field, sc)))
        
    print("total {}, passed {}, ratio {}".format(total, passed, passed / total))
    if calculate_score:
        score = np.sort(np.array(score))
        print(np.mean(score[1:-1]) * 10)
        
if __name__ == '__main__':
    main()
