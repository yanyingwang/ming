#lang scribble/manual


@(require (for-label racket ming scribble/base)
           scribble/example
           scribble-rainbow-delimiters)
@(define the-eval
         (make-eval-factory '(racket/base racket/list ming/racket/base ming/racket/list)))

@(require (file "../private/scribble-styles/css/ming-fonts.css.rkt"))
@css/ming-fonts
@(require scribble-rainbow-delimiters)
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

@section[#:tag "fonts-and-input-methods"]{仓颉字体和输入法}
因为名语言使用了很多新造字和古活字（古已有之但今不常用）：
@itemlist[#:style 'ordered
@item{需要安装@hyperlink["https://github.com/yanyingwang/cangjie" "仓颉字体"]用以显示之；}
@item{需要安装@hyperlink["https://rime.im/" "中州韵（rime）输入法"]，加以使用@hyperlink["https://github.com/yanyingwang/asdfzma/" "键序郑码（asdfzma）"]用以输入之（也可实现与双拼、拼音混输，可见：@hyperlink[ "https://github.com/yanyingwang/rime_custom" "rime_custom"]）；}
]

@section[#:tag "highlight-on-emacs"]{Emacs编辑器的语法高亮}
@code{git clone https://github.com/yanyingwang/racket-mode-for-ming}之后，在emacs的配置文件中加入：
@codeblock|{
(use-package racket-mode
  :load-path "/your-clone-path/racket-mode-for-ming"
)
}|


@section{运行代码}
@subsection{通过终端}
在终端中执行@racket[racket]命令来打开repl。然后例如，可以有以下输入输出：
@examples[#:eval (the-eval) #:label #f
(require ming)
(名 某物 (􏿴 "苹果" "香蕉" "梨"))
(示 某物)
(示 (甲 某物))
]

@subsection{通过文件}
例如，可以在系统中创建一个如下内容的文件：
@filebox{file1.rkt
@codeblock|{
#!/usr/bin/env racket
#lang ming
(名 某物 (􏿴 "苹果" "香蕉" "梨"))
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
>>> index-of 索引 (elem "从􏿴中查出某个值的" (racket 引))   ;; “原因”可以为一个􏿴
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




@section[#:tag "take-a-glance"]{名语言一览}

@subsection{白马非马}
以中国古代春秋战国时期，名家提出的辩题@hyperlink["https://zh.wikipedia.org/wiki/%E7%99%BD%E9%A9%AC%E9%9D%9E%E9%A9%AC" "《白马非马》"]，代码可以演示为：
@examples[#:eval (the-eval) #:label #f
(名 马 (􏿴 "白马" "黑马" "黄马"))      (code:comment @#,elem{起一个名字@racketvarfont{马}代表一个􏿴结构的数据集合，集合内容是@racketvalfont{白马}、@racketvalfont{黑马}和@racketvalfont{黄马}。})
(名 白马 "白马")       (code:comment @#,elem{起名@racketvarfont{白马}是一个字符串数据，该字符串内容是@racketvalfont{白马}二字。})
(若 (同? 马 白马)       (code:comment @#,elem{如果@racketvarfont{马}和@racketvarfont{白马}所代表的内容一样：})
(陈 (格 "~v是~v。" 白马 马))      (code:comment @#,elem{那么就转化整合变量名到字符串中并在屏幕上陈列出：@racketoutput{@racketvalfont{@racketvarfont{白马}所代表的内容}是@racketvalfont{@racketvarfont{马}所代表的内容}。}})
(陈 (格 "~v非~v。" 白马 马))      (code:comment @#,elem{否则就转化整合变量名到字符串中并在屏幕上陈列出： @racketoutput{@racketvalfont{@racketvarfont{白马}所代表的内容}非@racketvalfont{@racketvarfont{马}所代表的内容}。}})
)
(code:comment @#,bold{因为@racketvarfont{白马}是字符串意义上的白马,而@racketvarfont{马}是一个包含了“白马”“黑马”“黄马”的集合，故此两者不同，结果是“白马非马”。})
]

@subsection{三年一班点名册}
三年一班点名册的简单查询示例：
@examples[#:eval (the-eval) #:label #f
(名 三年一班点名册
    (􏿴 "王小明" "李小花" "赵小红"))
(若 (同? "王小明" (阳 三年一班点名册))
    (陈 "三年一班点名册上的第一个姓名是王小明。")
    (陈 "三年一班点名册上的第一个姓名不是王小明。"))

(尚 (阴之阳 三年一班点名册)
    [("王小明" "王小白") (行陈 "三年一班点名册上的第二个姓名是王小明或王小白。")]
    [("赵小红" "赵大红" "赵红") (行陈 "三年一班点名册上的第二个姓名是赵小红、赵大红或赵红。")]
    [俖 (行陈 "三年一班点名册上的第二个姓名是什么暂未可知。")])

(require ming/racket/list)
(当 [(同? "王小明" (甲 三年一班点名册))
     (陈 "三年一班点名册上的第一个姓名是王小明。")]
    [(同? "赵小红" (甲 三年一班点名册))
     (陈 "三年一班点名册上的第一个姓名是赵小红。")]
    [(同? "赵小红" (乙 三年一班点名册))
     (陈 "三年一班点名册上的第二个姓名是赵小红。")]
    [俖 (行陈 "三年一班点名册上的第二个姓名是什么暂未可知。")])
]
