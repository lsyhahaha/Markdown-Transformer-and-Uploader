## Debugging and Profiling

[MIT 6.NULL - Debugging and Profiling](https://missing.csail.mit.edu/2020/debugging-profiling/)

### Debugging

#### Printf Debugging and Logging
脑力劳动debug，借助打印信息思考和推断问题所在

信息除了Printf，还可以Logging，更灵活（可以输出到文件、sockets、remote servers），并且可复用

[Here](https://missing.csail.mit.edu/static/files/logger.py) is an example code that logs messages:

```shell
$ python logger.py
# Raw output as with just prints
python logger.py log
# Log formatted output
$ python logger.py log ERROR
# Print only ERROR levels and above
$ python logger.py color
# Color formatted output
```
利用颜色信息： [ANSI escape codes](https://en.wikipedia.org/wiki/ANSI_escape_code)

```shell
#!/usr/bin/env bash
for R in $(seq 0 20 255); do
    for G in $(seq 0 20 255); do
        for B in $(seq 0 20 255); do
            printf "\e[38;2;${R};${G};${B}m█\e[0m";
        done
    done
done
```

#### Third party logs

#### Debuggers


* [CS107 GDB and Debugging教程](https://web.stanford.edu/class/archive/cs/cs107/cs107.1202/resources/gdb)
* [CS107 Software Testing Strategies](https://web.stanford.edu/class/archive/cs/cs107/cs107.1202/testing.html)
* [lldb的使用](https://www.jianshu.com/p/9a71329d5c4d)
  *  breakpoint set -n main, run, print, next
* [macOS上配置VSCode的gdb调试环境](https://zhuanlan.zhihu.com/p/106935263?utm_source=wechat_session)  

**内存泄露问题**

* `valgrind`
* `gdb`

### Profiling