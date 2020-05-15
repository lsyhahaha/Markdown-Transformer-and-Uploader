### Linux

#### MIT 6.NULL课程
https://missing.csail.mit.edu/ ，介绍了如何利用工具提升效率

##### Lecture1. Course overview + the shell
* shell：空格分割输入，`~` is short for "home"
* environment variable: `echo $PATH`; `vim ~/.zshrc`
  * `$PATH`可以作为输入
* connecting programs：
  * <和>：rewire the input and output streams; >>可append
  * `cat < hello.txt > hello2.txt`
  * wire: `ls -l | tail -n1`，``
  * `curl --head --silent baidu.com | grep --ignore-case content-length | cut -f2 -d ' '`

* sudo: super user，linux系统可改/sys下面的sysfs

`echo 1 | sudo tee /sys/class/leds/input6::scrolllock/brightness`

* [shell中不同类型quotes的含义](https://www.gnu.org/software/bash/manual/html_node/Quoting.html)

##### Lecture2. Shell Tools and Scripting
shell scripting
* foo=bar, \$foo	注意等号前后不能有space，否则被当成参数
* 单引号和双引号的区别：同样套在\$foo上，前者是literal meaning，而" "会替换成变量值
* shell scripting也有if、case、while、for、function特性

```shell
mcd(){
	mkdir -p "$1"
	cd "$1"
}
```

* **special variables**
  * \$0 - Name of the script
  * \$1 to \$9 - Arguments to the script. $1 is the first argument and so on.
  * \$@ - All the arguments
  * \$# - Number of arguments
  * \$? - Return code of the previous command
  * \$\$ - Process Identification number for the current script
  * !! - Entire last command, including arguments. A common pattern is to execute a command only for it to fail due to missing permissions, then you can quickly execute it with sudo by doing sudo !!
  * \$_ - Last argument from the last command. If you are in an interactive shell, you can also quickly get this value by typing Esc followed by .

* ||和&& operator：机制和error code联系，true和false命令返回固定的error code
```shell
false || echo "Oops, fail"
# Oops, fail

true || echo "Will not be printed"
#

true && echo "Things went well"
# Things went well

false && echo "Will not be printed"
#

false ; echo "This will always run"
# This will always run

```

* command substitution: `for file in $(ls)`
* process substitution: 生成返回temporary file，`diff <(ls foo) <(ls bar)`

```shell
#!/bin/bash

echo "Starting program at $(date)" # Date will be substituted

echo "Running program $0 with $# arguments with pid $$"

for file in $@; do
    grep foobar $file > /dev/null 2> /dev/null
    # When pattern is not found, grep has exit status 1
    # We redirect STDOUT and STDERR to a null register since we do not care about them
    if [[ $? -ne 0 ]]; then
        echo "File $file does not have any foobar, adding one"
        echo "# foobar" >> "$file"
    fi
done

```
* 2>重定向stderr；引申：>&2，重定向到stderr
* -ne，更多的查看man test
* “test command”， \[\[和\[的区别：http://mywiki.wooledge.org/BashFAQ/031 ，[[是compound command，存在special parsing context，寻找reserved words or control operators 

**shell globbing 通配**
* wildcard通配符：?和* 	`ls *.sh`
* {}: `mv *{.py,.sh} folder`
* `touch {foo,bar}/{a..h}`

* 利用[shellcheck](https://github.com/koalaman/shellcheck)检查shell scripts的错误

#### zsh
[zsh的10个优点](https://blog.csdn.net/rapheler/article/details/51505003)

#### a
#### b
#### c
* cat
* cd
* chmod：sudo chmod 777 文件修改为可执行
* curl
  * -I/--head: 只显示传输文档，经常用于测试连接本身
`curl --head --silent baidu.com | grep --ignore-case content-length | cut -f2 -d ' '`
* cut
  * 使用 -f 选项提取指定字段：`cut -f2,3 test.txt`
* cp
#### d
* d: zsh的特点，可显示最近10个目录，然后`cd -数字`进入
* date：日期
* diff：[Linux中diff的渊源](https://www.cnblogs.com/moxiaopeng/articles/4853352.html)

#### e
* echo: 输出输入，空格分割

#### f
#### g
#### h
#### i
#### j
#### k
#### l
* ls
  * -l: long listing format; drwxr-xr-x，d代表文件夹，后面3*3代表owner、owning group、others的权限
  * r：read，w：modify，x：execute
#### m
* man: q退出
* mkdir
* mv
#### n
#### o 
#### p
* pwd: print cwd
#### q
#### r
#### s
#### t
* tail
  * `ls -l | tail -n1`
  * -f：不断读最新内容，实时监视
#### u
#### v
#### w
* which：找到程序路径
#### x
#### y
#### z