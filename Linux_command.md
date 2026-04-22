# Linux command

## ls

- `-l` : 输出一个长列表，[我在练习1中的解答](./exercise1.md)

## touch

## Pattern Matching
#### Glob 常用语法表   
| 符号 | 说明 |
| :--- | :--- |
| `*` | match除了斜杠(/)之外的所有字符。 |
| `**` | match零个或多个目录及子目录。 |
| `?` | match任意单个字符。(不能是null) |
| `[seq]` | match seq 中的其中一个字符。 |
|`[!seq]` | match不在seq中的任意一个人字符 |
| `/` | 转义符|
| `!` | 排除符|
| `?(pattern_list)` | match零个或一个在`pattern_list`中的字符  |
| `*(pattern_list)` | 匹配零个或多个在 `pattern_list` 中的字符串。 |
| `+(pattern_list)` | 匹配一个或多个在 `pattern_list` 中的字符串。 |
| `@(pattern_list)` | 匹配其中一个在 `pattern_list` 中的字符串。 |
| `!(pattern_list)` | 匹配不在 `pattern_list` 中的字符串。 |
| `[...]` | POSIX style character classes inside sequences. |
1. `[]` （其实对应的就是`[seq]`） 
    - match括号内列出的任意一个字符。例如：
        - `[abc]` 匹配 `a`、`b` 或 `c`。
        - `[a-z]` 匹配任意小写字母。
    - 特殊规则：
        - 连字符（`-`）在方括号内表示范围（如 `a-d` 等价于 `abcd`）。
        - 表示排除的字符需用 `!` 或 `^`，例如 `[!a-z]` 匹配非小写字母。
- 参考 [exercise1 中的 Glob 语法表](./exercise1.md#glob-常用语法表)  
2. 高级变量替换模式  
     shell支持通过参数替换对变量进行模式的匹配和截取
     - 右侧删除匹配的最短或最长模式%
     ```
     var=vunerability
     echo ${var%i*y} # %表示删除最短匹配"i*y"结果为"vunerabil"
     echo echo ${var%%v*y} # %%表示删除最短匹配"i*y"结果为"" 
     ```
     - 左侧删除匹配的最短或最长模式#
     ```
     var=vunerability
     echo ${var#?u} # %表示删除最短匹配"i*y"结果为"nerabil"
     echo ${var##*t} # %%表示删除最短匹配"i*y"结果为"y" 
     ```
     - tips:345对应的分别是#$%其实对应的也是左右
     - 