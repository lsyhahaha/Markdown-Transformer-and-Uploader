### Git
* Git的理念
  * distributed version control system (DVCS) 
  *  The  Platonic  ideal  is  that  each  commit should compile and should move steadily towards more and more tests passing. 
* [git handbook](https://guides.github.com/introduction/git-handbook/)
* [resources to learn Git](https://try.github.io/)

* git clone --depth=1：clone速度慢的时候可以试试只clone最后一次commit
* [如何fork一个私库](https://stackoverflow.com/questions/10065526/github-how-to-make-a-fork-of-public-repository-private)
* `git push origin lab1:lab1`

#### 和Github联动
* [用SSH连GitHub](https://help.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh)
```shell
ssh-keygen -t rsa -b 4096 -C "huangrt01@163.com"
eval "$(ssh-agent -s)"
ssh-add -K ~/.ssh/id_rsa
pbcopy < ~/.ssh/id_rsa.pub  #适合MacOS , Linux用xclip
# 上github添加SSH Key

ssh -T git@github.com

ssh-keygen -y -f ~/.ssh/id_rsa
```
* 如果设置ssh key后，git push仍然要求输入邮箱密码
  * `git remote -v`查看origin使用的是https还是ssh
  * 如果是https，替换成ssh即可 `git remote set-url origin git@github.com:huangrt01/XXX.git`

#### 其它
* [tig](https://jonas.github.io/tig/doc/manual.html)：图形化git历史
  * 先安装[ncurses](https://blog.csdn.net/weixin_40123831/article/details/82490687)
  * [使用指南](https://www.jianshu.com/p/d9f60c0abbf7)
