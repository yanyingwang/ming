
#lang scribble/manual

@(require (for-label racket ming)
           scribble/eval
           scribble-rainbow-delimiters
           ming/scribble
           )
@(define the-eval
         (make-eval-factory '(ming/racket/base ming/racket/string)))


@script/rainbow-delimiters*

@title[#:tag "cssisd"]{字词参诗名料文}
@declare-exporting[ming]

@margin-note{请注意，这里说的“词”或者“诗”都是一种数据结构，和@racket[链]类似。}

对名语言来说，语言构成的最基本单位称之为“字”（@tech[ #:doc '(lib "scribblings/reference/reference.scrbl") "Character"]）。多个字连在一块可以构成“词”（@tech[ #:doc '(lib "scribblings/reference/reference.scrbl") "Symbol"]）或“诗”（@tech[ #:doc '(lib "scribblings/reference/reference.scrbl") "String"]）。

@examples[#:eval (the-eval)
(字? #\a)
(字? #\+)
(字? #\梨) @; character
(词? '一只梨) @; symbol
(词参? '#:一只梨) @;keyword 关键词 箴 铭
(诗? "一只梨") @; string
(词->诗 '春分，夏至，秋分，冬至。)
(词参->诗 '#:春分，夏至，秋分，冬至。)   @;keyword->string
(诗->词 "春分，夏至，秋分，冬至。") @; (string->symbol ...)
(诗->词参 "春分，夏至，秋分，冬至。")  @; string->keyword
(诗->链 "半个苹果") @;(string->list ...)
(名? #'半个苹果) @; identifier? 符 号
]

对名语言（LISP）来说，“词”和“链”是比较特殊的两种数据结构，因为这两者是名语言代码在“文”（@tech[ #:doc '(lib "scribblings/reference/reference.scrbl") "syntax object"]）层面上所使用到的数据结构。

什么是“文”呢？简单而言，一段名语言的代码就是“文”。

对于其他很多编程语言来说，代码就是简单意义上的代码，但对名语言（LISP语言）来说，一段代码必须以某种形式的可以在代码中另外的被表示出来（以便被操作，用代码来生成代码），这种在代码中另外被表示着的一段代码我们称之为“文”。

细究的话，“文”通常由两种要素组成：“具体的代码”和“具体代码的上下文环境”（包括代码在文件的第几行第几列、作用域等等）。

对名语言来说，“具体代码”我们称之为“料”（原料、资料的意思，原英文datum）。通常情况下，“料”所采用的的数据形式是由“词”所组成的“链”，而由“词”所组成的“链”附加上上下文环境就可以被转化成“文”了：
@examples[#:eval (the-eval)
(词? '+)
(词? 'a)
@; (各全都 词? '(+ a b c))
(料->文 #f '(+ a b c))

]
比如上面示例中，我们把一个“链”转化成“文”（附加的上下文环境是@racket[#f]）。

但如果求这个“文”的话，会报错，原因是这个“文”的上下文环境（@racket[#f]）中没有定义@racket[a]、@racket[b]、@racket[c]：
@examples[#:eval (the-eval)
(求 (料->文 #f '(+ a b c)))
(文 (+ 1 2 3))
(求 (料->文 #f '(+ 1 2 3)))
(code:comment "")
(文 一个香梨) @; syntax
(文 '一个香梨)
(文 "一个香梨")
(code:comment "")
(文->料 #'(1 2 3)) @; syntax->datum
(文->链 #'(1 2 3)) @; syntax->list
(code:comment "")
(料->文 #f 1) @; datum->syntax
(料->文 #f '一个香梨)
(料->文 #f '(1 2 3))
]
@defmapping[racket/base/syntax]

@section{诗}
“诗”是一种数据结构，也就是通常所说的“字符串”，在名语言中用单字表示之称为“诗”。“诗”有“易诗”和“坚诗”之分：
@itemlist[
@item{“易诗”中的“易”是“可以改变的”的意思，所以“易诗”是一种创建之后内容依然可以被修改的字符串数据结构。其之创建可以通过@racket[易诗]和@racket[易复诗]等例程；}
@item{而“坚诗”与之相反，是一种一旦创建了其内容就不可再修改的字符串数据结构。通过半格双引号@racket[""]创建出来的“诗”是“坚诗”。}
]


@examples[#:eval (the-eval)
(易诗 #\鹅 #\鹅 #\鹅 #\， #\曲 #\项 #\向 #\天 #\歌 #\。)
(易复诗 5 #\鹅)
@; (名 鹅 "鹅鹅鹅，曲项向天歌。白毛浮绿水，绿掌拨清波。")
(诗长 "鹅鹅鹅，曲项向天歌。白毛浮绿水，红掌拨清波。")
(诗引 "鹅鹅鹅，曲项向天歌。白毛浮绿水，红掌拨清波。" 0)
(令 ([某诗 (诗->易诗 "鹅鹅鹅，曲项向天歌。白毛浮绿水，红掌拨清波。")])
    (行示 某诗)
    (诗改! 某诗 0 #\白)
    (行示 某诗))
@; (诗改! (诗->易诗 "鹅鹅鹅，曲项向天歌。白毛浮绿水，红掌拨清波。") 0 #\白)
(易取诗 "鹅鹅鹅，曲项向天歌。白毛浮绿水，红掌拨清波。" 4)
(易取诗 "鹅鹅鹅，曲项向天歌。白毛浮绿水，红掌拨清波。" 0 10)

(令 ([某A诗 (诗->易诗 "鹅鹅鹅，曲项向天歌。白毛浮绿水，红掌拨清波。")]
     [某B诗 "大中小白黑蓝"])
    (行示 某A诗)
    (易引覆诗 某A诗 0 某B诗 2 4)
    (行示 某A诗))

(诗复! (诗->易诗 "鹅鹅鹅，曲项向天歌。白毛浮绿水，红掌拨清波。") #\鹅)
(易连诗 "鹅鹅鹅" "曲项向天歌" "白毛浮绿水" "红掌拨清波")
]

@defmapping[racket/base/string]


@section{诗/额外例程}
@defmodule[ming/racket/string]

@examples[#:eval (the-eval)
(链拢易诗 (链 "鹅" "鹅" "鹅" "，" "曲" "项" "向" "天" "歌" "。" "白" "毛" "浮" "绿" "水" "，" "红" "掌" "拨" "清" "波" "。"))
(易空简诗 "鹅  鹅  鹅   \n \n 曲项向天歌 \n\r  白毛浮绿水   \r\n 红掌拨清波     \n\n\n ")
(易部替诗 "鹅鹅鹅，曲项向天歌。白毛浮绿水，红掌拨清波。" "鹅鹅鹅" "大白鹅")
(断诗成链 "鹅  鹅  鹅   \n \n 曲项向天歌 \n\r  白毛浮绿水   \r\n 红掌拨清波     \n\n\n ")
(诗含诗? "鹅鹅鹅，曲项向天歌。白毛浮绿水，红掌拨清波。" "白毛浮绿水")
(于诗起诗? "鹅鹅鹅，曲项向天歌。白毛浮绿水，红掌拨清波。" "鹅鹅鹅")
(于诗终诗? "鹅鹅鹅，曲项向天歌。白毛浮绿水，红掌拨清波。" "拨清波。")


]

@defmapping[racket/string]