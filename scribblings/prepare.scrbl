#lang scribble/manual


@(require (for-label racket ming scribble/base)
           scribble/example
           scribble-rainbow-delimiters)
@(define the-eval
         (make-eval-factory '(racket/base racket/list ming/racket/base ming/racket/list)))

@script/rainbow-delimiters*

@title[#:tag "prepare"]{准备}

@section[#:tag "install-ming"]{下载安装}
@itemlist[#:style 'ordered
@item{到Racket的@hyperlink["https://racket-lang.org/" "官方网站"]，@hyperlink["https://download.racket-lang.org/" "下载"]安装Racket。}
@item{在终端中执行以下任意一条命令来安装名语言扩展包：
@commandline{raco pkg install "https://github.com/yanyingwang/ming.git"}
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
赋予文件执行权限后运行此文件即可：
@commandline{./file1.rkt}


@section[#:tag "contributing-mapping"]{贡献翻译}
@margin-note{
目前名语言仅翻译了@secref["numbers"]、@secref["pairs-and-lists"]、@secref["string"]等相关的例程，大量如@racket[for]/@racket[match]/@racket[hash]/@racket[dict]/@racket[struct]/@racket[class]/@racket[syntax]等重要内容都还有待翻译。
}

对Racket标准库的翻译，应根据Racket库的路径来创建相应翻译文件到@racket[mapping/]目录中。


以@racket[racket/list]库的翻译为例，代码文件的位置和内容应为：
@margin-note{
对Racket的@racket[base]库的翻译，应将翻译文件置于@racket[mapping/racket/base/*.rkt]处（文件名任意）。
}
@filebox{mapping/racket/list.rkt
@codeblock|{
#lang s-exp "../../private/mapping-lang.rkt"

>>> first 甲 "第一个的意思，源自中国古代文字记序符号十天干。"
>>> second 乙
>>> third 丙 >>> fourth 丁 >>> fifth 戊   ;; 此行共三个翻译
>>> index-of 索引 (elem "从链中查出某个值的" (racket 引))   ;; “原因”可以为一个链
}|}

@margin-note{
翻译文件代码规则请见@secref["mapping-lang"]。
}

此时，我们已经可以使用@code{(require (mingize racket/list))}来使用我们上面的翻译了。但如欲使用@code{(require ming/racket/list)}，则还需创建如下文件：
@filebox{racket/list.rkt
@codeblock|{
#lang racket/base
(require "../private/core.rkt")
(provide-with-mingizily-require racket/list)
}|}
