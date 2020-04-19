# Markdown-Transformer-and-Uploader

一键将markdown文件转换为知乎编辑器、github支持模式，并上传至仓库。

它会自动的处理图片，行内公式，多行公式，以及对表格的部分支持。当图片过大时，您可以选择加上`--compress`选项，对超过大小阈值（这里约为500K）的图片进行自动压缩。如果您的md文件和其图片文件夹在Data文件夹下，您本地的图片会自动转换为github上的raw链接。
上传知乎后一切都是那么美好。

#### 新增功能
* `python zhihu-publisher.py --input=all`，一键push所有md格式文件；`--input=update`则根据修改日期判断是否上传。
* latex行内公式转化，利用知乎的公式编辑器，fork下来的原版本有bug，不可用，需要修改转义字符

#### 未来功能（按重要性排序）

* 整合目录生成模块，把[toc]转化成目录，支持页内跳转，参照https://blog.csdn.net/Erice_s/article/details/80190859
* 图床支持

#### 使用方法

1. 仿照本仓库建立一个类似的仓库，包括Data、Data/Output文件夹与根目录下的`zhihu-publisher.py`，或者直接fork本仓库。

2. 打开`zhihu-publisher.py`文件，文件开头处`GITHUB_REPO_PREFIX = "https://raw.githubusercontent.com/huangrt01/Markdown-Transformer-and-Uploader/master/Data/"` 将`huangrt01`修改为您的GitHub用户名，如果仓库名字有变化，也做相应微调。

3. 设文件名为`test.md`，将其和同名图片文件夹放到`Data`目录下，接着打开终端输入命令，有以下用法

  * `python zhihu-publisher.py --input="./Data/test.md"`，commit特定文件
  * `python zhihu-publisher.py --input=all"`，转化并commit全部文件
  * `python zhihu-publisher.py --input=update"`，转化并commit近期更新文件
  * `python zhihu-publisher.py --input=XXX, --only_generate`，只转化不commit文件

4. 在`Data/Output`目录下，可以看到新的`test.md`的文件，上传至知乎编辑器或者复制链接到网站。

