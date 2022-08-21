
#lang scribble/manual

@(require (for-label racket ming)
           scribble/eval
           scribble-rainbow-delimiters
           ming/scribble
           )
@(define the-eval
         (make-eval-factory '(ming/racket/base ming/racket/string)))

@script/rainbow-delimiters*

@margin-note{另可参见：@secref["zi--wen"]。}

@title[#:tag "string"]{诗}
“诗”（@tech[ #:doc '(lib "scribblings/reference/reference.scrbl") "String"]）是一种数据结构，也就是通常所说的“字符串”。名语言中用单字表示之称为“诗”。

诗有“易诗”和“坚诗”之分：
@itemlist[
@item{“易诗”（“易”在这里是“易变的，可以被改变的”的意思）是一种内容可以被修改的字符串数据结构，通常很多诗相关的例程比如@racket[诗]、@racket[复诗]、@racket[摘诗]等处理完原始数据之后的结果输出都是易诗；}
@item{“坚诗”与之相反，是一种内容固定不能被修改的字符串数据结构，通过半格双引号@racket[""]创建出来的诗是“坚诗”。要注意的是，所谓的“不能被修改”是从数据的物理存储角度讲的；从代码的角度讲，很多诗相关的例程在处理完“坚诗”的时候，会新生成“易诗”并作为结果输出之。真正操作“诗”的原始数据并加以修改的例程都会以@racket[!]结尾以表警示。}
]
@; 此外，易诗和坚诗是可以相互转化的，严格区分他们从物理内存或运行效率的角度看更有意义。

@section[#:tag "string-base"]{基础例程}
@examples[#:eval (the-eval)
(诗 #\鹅 #\鹅 #\鹅 #\， #\曲 #\项 #\向 #\天 #\歌 #\。)
(复诗 5 #\鹅)
@; (名 鹅 "鹅鹅鹅，曲项向天歌。白毛浮绿水，绿掌拨清波。")
(诗长 "鹅鹅鹅，曲项向天歌。白毛浮绿水，红掌拨清波。")
(诗引 "鹅鹅鹅，曲项向天歌。白毛浮绿水，红掌拨清波。" 0)
(令 ([某诗 (诗->易诗 "鹅鹅鹅，曲项向天歌。白毛浮绿水，红掌拨清波。")])
    (行示 某诗)
    (诗改! 某诗 1 #\白)
    (行示 某诗))
@; (诗改! (诗->易诗 "鹅鹅鹅，曲项向天歌。白毛浮绿水，红掌拨清波。") 0 #\白)
(摘诗 "鹅鹅鹅，曲项向天歌。白毛浮绿水，红掌拨清波。" 10)
(摘诗 "鹅鹅鹅，曲项向天歌。白毛浮绿水，红掌拨清波。" 10 15)

(令 ([某A诗 (诗->易诗 "鹅鹅鹅，曲项向天歌。白毛浮绿水，红掌拨清波。")]
     [某B诗 "大中小白黑蓝"])
    (行示 某A诗)
    (诗覆以摘! 某A诗 0 某B诗 2 4)
    (行示 某A诗))

(令 ([某诗 (诗->易诗 "鹅鹅鹅，曲项向天歌。白毛浮绿水，红掌拨清波。")])
    (行示 某诗)
    (诗复! 某诗 #\呱)
    (行示 某诗))

(连诗 "鹅鹅鹅" "曲项向天歌" "白毛浮绿水" "红掌拨清波")
(诗->链 "鹅鹅鹅，曲项向天歌。")
(链->诗 (链 #\鹅 #\鹅 #\鹅 #\， #\曲 #\项 #\向 #\天 #\歌 #\。))
]

@defmapping[racket/base/string]


@section[#:tag "string-additional"]{额外例程}
@defmodule[ming/racket/string]

@examples[#:eval (the-eval)
(链拢成诗 (链 "鹅" "鹅" "鹅" "，" "曲" "项" "向" "天" "歌" "。"))
(链拢成诗 (链 "鹅" "鹅" "鹅" "，" "曲" "项" "向" "天" "歌" "。") "-")
(链拢成诗 (链 "鹅" "鹅" "鹅" "，" "曲" "项" "向" "天" "歌" "。") "")


(诗碎成链 "鹅  鹅  鹅   \n \n 曲项向天歌 \n\r")
(诗碎成链 "鹅  鹅  鹅   \n \n 曲项向天歌 \n\r" "曲项")

(诗简空诗 "鹅  鹅    鹅   \n \n 曲项向天歌 \n\r")

(诗部替诗 "鹅鹅鹅，曲项向天歌。" "鹅鹅鹅" "大白鹅")
(诗部替诗 "鹅鹅鹅，曲项向天歌。" "鹅鹅鹅" "")

(诗含子诗? "鹅鹅鹅，曲项向天歌。白毛浮绿水，红掌拨清波。" "白毛浮绿水")
(诗起子诗? "鹅鹅鹅，曲项向天歌。白毛浮绿水，红掌拨清波。" "鹅鹅鹅")
(诗终子诗? "鹅鹅鹅，曲项向天歌。白毛浮绿水，红掌拨清波。" "拨清波。")
]

@defmapping[racket/string]