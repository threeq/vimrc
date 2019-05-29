# vimrc
极简vim配置，打造VIM IDE。

# 使用

1. 现在库文件到~/.vim目录

```
git clone https://github.com/threeq/vimrc.git ~/.vim
```

2. 到~/.vim目录下面执行初始化脚本

```
./init.sh
```

3. 进入 vim 中安装插件（第一次使用）

```
:PlugInstall
```

> 加入新插件需要只需要执行第 3 步

## 依赖

node、npm、python、go语言

# 基本使用

## 剪切板

        vmap <Leader>y :w !pbcopy<CR><CR>
        nmap <Leader>y :.w !pbcopy<CR><CR>
        vmap <Leader>p :r !pbpaste<CR><CR>
        nmap <Leader>p :r !pbpaste<CR><CR>
