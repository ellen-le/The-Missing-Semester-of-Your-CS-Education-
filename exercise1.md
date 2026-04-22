# Missing Semester L1 Shell exercise

## Exercise
### 1.可运行 echo $SHELL；若输出类似 /bin/bash 或 /usr/bin/zsh 
![项目截图](images\L1_1.png)

### 2.ls -l有什么作用？第一列的十个字母对应的意思？ls -l /又有什么用和区别

```ellen@Ellen:~/xv6-workspace$ ls -l
total 2036
-rwxrwxrwx 1 ellen ellen    1174 Mar 24 22:16 LICENSE
···
ellen@Ellen:~/xv6-workspace$ ls -l /
total 2788
lrwxrwxrwx   1 root root       7 Apr 22  2024 bin -> usr/bin
···
```
第一列:  
1 character indiacates the type of file : d : directory - : ordinary file l : link   
2-4characters : user's permission r:read w:write x:execute  
5-7 : Group's permission   
8-10 : Others' permission  
第二列:  
硬链接数  
- 知识补充:硬链接指得是同文件不同路径，使用ln来增加硬链接数（ln : link files）硬链接的作用是允许一个文件拥有多个有效路径名，这样用户就可以硬链接到重要文件，以防止“误删除”  
所以为什么可以防止误删除？因为对应该目录的索引节点有一个以上的连接，只删除一个连接并不影响索引节点本身和其他的连接，只有当最后一个连接被删除后，文件的数据块及目录的连接才会被释放，也就是说，文件真正删除的条件是与之相关的硬连接文件均被删除  
- user group other : 小组是在大型的任务中，分配给小组使用。  

### 3.在命令 `find ~/Downloads -type f -name "*.zip" -mtime +30` 中，`*.zip` 是一个 「glob」。什么是 glob ？新建一个测试目录并创建一些文件，试试 ls *.txt 、ls file?.txt 、ls {a,b,c}.txt 等模式。

glob是什么?  
glob是一种文件匹配模式，全程global，其实就是搜索你想要的文件的一种名称，匹配匹配其实就是match  
什么是文件模式匹配（Pattern Matching）: 文件操作和脚本编程的核心功能，主要用于文件名匹配、路径搜索和字符串处理
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

什么是文件模式匹配（Pattern Matching）: 文件操作和脚本编程的核心功能，主要用于文件名匹配、路径搜索和字符串处理