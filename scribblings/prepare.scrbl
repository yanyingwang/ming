#lang scribble/manual


@(require (for-label racket ming)
           scribble/example
           scribble-rainbow-delimiters)
@(define the-eval
         (make-eval-factory '(racket/base racket/list ming/racket/base ming/racket/list)))

@script/rainbow-delimiters*

@title[#:tag "prepare"]{准备}
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
在终端中执行@racket[racket]命令来打开repl。然后例如，可以有以下输入输出：
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


@section{贡献翻译}
对Racket标准库的翻译，应根据库路径创建相应文件到@racket[mapping/racket/*]中。

比如对@racket[racket/list]库的翻译，应创建如下文件：
@filebox{mapping/racket/list.rkt
@codeblock|{
#lang racket/base
(provide mapping)
(require "../../private/mapping.rkt")

(define (mapping #:scribble? [scribble? #f])
  (gen-mapping-data data #:scribble? scribble?))
(define data
  '((first 甲 "第一个的意思，源自中国古代文字记序符号十天干。")
    (second 乙 "第二个的意思，源自中国古代文字记序符号十天干。")))
}|}

@nested[#:style 'inset]{
@racketcommentfont{TODO: Implement below fake code for others easily contributing to the translation:}
@filebox{mapping/racket/list.rkt
@codeblock|{
#lang ming / mapping
first 甲
second 乙
third 丙
...
}|}
}


然后再创建如下文件：
@filebox{racket/list.rkt
@codeblock|{
#lang racket/base
(require "../private/core.rkt")
(provide-with-mingizily-require racket/list)
}|}

最后就可以通过@code{(require ming/racket/list)}使用了。


