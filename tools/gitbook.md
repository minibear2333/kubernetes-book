### gitbook

> Modern book format and toolchain using Git and Markdown

这是 gitbook 项目主页上对 gitbook 的定义。

gitbook 是一个软件，它使用 Git 和 Markdown 来编排书箱。

本书就是使用 gitbook 生成，你可以使用浏览器在本地来读这本书！

### install

[gitbook](https://github.com/GitbookIO/gitbook) 的安装非常简单，详细指南可以参考 [gitbook 文档](https://github.com/GitbookIO/gitbook)。

这里的安装只需要一步就能完成！(安装命令还是以[官方安装文档](https://github.com/GitbookIO/gitbook/blob/master/docs/setup.md)为准，这里的命令可能会过期。)

``` BASH
$ npm install gitbook-cli -g
```

需要注意的是：用户首先需要安装 nodejs，以便能够使用 npm 来安装 gitbook。

### gitbook server

书籍目录结构创建完成以后，就可以使用 gitbook serve 来编译和预览书籍了：

``` BASH
$ gitbook serve
Press CTRL+C to quit ...

Live reload server started on port: 35729
Starting build ...
Successfully built!

Starting server ...
Serving book on http://localhost:4000
```

gitbook serve 命令实际上会首先调用 gitbook build 编译书籍，完成以后会打开一个 web 服务器，监听在本地的 4000 端口。

现在，可以用浏览器打开 http://127.0.0.1:4000 查看书籍的效果