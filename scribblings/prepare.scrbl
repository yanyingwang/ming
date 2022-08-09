#lang scribble/manual


@(require (for-label racket ming)
           scribble/example
           scribble-rainbow-delimiters)
@(define the-eval
         (make-eval-factory '(racket/base racket/list ming/racket/base ming/racket/list)))

@script/rainbow-delimiters*

@title[#:tag "prepare"]{备}
@declare-exporting[ming]

@section[#:tag "install-ming"]{下载安装}
@itemlist[#:style 'ordered
@item{到Racket的@hyperlink["https://racket-lang.org/" "官方网站"]，@hyperlink["https://download.racket-lang.org/" "下载"]安装Racket。}
@item{在终端中执行以下任意一条命令来安装名语言扩展包：
@commandline{raco pkg install "https://github.com/yanyingwang/http-client.git"}
@commandline{raco pkg install ming}
}
]

@section{运行代码}
@subsection{通过终端}
在终端中执行@racket[racket]命令来打开repl，然后可以有以下输入输出：
@examples[#:eval (the-eval) #:label #f
(require ming)
(名 某物 (链 "苹果" "香蕉" "梨"))
(示 某物)
(示 (甲 某物))
]

@subsection{通过文件}
例如，可以在系统中创建一个如下内容的文件：
@filebox{file1.rkt
@codeblock|{
#!/usr/bin/env racket
#lang ming
(名 某物 (链 "苹果" "香蕉" "梨"))
(示 某物)
(示 (甲 某物))
}|
}
然后运行此文件即可：
@commandline{./file.rkt}
