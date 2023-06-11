#lang scribble/manual


@(require (for-label racket ming)
           scribble/eval
           ming/scribble
           )
@(define the-eval
         (make-eval-factory '(ming/racket/base)))

@(require (file "../../private/scribble-styles/css/ming-fonts.css.rkt"))
@css/ming-fonts
@(require scribble-rainbow-delimiters)
@script/rainbow-delimiters*


@title[#:tag "numbers"]{数}
@margin-note{@litchar{数}被简写为@litchar{米}偏旁，以便构造单字来表示跟其相关的概念。}

“数”（@tech[#:doc '(lib "scribblings/reference/reference.scrbl") "numbers"]）是编程语言乃至现代科学中极其重要的一个概念。 @linebreak{}

现代汉语中“数”有关的概念和词汇很多都来对英文的直接翻译，并且大都使用词组来构造。@linebreak{}
但我认为仅单个汉字所能包含的意义很多时候就已经比英文中的单词多了，进而还构造使用词组进行表达就会显得“含意过剩”，反而显得啰唆，含意不清。 @linebreak{}
故此，本语言对关于“数”的例程做了简化：剔除多余无效的表意偏旁，代之以简洁有效的偏旁组合成单字进行表达，比如所有跟“数”相关的概念均采用@litchar{米}偏旁来构造。


@section[#:tag "list-rules"]{单字命名规则}
@tabular[@;#:sep @hspace[0]
        #:style 'boxed
        #:column-properties '(center)
        #:row-properties '(border)
        (list (list @bold{规则} @bold{含义} @bold{举例})
              (list
              @elem{下偏旁@bold{@litchar{米}}}
              @elem{大类概念}
              @elem{@racket[夈?]、@racket[宩]、@racket[􏻟]、@racket[粊?]、@racket[䉾?]、@racket[􏻧?]、@racket[􏻥?]}
              )
              @; (list
              @; @elem{上偏旁@bold{@litchar{米}}}
              @; @elem{常用概念}
              @; @elem{@racket[􏻛?]、@racket[􏻚?]、@racket[􏻘?]、@racket[􏻙?]}
              @; )
              (list
              @elem{整体性结构的@bold{@litchar{米}}}
              @elem{常用概念}
              @elem{@racket[米?]、@racket[􏻴?]、@racket[釆?]}
              )
              (list
              @elem{左偏旁@bold{@litchar{立}}}
              @elem{精确位数}
              @elem{@racket[􏻞?]、@racket[􏻝?]}
              )
              (list
              @elem{左偏旁@bold{@litchar{米}}}
              @elem{运算或转化例程（出参是数字）}
              @elem{@racket[􏽉]、@racket[􏽊]、@racket[􏻡]、@racket[􏻠]、@racket[􏻏]}
              )
              (list
              @elem{左偏旁@bold{@litchar{􏻴}}}
              @elem{运算或转化例程（出参是整数型数字）}
              @elem{@racket[􏺿]、@racket[􏺾]、@racket[􏺽]、@racket[􏺼]}
              )
              (list
              @elem{左偏旁@bold{@litchar{刀}}}
              @elem{修改转化了入参}
              @elem{@racket[􏻏]}
              )
              (list
              @elem{左偏旁@bold{@litchar{匕}}}
              @elem{小幅度修改转化了入参}
              @elem{@racket[􏺿]、@racket[􏺽]、@racket[􏺾]、@racket[􏺼]}
              )
         )]

@section+elemref{大类概念：米?，夈?，宩?、􏻟?，粊?、䉾?}
@margin-note{
@bold{@litchar{夈}为古活字}  @linebreak{}
@bold{@litchar{宩}为古活字}  @linebreak{}
@bold{@litchar{􏻟}为新造字}  @linebreak{}
@bold{@litchar{粊}为古活字}  @linebreak{}
@bold{@litchar{䉾}为古活字}  @linebreak{}
@itemlist[
@item{下偏旁@litchar{米}：数相关的大类概念；}
@item{@litchar{夂}：@litchar{复}的简写，更是@litchar{冬}的简写，@litchar{冬}通@litchar{终}，故也有所有的数终归都是复数之意；}
@item{@litchar{宀}：@litchar{实}的简写；}
@item{@litchar{虍}：@litchar{虚}的简写；}
@item{@litchar{比}：因为有理数是可以用两个整数之比表示的数；}
@item{@litchar{北}：@litchar{背}的简写，因为无理数是不能用两个整数之比表示的数（与之相违背）；}
]
}
所有的“米”（数）都是“夈”（复数）；“夈”由“宩”（实数）和“􏻟”（虚数）组成；“宩”则由“粊”（有理数）和“䉾”（无理数）组成。
@examples[#:eval (the-eval)
(米? 1)
(宩? 1)
(粊? 1)
]


@section+elemref{常用概念：􏻴?，𥥪?}
@margin-note{
@bold{@litchar{􏻴}为新造字}  @linebreak{}
@bold{@litchar{𥥪}为古活字}  @linebreak{}
@itemlist[
@item{@litchar{􏻴}：@litchar{米}+@litchar{束}组成而成；}
@item{@litchar{束}：@litchar{整}的简写；}
@item{@litchar{穴}：@litchar{空}的简写。}
]
}
“􏻴”（整数）是非常基本和常用的数学概念；“𥥪”（空位的数字）也是非常基本的数学概念。
@examples[#:eval (the-eval)
(􏻴? 1)
(𥥪? 0)
]


@section+elemref{实现概念：釆?、􏻞?、􏻝?，􏺸?、􏺟?}
@margin-note{
@bold{@litchar{釆}为古活字}  @linebreak{}
@bold{@litchar{􏻞}为新造字}  @linebreak{}
@bold{@litchar{􏻝}为新造字}  @linebreak{}
@bold{@litchar{􏺸}为新造字}  @linebreak{}
@bold{@litchar{􏺟}为新造字}  @linebreak{}
@itemlist[
@item{@litchar{釆}：@litchar{浮}+@litchar{米}组成而成；}
@item{@litchar{丿}：@litchar{浮}的简写；}
@item{@litchar{立}：@litchar{位}的简写。}
@item{@litchar{石}：@litchar{准确}的简写；}
@item{@litchar{非}：非；}
]
}
在编程语言的具体实现中，“米”有“􏺸”（准确）和“􏺟”（不准确）之分；“􏻴”是“􏺸”，而“􏺟”是用“釆”（浮点数）实现的（见：@hyperlink["https://en.wikipedia.org/wiki/IEEE_754" "WIKI:IEEE_754"]）；“釆”按照精确度可分为“􏻞”（单倍精度浮点数）和“􏻝”（双倍精度浮点数）。
@examples[#:eval (the-eval)
(釆? 1.1)
(􏻞? 1.1)
(􏻝? 1.1)

(􏺸? 1)
(􏺟? 1.1)
]


@section+elemref{组合表达：􏺢?，􏺡?}
@margin-note{

@bold{@litchar{􏺢}为新造字}  @linebreak{}
@bold{@litchar{􏺡}为新造字}  @linebreak{}
@itemlist[
@item{@litchar{􏻴}：@litchar{整数}的简写；}
@item{@litchar{石}：@litchar{准确}的简写；}
@item{@litchar{非}：非；}
@item{@litchar{丰}：@litchar{非}的简写；}
@item{@litchar{贝}：@litchar{负}的简写；}
]
}
@examples[#:eval (the-eval)
(􏺢? 1)
(􏺡? 1)
]


@; @section+elemref{常用概念：􏻛?、􏻚，􏻙?、􏻘?}
@; @margin-note{
@; @bold{@litchar{􏻛}为新造字}  @linebreak{}
@; @bold{@litchar{􏻚}为新造字}  @linebreak{}
@; @bold{@litchar{􏻙}为新造字}  @linebreak{}
@; @bold{@litchar{􏻘}为新造字}  @linebreak{}
@; @itemlist[
@; @item{@litchar{正}：正数的；}
@; @item{@litchar{贝}：负数的，@litchar{负}的简写；}
@; @item{@litchar{可}：奇数的，@litchar{奇}的简写；}
@; @item{@litchar{禸}：偶数的，@litchar{偶}的简写。}
@; ]
@; }
@; 对于“粊”而言，最常使用的子概念是：“􏻛”（正数）、“􏻚”（负数）、“􏻙”（奇数）、“􏻘”（偶数）。

@; @examples[#:eval (the-eval)
@; (􏻛? 1)
@; (􏻚? -1)
@; (􏻙? 1)
@; (􏻘? 2)
@; ]


@section+elemref{常用概念：􏽌?、􏽋?，􏺞?、􏺝?}
@margin-note{
@bold{@litchar{􏽌}为新造字}  @linebreak{}
@bold{@litchar{􏽋}为新造字}  @linebreak{}
@bold{@litchar{􏺞}为新造字}  @linebreak{}
@bold{@litchar{􏺝}为新造字}  @linebreak{}
@itemlist[
@item{@litchar{正}：正数的；}
@item{@litchar{负}：负数的；}
@item{@litchar{日}：奇数的，“奇数”在古代叫“阳数”（阴阳是贯穿于本语言的基本概念）；}
@item{@litchar{月}：偶数的，“偶数”在古代叫“阴数”（阴阳是贯穿于本语言的基本概念）。}
]
}
对于“粊”而言，最常使用的子概念是：“􏽌”（正数）、“􏽋”（负数）、“􏺞”（奇数）、“􏺝”（偶数）。
@examples[#:eval (the-eval)
(􏽌? 1)
(􏽋? -1)
(􏺞? 1)
(􏺝? 2)
]


@section+elemref{运算概念：􏽊、􏽉，􏻡、􏻠}
@margin-note{
@bold{@litchar{􏽊}为新造字}  @linebreak{}
@bold{@litchar{􏽉}为新造字}  @linebreak{}
@bold{@litchar{􏻡}为新造字}  @linebreak{}
@bold{@litchar{􏻠}为新造字}  @linebreak{}
@itemlist[
@item{@litchar{曾}：@litchar{增}的简写，@litchar{曾}是一种多层的蒸屉；}
@item{@litchar{员}：@litchar{损}/@litchar{陨}的简写，@litchar{陨}本意是“球高从落下”；}
@item{@litchar{日}：@litchar{最}的简写；}
@item{@litchar{大}：数值大的；}
@item{@litchar{小}：数值小的。}
]
}
@examples[#:eval (the-eval)
(􏽊 1)
(􏽉 1)
(􏻡 1 2 3 4 5)
(􏻠 1 2 3 4 5)
]

@section+elemref{数值转化概念：􏻏，􏺿、􏺽、􏺾、􏺼}
@margin-note{
@bold{@litchar{􏻏}为新造字}  @linebreak{}
@bold{@litchar{􏺿}为新造字}  @linebreak{}
@bold{@litchar{􏺾}为新造字}  @linebreak{}
@bold{@litchar{􏺽}为新造字}  @linebreak{}
@bold{@litchar{􏺼}为新造字}  @linebreak{}
@itemlist[
@item{@litchar{刀}：修改数值；}
@item{@litchar{匕}：小幅修改数值；}
@item{@litchar{禸}：偶数，@litchar{偶}的简写；}
@item{@litchar{日}：@litchar{最}的简写；}
@item{@litchar{大}：数值大的；}
@item{@litchar{小}：数值小的。}
@item{@litchar{口}：〇。}
]
}
@litchar{刀}和@litchar{匕}都是一种武器，都被用于修改数字，只是修改幅度略有所不同。
@examples[#:eval (the-eval)
(􏻏 -1)
(􏻏 1)

(􏺿 1.1)
(􏺿 1.5)
(􏺿 1.6)
(􏺿 2.5)
(􏺿 2.6)

(􏺽 1.1)
(􏺽 -1.1)
(􏺾 1.9)
(􏺾 -1.9)

(􏺼 1.9)
(􏺼 -1.9)
]



@section+elemref{类型转化：􏺸化、􏺟化、􏻞化、􏻝化}
@margin-note{
@bold{@litchar{􏻛}为新造字}  @linebreak{}
@bold{@litchar{􏻚}为新造字}  @linebreak{}
@bold{@litchar{􏻙}为新造字}  @linebreak{}
@bold{@litchar{􏻘}为新造字}  @linebreak{}
@itemlist[
@; @item{@litchar{禸}：偶数的，@litchar{偶}的简写。}
]
}
@; 对于“粊”而言，最常使用的子概念是：“􏻛”（正数）、“􏻚”（负数）、“􏻙”（奇数）、“􏻘”（偶数）。

@examples[#:eval (the-eval)
]




@section[#:tag "number-types"]{数的类型例程}
@defmapping[racket/base/number-types]

@section[#:tag "generic-numerics"]{数的运算例程}
@defmapping[racket/base/generic-numerics]
