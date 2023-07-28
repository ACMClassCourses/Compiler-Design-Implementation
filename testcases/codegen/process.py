import os
import base64
base_path = '/Users/peterzheng/Documents/Projects/OldProject/Compiler/Compiler-2020-testcases/codegen'

str_list = []
file_list = open(os.path.join(base_path, 'judgelist.txt')).readlines()
file_list = [i.strip() for i in file_list]
for idx, rd in enumerate(file_list):
    r = open(os.path.join(base_path, rd)).readlines()
    begin_idx = r.index('/*\n')
    end_idx = r.index('*/\n')
    code_part = ''.join(r[end_idx+1:])
    meta_part = r[begin_idx+1: end_idx]
    input = meta_part.index('=== input ===\n'), meta_part.index('=== end ===\n')
    input_part = meta_part[input[0] + 1: input[1]]
    output_part = meta_part[input[1]+1:]
    output = output_part.index('=== output ===\n'), output_part.index('=== end ===\n')
    output_part = ''.join(output_part[output[0]+1:output[1]])[:-1]
    meta_part = [i if ':' in i else '1:1' for i in meta_part]
    meta_part = [i.split(':') for i in meta_part]
    meta_part_dict = {i[0].strip():i[1].strip() for i in meta_part}
    send_src = base64.b64encode(code_part.encode()).decode()
    send_input_ctx = base64.b64encode(''.join(input_part).encode()).decode()
    if len(send_input_ctx) == 0:
        send_input_ctx = '<nil>'
    send_output_ctx = base64.b64encode(''.join(output_part).encode()).decode()
    if len(send_output_ctx) == 0:
        send_output_ctx = '<nil>'
    send_exit_code = meta_part_dict['ExitCode']
    send_mem_limit = 512
    send_time_limit = 2147483647
    send_list = ['cgItx{}'.format(idx), send_src, send_input_ctx, send_output_ctx, send_exit_code, 1, send_time_limit, send_time_limit, send_mem_limit, rd[2:]]
    send_list = [str(i) for i in send_list]
    str_canadiate = ','.join(send_list)
    str_list.append(str_canadiate)
    print('Idx: {}'.format(idx), end='\r')
open('data.csv', 'w').write('\n'.join(str_list))