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


@title[#:tag "string"]{句}
@margin-note{另见名扩展库：@secref["ming-string"]}
“句”（@tech[#:doc '(lib "scribblings/reference/reference.scrbl") "String"]）就是通常所说的“字符串”数据结构，名语言用单字表示之称为“句”。


@section[#:tag "list-rules"]{例程命名规则}
见@secref["naming-rules"]，有：

@tabular[@;#:sep @hspace[0]
         #:style 'boxed
         #:column-properties '(center)
         #:row-properties '(border)
         (list (list @bold{规则} @bold{指示} @bold{含义} @bold{举例})
               (list
               @elem{下偏旁@bold{@litchar{句}}}
               @elem{指示出参}
               @elem{出参是句结构}
               @elem{@racket[句]、@racket[􏽀]、@racket[􏼅]、@racket[􏼄]、@racket[􏼃]、@racket[􏼂]}
               )
               (list
               @elem{右偏旁@bold{@litchar{句}}}
               @elem{指示出参}
               @elem{出参是句结构}
               @elem{@racket[􏼪]、@racket[􏼲]}
               )
               (list
               @elem{左偏旁@bold{@litchar{句}}}
               @elem{指示入参}
               @elem{入参是句结构}
               @elem{@racket[􏺕]、@racket[􏼭]、@racket[􏼩]、@racket[􏼳]、@racket[􏼥]、@racket[􏼝]、@racket[􏼛]、@racket[􏺔]、@racket[􏺓]、@racket[􏺒]}
               )
         )]


@section+elemref{句、􏽀、􏽁，句?、􏽀?、􏽁?，􏼟?}
@margin-note{
@bold{@litchar{句}为活用字} @linebreak{}
@bold{@litchar{􏽁}为新造字} @linebreak{}
@bold{@litchar{􏽀}为新造字}
@itemlist[
@item{@litchar{勹}：工厂、容器、外壳；（@litchar{勹}是@litchar{丩}的增笔，有扭曲盘勾之意思）}
@item{@litchar{口}：无实意，代表"数据内容"；}
@item{@litchar{山}：稳定的、内容不变的（因为“山”是稳定的，见：@racket[􏽁?]）；}
@item{@litchar{氵}：易动的、内容可变的（因为“水”是易变的，见：@racket[􏽀?]）；}
@; @item{@litchar{穴}：@litchar{空}的简写；}
@item{上下结构的@litchar{穴}+@litchar{非}：非空。}
]
}
@margin-note{参见：@racket[􏻼]、@racket[􏻽]}
@margin-note{另见：@secref["symbols"]、@secref["keywords"]，@racket[􏻷?]}

像@secref["vector"]和@secref["hash"]一样，“句”按内容是否可以被修改，也可以被分为：“易句”和“固句”（简写为“@racket[􏽁]”和“@racket[􏽀]”）。@racket[句]默认创建的是“@racket[􏽀]”，通过英文双引号（""）创建的则是“@racket[􏽁]”。
@examples[#:eval (the-eval)
(句 #\鹅 #\鹅 #\鹅 #\， #\曲 #\项 #\向 #\天 #\歌 #\。)
(句? (句 #\鹅 #\鹅 #\鹅 #\， #\曲 #\项 #\向 #\天 #\歌 #\。))
(􏽀? (句 #\鹅 #\鹅 #\鹅 #\， #\曲 #\项 #\向 #\天 #\歌 #\。))
(􏽁? (􏽁 #\鹅 #\鹅 #\鹅 #\， #\曲 #\项 #\向 #\天 #\歌 #\。))
(􏽁? "鹅鹅鹅，曲项向天歌。")
(句? "鹅鹅鹅，曲项向天歌。")
(􏼟? "鹅鹅鹅")
(􏼟? "")
]

@section+elemref{􏽁化，􏽀化}
@examples[#:eval (the-eval)
(􏽁? (􏽁化 (句 #\鹅 #\鹅 #\鹅 #\， #\曲 #\项 #\向 #\天 #\歌 #\。)))
(􏽀? (􏽀化 "鹅鹅鹅，曲项向天歌。"))
]

@section+elemref{􏼅，􏼄}
@margin-note{
@bold{@litchar{􏼅}为新造字} @linebreak{}
@bold{@litchar{􏼄}为新造字}  @linebreak{}
}
@margin-note{参见：@racket[􏼓]，@racket[􏼎]。}
@examples[#:eval (the-eval)
(􏼅 5 #\鹅)
(􏼄 5 数化字)
]

@section+elemref{􏼃，􏼁，􏼂}
@margin-note{
@bold{@litchar{􏼃}为新造字} @linebreak{}
@bold{@litchar{􏼂}为新造字} @linebreak{}
@bold{@litchar{􏼁}为新造字}
@itemlist[
@item{@litchar{申}：“贯穿”的意思；}
@item{@litchar{山}：见：@racket[􏽁]；}
@item{@litchar{毌}+@litchar{又}：“贯穿”的意思，且末尾数据是@racket[􏿴]。}
]
}
@margin-note{参见：@racket[􏼓]，@racket[􏼎]。}
@examples[#:eval (the-eval)
(􏼃 "AAA" "BBB" "CCC")
(􏼁 "AAA" "BBB" "CCC")
(􏼂 "AAA" "BBB" '("CCC" "DDD"))
(􏽁? (􏼃 "AAA" "BBB" "CCC"))
(􏽁? (􏼁 "AAA" "BBB" "CCC"))
(􏽁? (􏼂 "AAA" "BBB" '("CCC" "DDD")))
]


@section+elemref{􏺕，􏼭，邭}
@margin-note{
@bold{@litchar{􏺕}为新造字} @linebreak{}
@bold{@litchar{􏼭}为新造字} @linebreak{}
@bold{@litchar{邭}为古活字}
@itemlist[
@item{@litchar{巨}：“测量长度”的意思，参见：@racket[巨]；}
@item{@litchar{弔}：“第”的意思，参见：@racket[弔]；}
@item{@litchar{阝}：“部分”的意思。}
@item{@litchar{邭}：@litchar{句􏾝}的缩写。}
]
}
@margin-note{参见：@racket[巨]，@racket[弔]，@racket[􏾝]，@racket[􏻿􏾝]}
@; @margin-note{另见：@racket[邭*]}
@examples[#:eval (the-eval)
(􏺕 "鹅鹅鹅，曲项向天歌。白毛浮绿水，红掌拨清波。")

(􏼭 "鹅鹅鹅，曲项向天歌。白毛浮绿水，红掌拨清波。" 3)

(邭 "鹅鹅鹅，曲项向天歌。白毛浮绿水，红掌拨清波。" 3)
(邭 "鹅鹅鹅，曲项向天歌。白毛浮绿水，红掌拨清波。" 3 8)
]

@section+elemref{􏼘，􏼘/以邭，􏼅𰅡}
@margin-note{
@; @bold{@litchar{拘}为古活字} @linebreak{}
@; @bold{@litchar{􏼿}为古活字}
@bold{@litchar{􏼘}为新造字} @linebreak{}
@bold{@litchar{邭}为古活字} @linebreak{}
@bold{@litchar{𰅡}为古活字} @linebreak{}
@itemlist[
@item{@litchar{扌}：“@litchar{!}”的意思；}
]
}
@margin-note{另见：@racket[􏼅]，@racket[邭]}
@margin-note{参见：@racket[攸]、@racket[􏻿􏾩]、@racket[􏿰􏾩]，@racket[􏻿􏾩/以􏾝]}
@examples[#:eval (the-eval)
(名 str (句 #\鹅 #\鹅 #\鹅 #\， #\曲 #\项 #\向 #\天 #\歌 #\。))

(􏼘 str 1 #\白)
str

(􏼘/以邭 str 0 "ABCDEFG" 2 4)
str

(􏼅𰅡 str #\Z)
str
]

@section+elemref{􏼩、􏼪，􏼳、􏼲}
@margin-note{
@bold{@litchar{􏼩}为新造字} @linebreak{}
@bold{@litchar{􏼪}为新造字} @linebreak{}
@bold{@litchar{􏼳}为新造字} @linebreak{}
@bold{@litchar{􏼲}为新造字}
@itemlist[
@item{@litchar{子}：@litchar{字}的简写（见：@secref["characters"]）；}
@item{上下结构的@litchar{又}+@litchar{㐅}：@racket[􏿴]；}
@item{上下结构的@litchar{又}+@litchar{子}：组成元素是“@racket[字]”的@racket[􏿴]；}
@item{@litchar{􏼩}：把@racket[句]转化为@racket[􏿴]；}
@item{@litchar{􏼳}：把@racket[句]转化为组成元素是字的@racket[􏿴]；}
@item{@litchar{􏼪}：把@racket[􏿴]转化为@racket[句]；}
@item{@litchar{􏼲}：把组成元素是@racket[字]的@racket[􏿴]转化为@racket[句]。}
]
}
@examples[#:eval (the-eval)
(􏼪 '("鹅" "鹅" "鹅" "，" "曲" "项" "向" "天" "歌"))
(􏼪 '("鹅" "鹅" "鹅" "，" "曲" "项" "向" "天" "歌") "")
(􏼪 '("鹅" "鹅" "鹅" "，" "曲" "项" "向" "天" "歌") "-")

(􏼩 "鹅鹅鹅，曲项向天歌")
(􏼩 "鹅鹅鹅，曲项向天歌" "")
(􏼩 "鹅鹅鹅，曲项向天歌" "，")
(􏼩 "鹅-鹅-鹅-曲-项-向-天-歌" "-")

(􏼲 '(#\鹅 #\鹅 #\鹅 #\， #\曲 #\项 #\向 #\天 #\歌 #\。))
(􏼳 "鹅鹅鹅，曲项向天歌。")
]

@section+elemref{􏼥，􏼝，􏼛}
@margin-note{
@bold{@litchar{􏼥}为新造字} @linebreak{}
@bold{@litchar{􏼝}为新造字} @linebreak{}
@bold{@litchar{􏼛}为新造字}
@itemlist[
@item{@litchar{戈}：本意是“兵器”，引申为“修改、替换”之意；}
@item{@litchar{匕}：本意是“匕首”，引申为“修剪、删除”之意；}
@item{@litchar{穴}：@litchar{空}的简写；}
@item{上下结构的@litchar{丷}+@litchar{匕}：修剪起始处和结尾处；}
@item{上下结构的@litchar{穴}+@litchar{一}：将相连的多个空格单一化成一个。}
]
}
@examples[#:eval (the-eval)
(􏼥 "鹅鹅鹅，曲项向天歌。" "鹅鹅鹅" "小黄鸭")
(􏼥 "鹅鹅鹅，曲项向天歌。" "鹅" "")
(􏼥 "\n\r鹅鹅鹅，\n\r曲项向天歌。\n\r\n\r" "\n\r" "")

(􏼝 "\n\r鹅鹅鹅，\n\r曲项向天歌。\n\r\n\r")
(􏼝 "鹅鹅鹅，曲项向天歌。" "鹅鹅鹅")

(􏼛 "鹅  鹅    鹅   \n \n 曲项向天歌 \n\r")
]

@section+elemref{􏼹?，􏼸?，􏸶?}
@margin-note{
@bold{@litchar{􏼹}为新造字} @linebreak{}
@bold{@litchar{􏼸}为新造字} @linebreak{}
@; @bold{@litchar{􏼢}为新造字}
@itemlist[
@item{@litchar{本}：本意是“树根”，在此引申为“起始、开头”之意；}
@item{@litchar{末}：本意是“树梢”，在此引申为“结尾、末尾”之意；}
@item{@litchar{干}：本意是“枝干”，在此引申为“中间、包含”之意；}
]
}
@examples[#:eval (the-eval)
(􏼹? "鹅鹅鹅，曲项向天歌。白毛浮绿水，红掌拨清波。" "鹅鹅鹅")
(􏼸? "鹅鹅鹅，曲项向天歌。白毛浮绿水，红掌拨清波。" "拨清波。")
(􏸶? "鹅鹅鹅，曲项向天歌。白毛浮绿水，红掌拨清波。" "鹅鹅鹅")
(􏸶? "鹅鹅鹅，曲项向天歌。白毛浮绿水，红掌拨清波。" "拨清波。")
(􏸶? "鹅鹅鹅，曲项向天歌。白毛浮绿水，红掌拨清波。" "白毛")
]

@section+elemref{􏺔，􏺓，􏺒}
@margin-note{
@bold{@litchar{􏺔}为新造字} @linebreak{}
@bold{@litchar{􏺓}为新造字} @linebreak{}
@bold{@litchar{􏺒}为新造字}
@itemlist[
@item{@litchar{与}：@litchar{写}的简写；}
]
}
@examples[#:eval (the-eval)
(􏺔 "string upper case")
(􏺓 "string lower case")
(􏺒 "string title case")
]


@defmapping[racket/base/string]

@section[#:tag "string-additional"]{额外例程}
@defmodule[ming/racket/string]

@defmapping[racket/string]
