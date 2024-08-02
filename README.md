# Compiler Design and Implementation Course

## 目录

<!-- TOC -->

- [目录](#目录)
- [一、项目概述](#一项目概述)
    - [1. About the course](#1-about-the-course)
    - [2. Grading Policy](#2-grading-policy)
    - [3. 禁止行为](#3-禁止行为)
    - [4. 其他说明](#4-其他说明)
- [二、Mx* 语言定义](#二mx-语言定义)
    - [I. 部分术语定义](#i-部分术语定义)
    - [II. 基本结构](#ii-基本结构)
    - [III. 语法规则](#iii-语法规则)
        - [1. 字符集合](#1-字符集合)
        - [2. 关键字](#2-关键字)
        - [3. 空白符](#3-空白符)
        - [4. 注释](#4-注释)
        - [5. 标识符](#5-标识符)
        - [6. 常量](#6-常量)
            - [6.1. 逻辑常量](#61-逻辑常量)
            - [6.2. 整数常量](#62-整数常量)
            - [6.3. 字符串常量](#63-字符串常量)
            - [6.4. 空值常量](#64-空值常量)
            - [6.5. 数组常量](#65-数组常量)
        - [7. 变量](#7-变量)
            - [7.1. 基础类型](#71-基础类型)
            - [7.2. 数组类型](#72-数组类型)
                - [7.3.1. 基础定义](#731-基础定义)
                - [7.3.2. 创建](#732-创建)
                - [7.3.3. 内建方法](#733-内建方法)
                - [7.3.4. 多维数组](#734-多维数组)
        - [8. 类](#8-类)
            - [8.1. 类成员变量](#81-类成员变量)
            - [8.2. 类方法](#82-类方法)
            - [8.3. 访问类成员](#83-访问类成员)
            - [8.4. 类构造函数](#84-类构造函数)
            - [8.6. 其他未定义行为](#86-其他未定义行为)
        - [9. 函数](#9-函数)
            - [9.1. 函数定义](#91-函数定义)
            - [9.2. 内建函数](#92-内建函数)
            - [9.3. 函数返回值](#93-函数返回值)
            - [9.4. 函数入参](#94-函数入参)
        - [10. 表达式](#10-表达式)
            - [10.1. 基础表达式](#101-基础表达式)
            - [10.2. 算数表达式](#102-算数表达式)
                - [10.2.1. 单目运算表达式](#1021-单目运算表达式)
                - [10.2.2. 双目运算表达式](#1022-双目运算表达式)
                - [10.2.3. 三目运算表达式](#1023-三目运算表达式)
            - [10.3. 赋值表达式](#103-赋值表达式)
            - [10.4. 格式化字符串](#104-格式化字符串)
        - [11. 语句](#11-语句)
            - [11.1. 变量声明语句](#111-变量声明语句)
            - [11.2. 条件语句](#112-条件语句)
            - [11.3. 循环语句](#113-循环语句)
            - [11.4. 跳转语句](#114-跳转语句)
            - [11.5. 表达式语句](#115-表达式语句)
        - [12. 字符串](#12-字符串)
            - [12.1. 字符串对象](#121-字符串对象)
            - [12.2. 双目运算](#122-双目运算)
            - [12.3. 内建方法](#123-内建方法)
        - [13. 作用域](#13-作用域)
- [三、编译说明](#三编译说明)
    - [1. 程序输入输出](#1-程序输入输出)
    - [2. 评测指标和基准线的划分](#2-评测指标和基准线的划分)
    - [3. 本地测试](#3-本地测试)
        - [3.1. 测试 Semantic](#31-测试-semantic)
            - [3.1.1. 单点 Semantic 测试](#311-单点-semantic-测试)
            - [3.1.2. 全部 Semantic 测试](#312-全部-semantic-测试)
            - [3.1.3. 本地测试例子](#313-本地测试例子)
        - [3.2. 测试 LLVM IR](#32-测试-llvm-ir)
            - [3.2.1. 单点 LLVM IR 测试](#321-单点-llvm-ir-测试)
            - [3.2.2. 全部 LLVM IR 测试](#322-全部-llvm-ir-测试)
            - [3.2.3. 本地测试例子](#323-本地测试例子)
        - [3.3. 测试汇编](#33-测试汇编)
            - [3.3.1. 单点汇编测试](#331-单点汇编测试)
            - [3.3.2. 全部汇编测试](#332-全部汇编测试)
            - [3.3.3. 本地测试例子](#333-本地测试例子)
- [四、FAQ](#四faq)
- [Document Note](#document-note)

<!-- /TOC -->

## 一、项目概述

### 1. About the course

编译器设计是 ACM 班的传统课程，这门课程旨在锻炼大家的编程能力和工程能力。往年的课程都是进行天梯制度赋分，由于大家都写累了好的数据点就贡献的越来越少了，往后逐渐变成了面向数据编程，于是从 2018 级开始回归到更为重要的编译本身。因此，我们修正了原有语言中描述不清晰的部分，按照 Standard C++ 和 Java 的语言定义方式给出一个定义，并且按照两个语言的标准编译测试集合制定出一个属于我们的语言的标准测试集合。欢迎大家提出修改意见和建议。

总体上本项目分为 3 个阶段分别评测：语义检查（Semantic Check），代码生成（Codegen / Code Generation），代码优化（Optimization）。

### 2. Grading Policy

以该学期大助教发布内容为准。

### 3. 禁止行为

> 做出以下行为的学生，本课程总成绩将直接作 0 分处理

1. **对数据点的特判**
  - 界定：判断数据点具有什么样的特征后输出
  - 排除：对 AST、IR 等结构分析后对具有特定结构的程序进行优化的过程

2. **抄袭**
  - 界定：无法通过 Code Review 或与其他学生代码相似程度过高
  - 此项无例外排除项

3. **调用第三方库**
  - 界定：你的代码不应该调用第三方库用于任何阶段，例如生成 LLVM IR 后直接调用 Clang 等工具完成 Codegen 等工作是违规的
  - 排除：Parser 部分可以使用第三方库，例如 ANTLR 等；自己实现了生成工具除外

### 4. 其他说明

1. **关于服务器**：服务器可能有漏洞，如果可以提供对服务器封堵漏洞的好的建议是十分欢迎的。在不通知负责助教的情况下，任何对服务器的破坏性行为会导致请喝茶以及支付由此产生的额外服务器维护费用。

2. **关于本文档**：本文档参照 ISO/IEC 14882:2017 Programming Language C++ 以及往年的 Manual 做出修改。如果对数据或文档有疑问或者认为数据或文档存在错误的，请发起 Issue。如果发现有可修复的错误可以直接发起 Pull Requests，十分感谢！

3. **关于测试脚本**：testcase 目录的 sema 和 codegen 下分别有 semantic 和 codegen 的测试脚本。使用方法参见[本地测试部分](#3-本地测试)。

## 二、Mx* 语言定义

### I. 部分术语定义

1. **未定义行为**：指规范并没有定义该情况发生时语言的表现。初衷是为了给同学们提供一些自己发挥的空间，在测试数据里，这些没有定义的情况是不会发生的。可以认为未定义行为是类似于运行时会错误的东西，由于在编译阶段无法确定，因此我们就保证我们的代码不会出现

> **示例**：对长度超过 1M 的代码的编译是未定义的
>
> **说明**：我们的测试集合中不会出现长度超过 1M 的代码

2. **语法错误**：指代码违反规范的行为，你的编译器应返回非 0 返回值作为编译错误指示信息（必须实现，作为评测标准之一）以及你的提示信息（可选实现，评测不涉及）

3. **源代码**：你的编译器即将编译的 Mx* 代码

### II. 基本结构

1. 一份标准的 Mx* 语言代码包含有以下部分：

  - 大于等于 1 个函数定义
  - 类定义（可选）
  - 全局变量声明（可选）

2. 函数定义中有且仅有 1 个函数的名字可以为 `main`，`main` 函数的定义仅可为 `int main()`。不符合此定义的 `main` 函数或者 `main` 函数缺失均视为语法错误

3. Mx* 语言无函数接口定义，所有的函数定义必须有对应的函数体。函数体缺失视为语法错误

4. 编译 1MB 大小以上的代码是未定义行为

### III. 语法规则

#### 1. 字符集合

Mx* 语言对大小写敏感，合法字符集合如下：

- **标识符**（包括变量标识符、函数标识符、类对象标识符）：26 个小写英语字母，26 个大写英语字母，数码 `0` 到 `9`，下划线 `_`

- **标准运算符**：加号 `+`，减号 `-`，乘号 `*`，除号 `/`，取模 `%`

- **关系运算符**：大于 `>`，小于 `<`，大于等于 `>=`，小于等于 `<=`，不等于 `!=`，等于`==`

- **逻辑运算符**：逻辑与 `&&`，逻辑或 `||`，逻辑取反 `!`

- **位运算符**：算术右移 `>>`，算术左移  `<<`，按位与 `&`，按位或 `|`，按位异或 `^`，按位取反 `~`

- **赋值运算符**：赋值 `=`

- **自增运算符**：自增 `++`，自减 `--`

- **分量运算符**：对象 `.`

- **下标运算符**：取下标对象 `[]`

- **优先级运算符**：括号 `()`

- **三目运算符**： `?` `:`

- **分隔符**：分号 `;`，逗号 `,`，括号 `{}`

- **特殊符号**：空格 ` `，换行符 `\n`，制表符 `\t`，注释标识符 `//`，`/*`，`*/`，字符串标识符 `"`

不包括在以上符号集合内的符号出现在源代码中（除字符串常量和注释外）视为语法错误。

字符串常量的字符集定义见 [6.3. 字符串常量](#63-字符串常量) 。

#### 2. 关键字

Mx* 语言共有 13 个关键字：

`void`, `bool`, `int`, `string`,
`new`, `class`,
`null`, `true`, `false`, `this`,
`if`, `else`, `for`, `while`, `break`, `continue`, `return`

#### 3. 空白符

空白符、制表符、换行符在 Mx* 语言中除区分词素（Token）以外没有作用

#### 4. 注释

行注释：从 `//` 到这一行末尾的所有内容（包括 `//`）都会被作为注释。

块注释：从 `/*` 到后文中最近的下一个 `*/` 之间的所有内容（包括 `/*` 和 `*/`）都会被作为注释。

编译的时候应当自动注释忽略。

#### 5. 标识符

标识符的第一个字符必须为英语字母，第二个字符开始可以是英语字母、数字或者下划线。

标识符区分大小写并且长度超过 64 个字符的标识符是未定义的。

#### 6. 常量

**注：没有在以下定义的常量都是未定义的。**

##### 6.1. 逻辑常量

定义 `true` 为真，`false` 为假。

##### 6.2. 整数常量

整数常量以十进制表示，整数常量不设负数，负数可以由正数取负号得到。

编译器至少应该能处理大小范围在 $[-2^{31}, 2^{31})$ 内的整数，首位为 0 的整数常量是未定义的（整数 0 除外），大小超过上述范围的整数是未定义的。

##### 6.3. 字符串常量

字符串常量是由双引号括起来的字符串。

字符串长度最小为 0 ，长度超过 255 的字符串是未定义的。

字符串中的所有字符必须是可示字符（Printable character），空格或者转义字符中的一种。

转义字符有三种：`\n` 表示换行符，`\\` 表示反斜杠，`\"` 表示双引号。

其余出现在 C++ 语言中的转义字符是未定义的。

有关格式化字符串的内容请参考 [10.4. 格式化字符串](#104-格式化字符串)。

##### 6.4. 空值常量

定义 `null` 为引用类型的不指向任何对象的值。

##### 6.5 数组常量

Mx* 语言的数组常量用法接近Java语言。

数组常量为用 `{` `}` 包裹，相邻元素间用 `,` 分割的一列元素。元素类型可为任意常量。

以下为一个合法的二维数组常量
```java
{
	{2,0,2,4},
	{},
	{7,8}
};
```

数组常量可被用于数组赋值。
```java
// 创建数组时赋初值
int[] array = {2, 0, 2, 4}

// 创建数组，并用new赋初值
int[] array = new int[]{2, 0, 2, 4}
// 效果同下
int[] array;
array= new int[]{2, 0, 2, 4};
```

#### 7. 变量

##### 7.1. 基础类型

1. `bool` 类型：`true`（真）或 `false`（假）

2. `int` 类型：大小范围在 $[-2^{31}, 2^{31})$ 内的整数

3. `void` 类型：表明函数没有返回值的特殊类型，仅用于函数返回值类型

4. `string` 类型：字符串为引用类型，可以改变引用对象，但是字符串的值无法改变（immutable）

任何形式的类型转换（隐式类型转换，强制类型转换）在本语言中是未定义的。

##### 7.2. 数组类型

> 7.2. 部分的 `<typename>` 指的是类型，可以是基础类型（除 `void` 外）也可以是类。`<identifier>` 指的是变量标识符

> Mx* 语言的数组与 C++ 语言有较大区别，较接近 Java 语言的数组

###### 7.3.1. 基础定义

数组是一种可以动态创建的引用类型，长度无需在声明的时候确定。

一维数组声明语句的语法格式为 `<typename>[] <identifier>(=<initializationExpression>);`。

> 例如：`bool[] flag;` 是一句合法声明语句

通过下标访问一维数组元素的语法格式为 `<identifier>[index]`。

> 注意：数组声明后对应变量值为 `null`，此时访问数组下标是未定义的

**数组类型的对象支持引用赋值**，定义该行为同 Java 语言中的数组引用赋值。

> 引用赋值可以理解为 C++ 中直接对数组指针进行赋值

###### 7.3.2. 创建

创建数组可以用关键字 `new` 创建。

创建数组的表达式的语法格式为 `new <typename>[arraySize]...;`。

> 例如：`bool[] flag = new bool[10];` 是一种合法的创建方式

创建数组需指定数组的长度 `arraySize`，类型为整形。数组长度一定小于 $2^{31}-1$。

创建数组时可使用数组常量赋初值，有以下两种合法方式

```java
int[] array = {2, 0, 2, 4}
int[] array = new int[]{2, 0, 2, 4}
```

###### 7.3.3. 内建方法

`<identifier>.size()` 返回数组的长度，函数返回值为 `int`。调用值为 `null` 的数组对象的该方法是未定义行为。

###### 7.3.4. 多维数组

Mx* 语言采用交错数组（Jagged Array）以达到多维数组的效果，声明方法和 Java 语言保持一致。

> 通俗而言就是 “数组的数组”，可以理解为 C++ 语言中 `vector` 套 `vector` 的效果

声明交错数组的语句语法要求为 `<typename>[]... <identifier>(=<initial sentence>);`

> 例如：声明一个 2 维数组的语句可以是：`int[][] graph;`

创建交错数组的语法为：`new <typename>[arraySize]...[]...;`

> 创建交叉数组的行为需要从外层至内层逐层创建数组空间。
>
> 例如：声明创建一个 2 维数组的语句可以是：
>
> ```java
> int[][] graph = new int[3][];
> graph[0] = null; // Valid
> graph[1] = new int[10];
> graph[2] = new int[30];
> ```

交叉数组的声明创建也可以同时指定多层数组长度。

> 例如声明创建一个大小为 3×4 的 2 维数组的语句可以是：`int[][] graph = new int[3][4];`
> 
> 该语句等价于：
> 
> ```java
> int[][] graph = new int[3][];
> graph[0] = new int[4];
> graph[1] = new int[4];
> graph[2] = new int[4];
> ```

#### 8. 类

> Mx* 语言的类类似于 C++ 语言

我们的语言需要面向对象，类的定义的方式如下：

```java
class <classIdentifier> {
   // 类成员变量
   <type1> <memberIdentifier1>;
   <type2> <memberIdentifier2>, <memberIdentifier3>...;
   // 类构造函数
   <ClassIdentifier>(){ // If there is no explicit constructor, class has inexplicit default constructor.
      <expressionsAndStatements>
   }
   // 类方法
   <returnType> <functionIdentifier>(<functionParameterList>){
      <expressionsAndStatements>
   }
};
```

##### 8.1. 类成员变量

所有的类成员变量的行为同 C++ 中 `public` 成员变量。

访问未赋初值的类成员变量是未定义行为。

##### 8.2. 类方法

对于类方法，语法格式同 [9. 函数](#9-函数)（除构造函数外）。

类方法中可以访问 `this` 指针，其指向被调用该方法的对象。

不在类作用域内访问 `this` 指针视为语法错误，`this` 指针作为左值视为语法错误。

> 示例：
> 
> 语法正确的代码片段
> ```java
> class foo {
>     int a;
>     int b;
>     int c;
>     foo test(){ return this; }
> };
> ```
> 
> 语法错误的代码片段
> ```java
> class foo {
>     int a;
>     int b;
>     int c;
> };
> foo test(){ return this; }
> ```

##### 8.3. 访问类成员

对于类成员不论是方法还是变量，都可以用对象标识符 `.` 获取对象。

对于类成员变量：访问除 `string` 外的基本类型 `int`, `bool` 的成员变量返回一个实值；访问其他类型成员变量返回引用。语法为：`<classObjectIdentifier>.<classMember>;`

对于类方法：调用语法为：`<classObjectIdentifier>.<classMethod>(<functionParameterList>);`

##### 8.4. 类构造函数

构造函数的定义和 C++ 相同，无返回值无参数，语法如下：

```java
<ClassIdentifier>(){
	<Expressions and Statements>
}
```

构造函数可以省略，无显式构造函数的类有默认构造函数，默认构造函数无任何行为。

带参数的构造函数是未定义语法。

##### 8.6. 其他未定义行为

析构函数、虚函数、类的继承、接口、权限标示、抽象类、成员的默认初始化表达式、函数重载。

#### 9. 函数

##### 9.1. 函数定义

函数定义语法如下：

```java
<returnType> <functionIdentifier>(<functionParameterList>){
	<expressionsAndStatements>
}
```

> 注意：在 Mx* 语言中不支持声明函数的签名，也不支持在一个函数内嵌套申明另一个子函数或类

##### 9.2. 内建函数

以下内建函数不需要定义或声明就直接可以使用：

- 函数：`void print(string str);`
  - 作用：向标准输出流中输出字符串 `str`

- 函数：`void println(string str);`
  - 作用：向标准输出流中输出字符串 `str`，并在字符串末输出一个换行符

- 函数：`void printInt(int n);`
  - 作用：向标准输出流中输出数字 `n`

- 函数：`void printlnInt(int n);`
  - 作用：向标准输出流中输出数字 `n`，并且在数字末输出一个换行符

- 函数：`string getString();`
  - 作用：从标准输入流中读取一行字符串并返回

- 函数：`int getInt();`
  - 作用：从标准输入流中读取一个整数，读到空格、回车符、制表符处停止，返回该整数

- 函数：`string toString(int i);`
  - 作用：把整数 `i` 转换为字符串并返回

##### 9.3. 函数返回值

如果函数声明的返回值类型非 `void`，应有 `return` 语句返回函数返回值，返回值缺失为未定义行为。

**例外**：`main` 函数可以没有返回值，默认返回值为 `0`。

如果函数声明的返回值类型为 `void`，`return` 语句不能附带任何返回值，表示从此位置跳出函数。`void` 类型函数中若 `return` 语句有返回值，为语法错误。

在 Semantic Check 阶段，需要进行语法检查，检查返回类型非 `void` 的返回值的函数中每一个 `return` 语句的返回类型是否正确。

返回值可以是自定义类，可以是数组，可以是自定义类的数组。对于数组类型的返回值需要检查维数是否正确。

> 也就是 2 维数组不可以返回给 1 维数组。

但是数组长度相关问题无需检查，为未定义行为。

> 例如：以下的情况不会出现在测试点中：
> 
> ```c++
> int[] foo(int args){
>   return new int[args];
> }
> 
> int main(){
>   int[] vec = foo(10);
>   return vec[11]; // Out-of-range Exception.
> }
> ```

##### 9.4 函数入参

对于 `int` 和 `bool` 类型，函数参数采用**值传递**；对于其他类型，函数参数采用**引用传递**。

注意：对于除 `int` 和 `bool` 之外的类型，引用本身采用值传递。比如对于下面的例子：

```c++
class C { int i; };
void foo(C c) {
    c = new C();
    c.i = 1;
    printlnInt(c.i);
}
int main() {
    C c = new C();
    c.i = 2;
    foo(c);
    printlnInt(c.i);
}
```

其对应的 C++ 代码是

```c++
struct C { int i; };
void foo(C* c) {
    c = new C();
    c->i = 1;
    printlnInt(c->i);
}
int main() {
    C* c = new C();
    c->i = 2;
    foo(c);
    printlnInt(c->i);
}
```

其中 `foo` 执行的 `new` 不会影响到 `main` 函数中的 `c`，所以输出应当是
```
1
2
```

#### 10. 表达式

##### 10.1. 基础表达式

包括单独出现的常量，变量和 `this` 指针，函数调用，对象成员访问，数组访问，`new` 表达式。

##### 10.2. 算数表达式

语法与具体行为参考 C++。

###### 10.2.1 单目运算表达式

- 前缀 / 后缀自增 `++` / 自减 `--` 表达式

- 取非 `!` / 取反 `~` / 取负 `-` 表达式

###### 10.2.2 双目运算表达式

双目表达式的定义和 C++ 类似，对于含 `int` 和 `bool` 类型变量的表达式，要求表达式两边的对象类型必须一致。而表达式两边的值可以是常量或变量。

双目运算表达式支持的运算符为 [1. 字符集合](#1-字符集合) 部分标准运算符，关系运算符，逻辑运算符，位运算符。

`bool` 类型仅可做 `==`、`!=`、`&&` 以及 `||` 运算。

数组对象仅可以和数组以及常量 `null` 进行 `==` 和 `!=` 运算。

类对象的 `==` 和 `!=` 运算为比较内存地址，其它运算符重载是未定义的。

字符串的双目运算符参阅字符串部分定义。

###### 10.2.3. 三目运算表达式

三目运算表达式的定义和 C++ 类似，为 `a ? b : c`。

要求 `a` 为 `bool` 类型且计算过程需要支持**短路求值**，`b` 与 `c` 的类型一致（`b` 与 `c`可以是表达式）。

表达式的返回值类型为 `b` 与 `c` 的类型。

##### 10.3. 赋值表达式

语法参考 C++。

由以下方法给出的对象可作为左值被赋值：

1. 函数的形参变量
2. 全局变量和局部变量
3. 类的一个成员
4. 数组对象的一个元素

以下为非法左值，视为语法错误：

1. `this` 指针作为左值视为语法错误
2. 常量作为左值视为语法错误

以上定义未涉及的左值是未定义的。

使用赋值表达式的值是未定义的。（欢迎实现类似 C++ 连续赋值的语法）

##### 10.4. 格式化字符串

语法参考 Python (>=3.12)。在字符串前加上 `f` 并将表达式写成 `$ expression $` 来在字符串中包含 `Mx*` 表达式的值。其中表达式的类型仅包括字符串、整数、 `bool` 类型。 `bool` 类型应该表示为 `true` 或 `false` ，表达式的类型若不为上述三类应视为语法错误。同时，格式化字符串应该支持嵌套。

例如:

```python
f"the value of x + y is $x + y$"
f"the value of x + y is $f"$x + y$"$"
```

在格式化字符串中，字符集合不包括 `$` ，而是用 `$$` 代替，这条规则不会对 [6.3. 字符串常量](#63-字符串常量) 造成影响。即:

```python
f"$f"$$$$" == "$$"$" == "true"
```

#### 11. 语句

##### 11.1. 变量声明语句

此处的变量声明不包括类成员变量声明，类成员变量相关请参阅类的定义。

变量声明语句语法如下，支持同时声明多个变量和初始值：

`<type> <variableIdentifier1>( = <initializationExpression1>), <variableIdentifier2>( = <initializationExpression2>), ...;`

变量在使用之前应已被赋值，访问未初始化赋值的变量是未定义行为。

对于自定义类的对象声明如果没有使用初始化表达式进行赋值，默认值为 `null`，访问未赋初值的对象（值为 `null`，保证相关测试仅出现在 Semantic 阶段）。

> 示例：
> 
> ```c++
> class A{
>   int a;
> };
> 
> A a;         // 此时 a 为 null，视为语法正确
> int t = a.a; // 语法正确
> ```

实例化对象的语法为：`<type> <VariableIdentifier> = new <Type>();` 或 `<Type> <VariableIdentifier> = new <Type>;`，圆括号可以省略。


##### 11.2. 条件语句

条件语句语法如下：

```c++
if (<conditionExpression>) {
	<Expressions and Statements if true>
} else {
	<Expressions and Statements if false>
}
```

其中 `<conditionExpression>` 表达式值必须为 `bool` 类型，且该表达式不能缺失，否则为语法错误。

`if` 语句可以没有 `else` 部分。若大括号中仅有一个 Expression 或 Statement，则可以省略大括号。

> 示例:
> 
> ```c++
> if (condition) <Expression and Statement if true>
> ```

##### 11.3. 循环语句

`while` 循环语句语法如下：

```c++
while (<whileConditionExpression>) {
	<Expressions and Statements if true>
}
```

`<whileConditionExpression>` 表达式值必须为 `bool` 类型，且该表达式不能缺省，否则为语法错误。

`for` 循环语句语法如下：

```c++
for (<initializationStatement>; <forConditionExpression>; <stepExpression>) {
	<Expressions and Statements if true>
}
```

`<initializationStatement>`，`<forConditionExpression>`，`<stepExpression>` 均可缺省。

`<forConditionExpression>` 表达式若存在，则值必须为 `bool` 类型，否则为语法错误。

循环语句若大括号中仅有一个 Expression 或 Statement，则可以省略大括号。

> 示例：
> 
> ```c++
> while (condition) <Expression and Statement if true>
> for (init; condition; step) <Expressions and Statements if true>
> ``````

##### 11.4. 跳转语句

包括 `return`，`break`，`continue` 三种语句，语法如下：

```c++
return (<expression>);
break;
continue;
```

`return` 语句仅在函数中有效，不在函数中的 `return` 语句为语法错误。

`break` 和 `continue` 语句仅在循环中有效，不在循环中的 `break` 和 `continue` 语句为语法错误。

##### 11.5. 表达式语句

表达式语句直接由一个表达式加 `;` 组成，此时返回值被丢弃。

> 形如以下的语句都是合法的：`++a; (a); (++a); a + a;`

#### 12. 字符串

##### 12.1. 字符串对象

将字符串对象赋值为 `null` 是语法错误。

##### 12.2. 双目运算

- `+` 表示字符串拼接

- `==`，`!=` 比较两个字符串内容是否完全一致（不是内存地址）

- `<`，`>`，`<=`，`>=` 用于比较字典序大小

字符串参与其他双目运算为语法错误，且字符串仅可与相同类型对象进行运算。

##### 12.3. 内建方法

- 函数：`int length();`
  - 使用方式：`<StringIdentifier>.length();`
  - 作用：返回字符串的长度。

- 函数：`string substring(int left, int right);`
  - 使用方式：`<StringIdentifier>.substring(left, right);`
  - 作用：返回下标为`[left, right)`的子串。

- 函数：`int parseInt();`
  - 使用方式：`<StringIdentifier>.parseInt();`
  - 作用：返回一个整数，这个整数应该是该字符串的最长前缀。如果该字符串没有一个前缀是整数，结果未定义。如果该整数超界，结果也未定义。

- 函数：`int ord(int pos);`
  - 使用方式：`<StringIdentifier>.ord(pos);`
  - 作用：返回字符串中的第pos位上的字符的ASCII码。下标从0开始编号。

常量字符串不具有内建方法，调用常量字符串的内建方法为未定义行为。

#### 13. 作用域

1. 在一段语句中，由 `{` 和 `}` 组成的块会引进一个新的作用域
2. 用户定义函数入口会引入一个新的作用域
3. 用户定义类的入口会引入一个新的作用域，该作用域里声明的所有成员，作用域为整个类
4. 全局变量和局部变量不支持前向引用，作用域为声明开始的位置直到最近的一个块的结束位置
5. 函数和类的声明都应该在顶层，作用域为全局，支持前向引用（Forward Reference）
6. 不同作用域的时候，内层作用域可以遮蔽外层作用域的名字
7. 函数名和变量名不允许重复，类名和函数名不允许重复，但是变量名和类名可以重复

**注意**：诸如 `for` 等表达式没有大括号也会引入一个新的作用域，如下：

```C++
int a = 0; 
for(;;) int a = 0;
```

## 三、编译说明

### 1. 程序输入输出

**编译要求：**

目标汇编：RISC-V **32bit, Integer Extended**

gcc构筑命令：`./configure --prefix=/opt/riscv --with-arch=rv32ima --with-abi=ilp32`

**基本的运行阶段：**

1. 生成你的编译器 / Build your compiler: 使用系统编译器编译你的编译器代码构建你的编译器的过程。
2. 编译目标代码 / Compile target code: 使用构建的编译器编译 Mx* 语言，如果编译正确输出目标汇编代码，反之编译器应当以非0返回值退出。
3. 执行目标代码 / Execute target code: 使用模拟器运行你的代码的过程。（模拟器地址： <https://github.com/Engineev/ravel>）

关于模拟器 ravel，如果你不想每次都输入 `export PATH="/usr/local/opt/bin:$PATH"`，你需要将其放到对应 shell 的配置文件，如 bash 用户请放到 `.bashrc` 中，zsh 用户请放到 `.zshrc` 中。

### 2. 评测指标和基准线的划分

**评测指标**：时间、准确性

1. 时间：采用模拟器运行，计算准确的周期数作为程序运行时间。对于同一个 Commit 不会重复评测。
2. 准确性：给定输入的情况下，评测输出和程序返回值是否和标准相同。评测输出**不会去除行末空格换行符，也不会去除文末换行符**

### 3. 本地测试

*注：本地测试结果仅供参考，具体结果请以线上评测结果为准。*

#### 3.1 测试 Semantic

基本要求：Semantic 测试中，你的编译器需要对标准输入流的 Mx* 代码进行语法检查，如果语法正确则返回 0，否则返回非 0。

##### 3.1.1 单点 Semantic 测试

你可以执行以下命令来对单个测试点进行测试：

```sh
path/to/test.bash <your_compiler_and_args> <testcase>
```

- `path/to/test.bash` 是本 repo 中的 `testcases/sema/scripts/test.bash` 脚本的路径；
- `<your_compiler_and_args>` 是你的编译器的执行命令；
- `<testcase>` 是测试样例的路径。


##### 3.1.2 全部 Semantic 测试

你可以执行以下命令来对全部测试点进行测试：（此测试中，有一部分信息将会隐去，因此如果遇到问题，建议用单个测试点重新测试）

```sh
path/to/test_all.bash <your_compiler_and_args> <testcase_dir>
```

- `path/to/test_all.bash` 是本 repo 中的 `testcases/sema/scripts/test_all.bash` 脚本的路径；
- `<your_compiler_and_args>` 是你的编译器的执行命令；
- `<testcase_dir>` 是测试样例的路径（对应本 repo 中的 `testcases/sema/` 目录）。

##### 3.1.3 本地测试例子

假设:
1. 你使用 Java 编写程序，源代码位于 `src/` 目录下，
2. 你的编译器在 `-fsyntax-only` 参数下可以检查标准输入流的语法，
3. 测试样例位于 `testcase/` 目录下，
4. 你的主类是 `Compiler`，（如不是，请将下文的 `Compiler` 替换为你的主类名）
5. 你的编译器的 jar 包位于 `/usr/share/java/antlr-4.13.0-complete.jar`，（如不是，请替换为你的 jar 包路径）

则你需要先行编译你的编译器：

```sh
find src -name '*.java' | xargs javac -d bin -cp /usr/share/java/antlr-4.13.0-complete.jar
```

你可以使用以下命令测试程序 `testcases/sema/array-package/array-1.mx`：

```sh
testcases/sema/scripts/test.bash 'java -cp /usr/share/java/antlr-runtime-4.13.0.jar:bin Compiler -fsyntax-only' testcases/sema/array-package/array-1.mx
```

你可以使用以下命令测试 `testcases/sema/` 目录下的所有测试点：

```sh
testcases/sema/scripts/test_all.bash 'java -cp /usr/share/java/antlr-runtime-4.13.0.jar:bin Compiler -fsyntax-only' testcases/sema/
```

#### 3.2 测试 LLVM IR

*虽然我们不强制要求使用 LLVM IR 作为中间语言，但是我们提供了 LLVM IR 的测试脚本，供同学们参考。*

基本要求：LLVM IR 测试中，你的编译器需要将 Mx* 代码编译为 LLVM IR，你需要在特定的参数下将编译器的标准输入流转化为 LLVM IR，并输出到标准输出流中。
然后测试脚本会将你生成的 LLVM IR 代码用 `clang -S --target=riscv32-unknown-elf` 参数编译为 RISC-V 汇编代码，然后使用 `ravel` 运行你的代码。
生成的汇编连带你的内建汇编（也会由 `clang` 编译）运行后的输出与返回值需要和测试点要求的一致。

**请务必确保 `ravel` 命令存在并且是本作业要求的模拟器平台。**

##### 3.2.1 单点 LLVM IR 测试

你可以执行以下命令来对单个测试点进行测试：

```sh
path/to/test_llvm_ir.bash <your_compiler_and_args> <testcase> [builtin] [temp_dir]
```

- `path/to/test_llvm_ir.bash` 是本 repo 中的 `testcases/codegen/scripts/test.bash` 脚本的路径；
- `<your_compiler_and_args>` 是你的编译器的执行命令；
- `<testcase>` 是测试样例的路径；
- `[builtin]` 是你的编译器的内建函数的路径，此参数可省略；
- `[temp_dir]` 是临时文件夹的路径，用于存放生成的临时文件，此参数可省略，但如果没有省略此参数，请务必保证该目录存在；
- 如果除了脚本外有三个参数，则脚本将会检查第三个参数是否为文件，如果是，则认为其为 `[builtin]`，否则认为是 `[tempdir]`。

##### 3.2.2 全部 LLVM IR 测试

你可以执行以下命令来对全部测试点进行测试：（此测试中，有一部分信息将会隐去，因此如果遇到问题，建议用单个测试点重新测试）

```sh
path/to/test_llvm_ir_all.bash <your_compiler_and_args> <testcase_dir> [builtin]
```

- `path/to/test_llvm_ir_all.bash` 是本 repo 中的 `testcases/codegen/scripts/test_all.bash` 脚本的路径；
- `<your_compiler_and_args>` 是你的编译器的执行命令；
- `<testcase_dir>` 是测试样例的路径（对应本 repo 中的 `testcases/codegen/` 目录）；
- `[builtin]` 是你的编译器的内建 LLVM IR 函数的路径，此参数可省略。

##### 3.2.3 本地测试例子

假设:
1. 你使用 Java 编写程序，源代码位于 `src/` 目录下，
2. 你的编译器在 `-emit-llvm` 参数下可以将标准输入流转化为 LLVM IR，
3. 测试样例位于 `testcase/` 目录下，
4. 你的主类是 `Compiler`，（如不是，请将下文的 `Compiler` 替换为你的主类名）
5. 你的编译器的 jar 包位于 `/usr/share/java/antlr-4.13.0-complete.jar`，（如不是，请替换为你的 jar 包路径）
6. 你的内建函数代码为 `bin/builtin.ll`，（如不是，请替换为你的内建函数路径；如没有，请在后文中忽略所有出现的 `bin/builtin.ll`）

则你需要先行编译你的编译器：

```sh
find src -name '*.java' | xargs javac -d bin -cp /usr/share/java/antlr-4.13.0-complete.jar
```

你可以使用以下命令测试程序 `testcases/codegen/t1.mx`：

```sh
testcases/codegen/scripts/test.bash 'java -cp /usr/share/java/antlr-runtime-4.13.0.jar:bin Compiler -emit-llvm' testcases/codegen/t1.mx bin/builtin.ll
```

你可以使用以下命令测试 `testcases/codegen/` 目录下的所有测试点：

```sh
testcases/codegen/scripts/test_all.bash 'java -cp /usr/share/java/antlr-runtime-4.13.0.jar:bin Compiler -emit-llvm' testcases/codegen/ bin/builtin.ll
```

#### 3.3 测试汇编

基本要求：汇编测试中，你的编译器需要将 Mx* 代码编译为汇编代码，你需要在特定的参数下将编译器的标准输入流转化为汇编代码，并输出到标准输出流中。
你的汇编连同你的内建汇编（也会由 `clang` 编译）将会使用 `ravel` 运行，运行后的输出与返回值需要和测试点要求的一致。

##### 3.3.1 单点汇编测试

你可以执行以下命令来对单个测试点进行测试：

```sh
path/to/test_asm.bash <your_compiler_and_args> <testcase> [builtin] [temp_dir]
```

- `path/to/test_asm.bash` 是本 repo 中的 `testcases/codegen/scripts/test.bash` 脚本的路径；
- `<your_compiler_and_args>` 是你的编译器的执行命令；
- `<testcase>` 是测试样例的路径；
- `[builtin]` 是你的编译器的内建函数的路径，此参数可省略；
- `[temp_dir]` 是临时文件夹的路径，用于存放生成的临时文件，此参数可省略，但如果没有省略此参数，请务必保证该目录存在；
- 如果除了脚本外有三个参数，则脚本将会检查第三个参数是否为文件，如果是，则认为其为 `[builtin]`，否则认为是 `[tempdir]`。

##### 3.3.2 全部汇编测试

你可以执行以下命令来对全部测试点进行测试：（此测试中，有一部分信息将会隐去，因此如果遇到问题，建议用单个测试点重新测试）

```sh
path/to/test_asm_all.bash <your_compiler_and_args> <testcase_dir> [builtin]
```

- `path/to/test_asm_all.bash` 是本 repo 中的 `testcases/codegen/scripts/test_all.bash` 脚本的路径；
- `<your_compiler_and_args>` 是你的编译器的执行命令；
- `<testcase_dir>` 是测试样例的路径（对应本 repo 中的 `testcases/codegen/` 目录）；
- `[builtin]` 是你的编译器的内建汇编函数的路径，此参数可省略。

##### 3.3.3 本地测试例子

假设:
1. 你使用 Java 编写程序，源代码位于 `src/` 目录下，
2. 你的编译器在 `-S` 参数下可以将标准输入流转化为汇编代码，
3. 测试样例位于 `testcase/` 目录下，
4. 你的主类是 `Compiler`，（如不是，请将下文的 `Compiler` 替换为你的主类名）
5. 你的编译器的 jar 包位于 `/usr/share/java/antlr-4.13.0-complete.jar`，（如不是，请替换为你的 jar 包路径）
6. 你的内建函数代码为 `bin/builtin.s`，（如不是，请替换为你的内建函数路径；如没有，请在后文中忽略所有出现的 `bin/builtin.s`）

则你需要先行编译你的编译器：

```sh
find src -name '*.java' | xargs javac -d bin -cp /usr/share/java/antlr-4.13.0-complete.jar
```

你可以使用以下命令测试程序 `testcases/codegen/t1.mx`：

```sh
testcases/codegen/scripts/test.bash 'java -cp /usr/share/java/antlr-runtime-4.13.0.jar:bin Compiler -S' testcases/codegen/t1.mx bin/builtin.s
```

你可以使用以下命令测试 `testcases/codegen/` 目录下的所有测试点：

```sh
testcases/codegen/scripts/test_all.bash 'java -cp /usr/share/java/antlr-runtime-4.13.0.jar:bin Compiler -S' testcases/codegen/ bin/builtin.s
```

## 四、FAQ

有任何问题请在这个 Repo 直接发起 Issue，对语言规则有疑问的使用 Question 标签，发现编译器评测的 bug 的使用 Bug 标签，对测试集的问题/发现测试集重的 bug 的使用 benchmark and data/benchmark-URGENT 标签。

## Document Note

全文共三个文章内跳转链接，修改标题名时可能导致链接失效：
III.1. / III.8.2 / III.10.2.2
