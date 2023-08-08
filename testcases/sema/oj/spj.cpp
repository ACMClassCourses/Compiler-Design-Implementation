#include <iostream>
#include <cstdio>
#include <string>

std::string read(FILE *f) {
    std::string s;
    char buffer[128];
    if (f == nullptr) {
        exit(1);
    }
    while (fgets(buffer, 128, f) != nullptr) {
        s += buffer;
    }
    while (!s.empty() && (s.back() == '\n' || s.back() == '\r')) {
        s.pop_back();
    }
    return s;
}

int main(int argc, char *argv[]) {
    FILE *input = fopen(argv[1], "r"); // 题目的输入文件
    FILE *output = fopen(argv[2], "r"); // 用户输出
    FILE *answer = fopen(argv[3], "r"); // 题目的答案
    FILE *score = fopen(argv[4], "w"); // 把评测的分数输出到这里
    FILE *message = fopen(argv[5], "w"); // 这里输出错误/提示信息

    bool compileError = read(output) == "runtime_error";
    bool ans = read(answer) == "Fail";
    if (compileError) {
        if (ans) {
            fprintf(score, "%.2lf", 1.0);
            fprintf(message, "Passed");
        } else {
            fprintf(score, "%.2lf", 0.0);
            fprintf(message, "The program is valid, but your compiler exits with non-zero code.");
        }
    } else {
        if (ans) {
            fprintf(score, "%.2lf", 0.0);
            fprintf(message, "The program is not valid, but your compiler exits with zero code.");
        } else {
            fprintf(score, "%.2lf", 1.0);
            fprintf(message, "Passed");
        }
    }
}
