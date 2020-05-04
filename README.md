# Markdown-Transformer-and-Uploader

一键将markdown文件转换为知乎编辑器、github支持模式，并上传至仓库。

#### 原有功能
* 自动处理图片，上传至仓库，并在md文件内生存图片链接
* 图片过大时，可以加上`--compress`选项压缩，对超过阈值（约为500K）的图片进行自动压缩。

#### 新增功能
* `python zhihu-publisher.py --input=all`，一键push所有md格式文件；`--input=update`则根据修改日期判断是否上传。
* latex行内公式转化，利用知乎的公式编辑器，本仓库的原版本有bug，问题已解决。

#### 未来功能（按重要性排序）

* 整合目录生成模块，把[toc]转化成目录，支持页内跳转，参照https://blog.csdn.net/Erice_s/article/details/80190859
* 图床支持，希望能生成两份md文件，一份用github图床，另一份用网络上其它图床。
* 针对知乎这样不支持多级列表嵌套的网站做优化

#### 使用方法

1. 仿照本仓库建立类似的库，包括Notes、Notes/Output文件夹与根目录下的`zhihu-publisher.py`，或者直接fork本仓库。

2. 打开`zhihu-publisher.py`文件，文件开头处`GITHUB_REPO_PREFIX = "https://raw.githubusercontent.com/huangrt01/Markdown-Transformer-and-Uploader/master/Notes/"` 将`huangrt01`修改为您的GitHub用户名，如果仓库名字有变化，也做相应微调。

3. 设文件名为`test.md`，将其和同名图片文件夹放到`Notes`目录下，接着打开终端输入命令，有以下用法

  * `python zhihu-publisher.py --input="./Notes/test.md"`，commit特定文件
  * `python zhihu-publisher.py --input=all"`，转化并commit全部文件
  * `python zhihu-publisher.py --input=update"`，转化并commit近期更新文件
  * `python zhihu-publisher.py --input=XXX, --only_generate`，只转化不commit文件

4. 在`Notes/Output`目录下，可以看到新的`test.md`的文件，上传至知乎编辑器或者复制链接到网站。

