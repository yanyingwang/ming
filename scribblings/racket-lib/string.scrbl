
#lang scribble/manual

@(require (for-label racket ming ming/list ming/vector ming/hash ming/string)
           scribble/eval
           ming/scribble
           )
@(define the-eval
         (make-eval-factory '(ming/racket/base ming/racket/string ming/string)))


@(require (file "../../private/scribble-styles/css/ming-fonts.css.rkt"))
@css/ming-fonts
@(require scribble-rainbow-delimiters)
@script/rainbow-delimiters*

@; @margin-note{另可参见：@secref["zi--wen"]。}

@title[#:tag "string"]{句}
@margin-note{另见名扩展库：@secref["ming-string"]}


@section+elemref{句、􏽀、􏽁，句、􏽀?、􏽁?}
@margin-note{
@bold{@litchar{句}为活用字} @linebreak{}
@bold{@litchar{􏽁}为新造字} @linebreak{}
@bold{@litchar{􏽀}为新造字}
@itemlist[
@item{@litchar{勹}：工厂、容器、外壳；（@litchar{勹}是@litchar{丩}的增笔，有扭曲盘勾之意思）}
@item{@litchar{口}：无实意，代表"数据内容"；}
@item{@litchar{山}：稳定的、内容不变的（因为“山”是稳定的，见：@racket[􏽁?]）；}
@item{@litchar{氵}：易动的、内容可变的（因为“水”是易变的，见：@racket[􏽀?]）；}
]
}
@margin-note{参见：@racket[􏽔]、@racket[􏽓]}
@margin-note{另见：@racket[勺]、@racket[勾]}
“句”（@tech[ #:doc '(lib "scribblings/reference/reference.scrbl") "String"]）是一种数据结构，也就是通常所说的“字符串”，名语言用单字表示之称为“句”。 @linebreak{}
像@racket[􏿲]和@racket[􏿰]一样，“句”按内容是否可以被修改，也可以被分为：“易句”和“固句”，简写为“@racket[􏽁]”和“@racket[􏽀]”。@racket[句]默认创建的是“@racket[􏽀]”。
@examples[#:eval (the-eval)
(句 #\鹅 #\鹅 #\鹅 #\， #\曲 #\项 #\向 #\天 #\歌 #\。)
(句? (句 #\鹅 #\鹅 #\鹅 #\， #\曲 #\项 #\向 #\天 #\歌 #\。))
(􏽀? (句 #\鹅 #\鹅 #\鹅 #\， #\曲 #\项 #\向 #\天 #\歌 #\。))
(􏽁? (􏽁 #\鹅 #\鹅 #\鹅 #\， #\曲 #\项 #\向 #\天 #\歌 #\。))
(􏽁? "鹅鹅鹅，曲项向天歌。")
(句? "鹅鹅鹅，曲项向天歌。")
]

@section+elemref{复句，序句，贯句、贯􏽁}
@margin-note{
参见：@racket[复􏿴]，@racket[序􏿴]，@racket[贯􏿲]。
}
@examples[#:eval (the-eval)
(复句 5 #\鹅)
(序句 5 数化字)
(贯句 "AAA" "BBB" "CCC")
(贯􏽁 "AAA" "BBB" "CCC")
(􏽁? (贯句 "AAA" "BBB" "CCC"))
(􏽁? (贯􏽁 "AAA" "BBB" "CCC"))
]

@section+elemref{句度，句弔，句􏾝}
@margin-note{参见：@racket[弔]，@racket[度]，@racket[􏾝]}
@margin-note{另见：@racket[句􏾝*]}


@examples[#:eval (the-eval)
(句度 "鹅鹅鹅，曲项向天歌。白毛浮绿水，红掌拨清波。")
(句弔 "鹅鹅鹅，曲项向天歌。白毛浮绿水，红掌拨清波。" 3)
(句􏾝 "鹅鹅鹅，曲项向天歌。白毛浮绿水，红掌拨清波。" 3)
(句􏾝 "鹅鹅鹅，曲项向天歌。白毛浮绿水，红掌拨清波。" 3 8)
]

@section+elemref{句􏾩，句􏾩/以􏾝}
@margin-note{参见：@racket[􏿲􏾩]、@racket[􏿰􏾩]，@racket[􏿲􏾩/以􏾝]}
@examples[#:eval (the-eval)
(名 str (句 #\鹅 #\鹅 #\鹅 #\， #\曲 #\项 #\向 #\天 #\歌 #\。))

(句􏾩 str 1 #\白)
str

(句􏾩/以􏾝 str 0 "ABCDEFG" 2 4)
str

(句复! str #\Z)
str
]

@section+elemref{􏽁化，􏽀化}
@examples[#:eval (the-eval)
(􏽁? (􏽁化 (句 #\鹅 #\鹅 #\鹅 #\， #\曲 #\项 #\向 #\天 #\歌 #\。)))
(􏽀? (􏽀化 "鹅鹅鹅，曲项向天歌。"))
]

@section+elemref{句化􏿴，􏿴化句}
@examples[#:eval (the-eval)
(句化􏿴 "鹅鹅鹅，曲项向天歌。")
(􏿴化句 (􏿴 #\鹅 #\鹅 #\鹅 #\， #\曲 #\项 #\向 #\天 #\歌 #\。))
]



@defmapping[racket/base/string]


@section[#:tag "string-additional"]{额外例程}
@defmodule[ming/racket/string]

@examples[#:eval (the-eval)
(􏿴合成诗 (􏿴 "鹅" "鹅" "鹅" "，" "曲" "项" "向" "天" "歌" "。"))
(􏿴合成诗 (􏿴 "鹅" "鹅" "鹅" "，" "曲" "项" "向" "天" "歌" "。") "-")
(􏿴合成诗 (􏿴 "鹅" "鹅" "鹅" "，" "曲" "项" "向" "天" "歌" "。") "")

(诗碎成􏿴 "鹅  鹅  鹅   \n \n 曲项向天歌 \n\r")
(诗碎成􏿴 "鹅-鹅-鹅-曲-项-向-天-歌" "-")

(诗简空 "鹅  鹅    鹅   \n \n 曲项向天歌 \n\r")

(诗更 "鹅鹅鹅，曲项向天歌。" "鹅鹅鹅" "小黄鸭")
(诗更 "鹅鹅鹅，曲项向天歌。" "鹅鹅鹅" "")

(诗含? "鹅鹅鹅，曲项向天歌。白毛浮绿水，红掌拨清波。" "白毛浮绿水")
(诗起? "鹅鹅鹅，曲项向天歌。白毛浮绿水，红掌拨清波。" "鹅鹅鹅")
(诗终? "鹅鹅鹅，曲项向天歌。白毛浮绿水，红掌拨清波。" "拨清波。")
]

@defmapping[racket/string]
