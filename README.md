# 概述
vim_setting 提供了一套 Vim 配置和插件的整合方案。希望以最精简的配置，最少的插件依赖，提供一套快速部署 Vim 工作环境，优化 Vim 使用体验。

目前，Vim_setting 提供了以下功能:

1. 插件管理(Vundle)
2. 自动格式化代码(vim-autoformat)
3. tag列表(tagbar)
4. 目录显示(nerdtree)
5. markdown语法高亮(vim-markdown)
6. 执行外部命令(asyncrun)
7. 状态栏显示优化
8. html 单行手动快速注释
9. 手动多行缩进
10. html保存时自动格式化
11. 自动补全成对字符
12. 英译汉翻译

# 安装教程
1. 参考 [vundle](https://github.com/VundleVim/Vundle.vim) 的部署，正确安装插件管理器
2. 如果用户目录下不存在 `.vimrc`(windows下为 `_vimcr`),则新建该文件
3. 在 `.vimrc`(`_vimrc`) 下新建引入项目中的 `vimrc.vim`
4. 进入 Vim, 执行插件管理启动命令`PluginInstall`, 安装插件

# 使用说明
1. 该配置默认使用 `,` 作为快捷键前缀
2. 英译汉需要 vim 支持 python，使用 `echo has(python)` 来查看你的 Vim 是否支持 python. 英译汉插件使用 `python 2.7` 编写，需要系统安装 python.

# 待办事项
- [ ] 实现Vim在线聊天，聊天室，支持团队分析代码段 
- [ ] 预览markdown，开启express服务，但是请求时，如果文件名是中文，会出现乱码。
