# Markdown-Transformer-and-Uploader

一键将markdown文件转换为知乎编辑器、github支持模式，并上传至仓库。

它会自动的处理图片，行内公式，多行公式，以及对表格的部分支持。当图片过大时，您可以选择加上`--compress`选项，对超过大小阈值（这里约为500K）的图片进行自动压缩。如果您的md文件和其图片文件夹在Data文件夹下，您本地的图片会自动转换为github上的raw链接。
上传知乎后一切都是那么美好。

#### 新增功能
* `python zhihu-publisher.py --input=all`，一键push所有md格式文件，根据修改日期判断是否上传。

#### 未来功能（按重要性排序）

* latex行内公式显示，参照https://blog.csdn.net/dta0502/article/details/92642634?depth_1-utm_source=distribute.pc_relevant.none-task-blog-BlogCommendFromBaidu-1&utm_source=distribute.pc_relevant.none-task-blog-BlogCommendFromBaidu-1
* 整合目录生成模块，把[toc]转化成目录，支持页内跳转，参照https://blog.csdn.net/Erice_s/article/details/80190859
* 解决代码缩进问题
* 图床支持

#### 使用方法

1. 仿照本仓库建立一个类似的仓库，包括Data、Output文件夹与根目录下的`zhihu-publisher.py`，或者直接fork本仓库。

2. 打开`zhihu-publisher.py`文件，文件开头处`GITHUB_REPO_PREFIX = "https://raw.githubusercontent.com/huangrt01/Markdown-Transformer-and-Uploader/master/Data/"` 修改`huangrt01`为您自己的GitHub用户名，如果仓库名字有变化，也做出相应微调。

3. 假设文件名为`test.md`，并将其和同名图片文件夹放到`Data`目录下，接着打开terminal(Linux/MacOS)或Git Bash(Windows)(或其他任何支持Git命令的终端)，输入以下命令：

`python zhihu-publisher.py --input="./Data/test.md"`

4. 在`Output`目录下，可以看到`test.md`的文件，将它上传至知乎编辑器或者复制链接到网站即可。
