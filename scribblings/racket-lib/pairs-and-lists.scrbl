#lang scribble/manual

@(require (for-label racket ming ming/list)
           scribble/eval
           ming/scribble
           )
@(define the-eval
         (make-eval-factory '(ming/racket/base ming/racket/list)))

@(require (file "../../private/scribble-styles/css/ming-fonts.css.rkt"))
@css/ming-fonts
@(require scribble-rainbow-delimiters)
@script/rainbow-delimiters*


@title[#:tag "pairs-and-lists"]{双和􏿴}
@margin-note{另见名扩展库：@secref["ming-list"]}
“双”（@tech[#:doc '(lib "scribblings/reference/reference.scrbl") "pair"]）是LISP语言最最基础的数据结构。


@section[#:tag "list-rules"]{例程命名规则}
见@secref["naming-rules"]，有：

@tabular[@;#:sep @hspace[0]
         #:style 'boxed
         #:column-properties '(center)
         #:row-properties '(border)
         (list (list @bold{成字} @bold{含义} @bold{进出参} @bold{举例})
               (list
               @elem{@bold{@litchar{􏿴}}偏旁}
               @elem{构造生成规律元素所组成的@racket[􏿴]}
               @elem{出参数据结构是@racket[􏿴]}
               @elem{@racket[􏼓]、@racket[􏼎]、@racket[􏼏]、@racket[􏿝]}
               )
               (list
               @elem{左偏旁@bold{@litchar{亻}}}
               "相似集（类型相同且元素相似）"
               @elem{出参数据与进参数据相比，类型相同且内容类似}
               @elem{@racket[伄]、@racket[𰁣]、@racket[攸]、@racket[𰂋]、@racket[偏]、@racket[􏾜]、@racket[􏾛]、@racket[偅]、@racket[𠆯]、@racket[􏷹]、@racket[仔?]}
               )
               (list
               @elem{右偏旁@bold{@litchar{阝}}}
               "连续集（类型相同且元素连续相同）"
               @elem{出参数据与进参数据相比，类型相同且前者是后者的一部分}
               @elem{@racket[􏾝]、@racket[􏾺]、@racket[𨚞]、@racket[䢼]、@racket[𬩽]}
               )
               (list
               @elem{右偏旁@bold{@litchar{刂}}}
               "缺失集（删除、移走、去掉部分元素之后的集合）"
               @elem{出参数据与进参数据相比，类型相同且前者是后者的子集}
               @elem{@racket[􏷵]、@racket[􏷴]、@racket[􏺊]、@racket[􏾘]、@racket[𠝤]、@racket[􏷶]、@racket[􏷲]}
               )
               (list
               @elem{左偏旁@bold{@litchar{土}}}
               "“构建”、“创建”的意思"
               @elem{出参类型不一而多变}
               @elem{@racket[垎]}
               )
               (list @bold{组词} @bold{-} @bold{-} @bold{-})
               (list
               @elem{以@bold{@litchar{分}}结尾}
               "分离成复值"
               @elem{出参数据为复值}
               @elem{@racket[􏾺分]、@racket[𨚞分]、@racket[䢼分]、@racket[􏷳分]、@racket[􏷹分]}
               )
               (list @bold{标点} @bold{-} @bold{-} @bold{-})
               (list
               @elem{以@bold{@litchar{*}}结尾}
               "加强力度至出参"
               "出参内容更加丰富"
               @elem{@racket[弓*]、@racket[􏼏*]}
               )
               (list
               @elem{以@bold{@litchar{~}}结尾}
               "减轻力度至出参"
               "出参内容更加贫瘠"
               @elem{@racket[􏷲~]、@racket[􏷶~]}
               )
               @; (list
               @; @elem{以@bold{@litchar{v}}结尾}
               @; @elem{加强力度（且改变出参成@racket[􏿴]）}
               @; @elem{出参内容更加丰富且被封装成@racket[􏿴]数据结构}
               @; @elem{@racket[引v]}
               @; )
               (list
               @elem{以@bold{@litchar{^}}结尾}
               @elem{加强力度（通过改变入参成@racket[􏿴]）}
               @elem{入参内容更加丰富且被封装进@racket[􏿴]数据结构}
               @elem{@racket[􏷲^]、@racket[伄^]、@racket[􏾘^]}
               )
               @; (list
               @; @elem{以@litchar{􏿴}结尾}
               @; @elem{构造生成@racket[􏿴]数据}
               @; @elem{出参数据结构是@racket[􏿴]}
               @; @elem{@racket[序􏿴]、@racket[复􏿴]、@racket[𥸬􏿴]}
               @; )
               (list
               @elem{以@bold{@litchar{/}}符号分割}
               @elem{@litchar{/}之后的内容是为修饰@litchar{/}之前的内容的}
               @elem{出参数据由@litchar{/}之前的内容决定}
               @elem{@racket[􏿴/组合]、@racket[􏿴/分组]}
               )

               (list @bold{混合} @bold{-} @bold{-} @bold{-})
               (list
               @elem{@bold{@litchar{/入}}}
               "进参为函数"
               @elem{进参并非常规数据，而是函数}
               @elem{@racket[巨/入]、@racket[弓/入]、@racket[𰁣/入]、@racket[𬩽/入]、@racket[􏿁/入]、@racket[攸/入]、@racket[􏾺/入]、@racket[𨚞/入]}
               )
         )]

@section+elemref[#:tag "pair-car-cdr-list-list*"]{双，􏿴、􏿫}
对于名语言来说，如果我们把两个数据配成对（@racket[双]在一块），我们就得到一个“双”，而双在一块的这两个数据分别处于他们所构成的这个“双”的@racket[阳]位和@racket[阴]位。

进而，@elemtag["what-is-􏿴􏿫" "如果一个“双”的阴位存的是另外一个“双”，数个双如此前后相接成链状："]
@itemlist[
@item{末尾双的阴位留@racket[空]，这样的数据结构称之为@racket[􏿴]（@racket[list]）；}
@item{末尾双的阴位不留@racket[空]，这样的数据结构称之为@racket[􏿫]（@racket[list*]）。}
]

@margin-note{
@bold{@litchar{􏿴}、@litchar{􏿫}为@elemtag["the-char-creating-of-􏿴􏿫" "新造字"]}
@itemlist[
@item{
因其所代表的数据结构（list）和@litchar{双}所代表的数据结构（pair）互相之间的内生性变换转化关系而得造：
@itemlist[
@item{多个“@racket[双]”互相衔接并且最后一个双的阴位留空即成“@racket[􏿴]”（不留空是为@racket[􏿫]）；}
@item{每一个“􏿴”类型的数据同时也是“双”类型。}
]
}
@item{
两字由@litchar{又}和@litchar{㐅}、@litchar{又}组成，含义：
@itemlist[
@item{其中左起半包围结构的@litchar{又}表示其是一种类似链一样的内部元素之间依次互相衔接、可以向后延绵不绝的数据结构；}
@item{其中被包围的居于之后的@litchar{㐅}（组成@litchar{􏿴}）表示本数据结构的末位元素总是一个空值。}
@item{其中被包围的居于之后的@litchar{又}（组成@litchar{􏿫}）表示本数据结构的末位元素不是空值。}
]
}
]
}

@examples[#:eval (the-eval)
(双 1 2)

(双 1 (双 2 (双 3 (双 4 空))))
(􏿴 1 2 3 4)

(双 1 (双 2 (双 3 4)))
(􏿫 1 2 3 4)
(􏿫 1 2 3 '(4))
]

@section+elemref{阴、阳，阴之阳、阳之阳、阴之阴阳、阳之阴阳}
@margin-note{
“阴”、“阳”是@hyperlink["https://zh.wikipedia.org/wiki/%E5%A4%A9%E5%B9%B2"]{中国传统哲学的一种二元论观念}。
}
@examples[#:eval (the-eval)
(阳 '(1 . 2))
(阴 '(1 . 2))

(阳 '(1 2 3 4))
(阴 '(1 2 3 4))
(阴之阳 '(1 2 3 4))
(阴之阴阳 '(1 2 3 4))

(阳 '((1 1.1) 2 3 4))
(阳之阳 '((1 1.1) 2 3 4))
(阳之阴阳 '((1 1.1) 2 3 4))
]

@section+elemref{􏼏、􏼏*}
用于构造元素是一段连续数字的􏿴。
@margin-note{
@; @bold{@litchar{𥸬}为古活字}
@bold{@litchar{􏼏}为新造字}
@itemlist[
@item{@litchar{米}：@litchar{数}的简写，见@racket[米?]；}
@; @item{@litchar{阝}、@litchar{􏿴}，见：@secref["list-rules"]。}
]
}
@examples[#:eval (the-eval)
(􏼏 10)
(􏼏 10 20)
(􏼏 10 20 2)
(􏼏* 10 20)
(􏼏* 10 20 2)
]

@section+elemref{􏼓、􏼎}
用于构造@elemref["what-is-􏿴􏿫" "􏿴"]类型的数据。
@margin-note{
@bold{@litchar{􏼓}为新造字}  @linebreak{}
@bold{@litchar{􏼎}为新造字}
@itemlist[
@item{@litchar{弔}：原被用于“索引”之意（见@racket[弔]），但因索引是从零开始的序数，在此借用为“序数”之意；}
@item{@litchar{三}：道生一，一生二，二生三，三生万物，故三个相同的@litchar{一}在此为“若干个相同元素”之意；}
]
}
@examples[#:eval (the-eval)
(􏼓 5 'foo)
(􏼎 5 殖)
(􏼎 5 􏽊)
(􏼎 5 (入 (n)
        (􏼓 n 'foo)))
]

@section+elemref{􏿝、􏿜}
用于对@elemref["what-is-􏿴􏿫" "􏿴"]类结构数据进行处理并输出相同于@racket[􏿴]、@racket[􏿫]例程输出数据之结构的数据。
@margin-note{
@bold{@litchar{􏿝}、@litchar{􏿜}为新造字}
@itemlist[
@item{两字分别是仿照@elemref["the-char-creating-of-􏿴􏿫" "􏿴、􏿫"]字而造：因为与他们处理数据后输出的结果之数据类型相同（不同在于新造字例程的输入参数之数据类型为@elemref["what-is-􏿴􏿫" "􏿴"]）；}
@item{左上起笔处的偏旁@litchar{毌}，表示“贯穿”之意（@litchar{毌}是@litchar{贯}的古字）：因此意思即为把数个@elemref["what-is-􏿴􏿫" "􏿴"]贯穿起来组成一个新的@elemref["what-is-􏿴􏿫" "􏿴"]并返回之。}
]
}
@examples[#:eval (the-eval)
(􏿴 1 2 3 4)
(􏿝 '(1) '(2) '(3) '(4))
(􏿝 '(1) '(2 3 4) '(5 6) '(7))
(􏿝 '(a b) 'c)
(􏿝 '(a b) '(c . d))
(􏿝 '() 'a)
(􏿝 'a)

(􏿫 1 2 3 4)
(􏿜 '(1) '(2) '(3) '(4))
(􏿜 '(1) '(2 3 4) '(5 6) '(7))

(􏿫 1 2 3 '(4))
(􏿜 '(1) '(2) '(3) '((4)))
(􏿜 '(1) '(2 22) '(3 33) '((4 44)))
(􏿜 '(1) '(2 22) '((3 33)) '((4 44)))
(􏿜 '(a b) '(c))
(􏿜 '(a b) '((c . d)))
(􏿜 '() '(a))
(􏿜 '(a))
]


@section+elemref{攸}
修改􏿴中的某个元素为新值并返回修改后的􏿴。
@margin-note{
@bold{@litchar{攸}为古活字}
@itemlist[
@item{@litchar{攵}本意是“用手敲打敦促使其改变”，在此引申为“修改”之意；}
@item{另外，也可以认为该字分别取@litchar{修}字左部的偏旁（@litchar{亻丨}）和@litchar{改}字右部偏旁（@litchar{攵}）组成，也即含有“修改”的意思。}
]
}
@examples[#:eval (the-eval)
(攸 '(10 15 20 25) 1 1555)
(攸/入 '(10 15 20 25) 1 􏽊)
]


@section+elemref{甲、乙、丙、丁、戊、己、庚、辛、壬、癸}
@margin-note{
“甲”、“乙”、“丙”、“丁”、“戊”、“己”、“庚”、“辛”、“壬”、“癸”是@hyperlink["https://zh.wikipedia.org/wiki/%E5%A4%A9%E5%B9%B2"]{中国古代的一种文字记序符号} 。
}
@examples[#:eval (the-eval)
(甲 '(1 2 3 4 5 6 7 8 9 10))
(乙 '(1 2 3 4 5 6 7 8 9 10))
(丙 '(1 2 3 4 5 6 7 8 9 10))
(癸 '(1 2 3 4 5 6 7 8 9 10))
]

@section+elemref{末、􏹥}
返回􏿴中末尾位置的元素。
@margin-note{
@bold{@litchar{􏹥}为新造字}
@itemlist[
@item{@litchar{末}：见@racket[末]；}
@item{@litchar{又}：@litchar{双}的简写，见@racket[双]。}
]
}
@examples[#:eval (the-eval)
(末 '(1 2 3 4))
(􏹥 '(1 2 3 4))
(􏹥 '(1 2 3 . 4))
]

@section+elemref{巨}
@margin-note{
@bold{@litchar{巨}为活用字}
@itemlist[
@item{@litchar{巨}：测量返回长度（本意是“木工用方尺做丈量”（圆是规，方是矩，固有“无规矩不成方圆”之说））。}
]
}
@margin-note{另见：@racket[巨/入]}
@examples[#:eval (the-eval)
(巨 '(a b c d e 3 f g))
]


@section+elemref{弔，弓、弓/入，𰁣、𰁣/入}
@margin-note{
@bold{@litchar{弔}为古活字} @linebreak{}
@bold{@litchar{弓}为活用字}
@itemlist[
@item{@litchar{弔}：@litchar{第}的简写，像是绳子缠绕在树干表皮上，表示是用某索引提取相对应的值。}
@item{@litchar{弓}：@litchar{引}的简写，像是缠绕在树干表皮上的绳子，即“索引”的意思，亦即返回某值的索引；}
@item{@litchar{亻}，见：@secref["list-rules"]。}
]
}
@margin-note{另见：@racket[伄]、@racket[􏾘]、@racket[􏾝]，@racket[弓*]、@racket[弓*/入]}
@examples[#:eval (the-eval)
(弔 '(a b c d e c f) 2)

(弓 '(a b c d e c f) 'c)
(𰁣 '(a b c d e c f) 'c)

(弓/入 '(a b 11 d 22 c f) 米?)
(𰁣/入 '(a b 11 d 22 c f) 米?)
]

@section+elemref{􏾺、𨚞，􏷵、􏷴，􏾺分、𨚞分，􏾺/入、𨚞/入，􏾺于?}
@margin-note{
@bold{
@litchar{􏾺}、@litchar{𨚞}为新造字 @linebreak{}
@litchar{􏷵}、@litchar{􏷴}为新造字
}
@itemlist[
@item{@litchar{左}：从左；}
@item{@litchar{右}：从右；}
@item{@litchar{口}：@litchar{右}的简写；}
@item{@litchar{阝}、@litchar{刂}见：@secref["list-rules"]。}
]
}
@margin-note{另见：@racket[􏺊]}
@examples[#:eval (the-eval)
(􏾺 '(a b c d e f g) 2)
(𨚞 '(a b c d e f g) 2)

(􏷵 '(a b c d e f g) 2)
(􏷴 '(a b c d e f g) 2)

(􏾺分 '(a b c d e f g) 2)
(𨚞分 '(a b c d e f g) 2)

(􏾺/入 '(8 4 a b 1 c d 2 e f g 3 5 9) 米?)
(𨚞/入 '(8 4 a b 1 c d 2 e f g 3 5 9) 米?)

(􏾺于? '(a b) '(a b c d e f g))
(􏾺于? '(a b z) '(a b c d e f g))
]

@section+elemref{䢼，􏷳分，䢼分}
@margin-note{
@bold{@litchar{䢼}、@litchar{􏷳}为新造字}
@itemlist[
@item{@litchar{共}：共同、共有；}
@item{@litchar{阝}、@litchar{刂}，见：@secref["list-rules"]。}
]
}
@examples[#:eval (the-eval)
(䢼 '(a b x y z) '(a b c d e f g))
(􏷳分 '(a b x y z) '(a b c d e f g))
(䢼分 '(a b x y z) '(a b c d e f g))
]


@section+elemref{𰂋，偏，􏾜，重、𠝤}
@margin-note{
@bold{
@litchar{𰂋}为新造字 @linebreak{}
@litchar{偏}为活用字 @linebreak{}
@litchar{􏾜}为新造字 @linebreak{}
@litchar{𠝤}为古活字
}
@itemlist[
@item{@litchar{间}：间以；}
@item{@litchar{扁}：扁平；}
@item{@litchar{糸}：乱（@litchar{紊}去掉声旁，@litchar{紊}是“乱”的意思（故有成语“有条不紊”））；}
@item{@litchar{重}：重复之元素；}
@item{@litchar{亻}、@litchar{刂}，见：@secref["list-rules"]。}
]
}

@margin-note{
另见：@racket[偅]
}

@examples[#:eval (the-eval)
(𰂋 '(a b c d) '和)
(偏 '((a b) (c d) (e f)))
(􏾜 '(a b c d e d c b a))

(重 '(a b c d e d c b a))
(𠝤 '(a b c d e d c b a))
]


@section+elemref{􏾛、𠆯}
@margin-note{
@bold{@litchar{􏾛}为新造字} @linebreak{}
@bold{@litchar{𠆯}为古活字}
@itemlist[
@item{@litchar{屰}：倒序（通@litchar{逆}，甲骨文、金文是“一个倒立的人”）；}
@item{@litchar{川}：理顺（类比@litchar{驯}、@litchar{训}而得造）。}
@item{@litchar{亻}，见：@secref["list-rules"]。}
]
}
@examples[#:eval (the-eval)
(􏾛 '(21 3 888 666 55 77 1000))
(𠆯 '(21 3 888 666 55 77 1000) <)
(𠆯 '(21 3 888 666 55 77 1000) >)
(𠆯 '("cat" "dog" "chicken" "duck" "fox") 句<?)
(𠆯 '("cat" "dog" "chicken" "duck" "fox") 句>?)
]

@section+elemref{𬩽、𬩽/入，􏿁、􏿁/入，􏷲~、􏷲^}
@margin-note{
@bold{@litchar{􏿁}为新造字} @linebreak{}
@bold{@litchar{𬩽}为古活字} @linebreak{}
@bold{@litchar{􏷲}为新造字}
@itemlist[
@item{@litchar{寻}表意“寻找”；}
@item{@litchar{日}偏旁表示“取@racket[阳]”之意。}
@item{@litchar{亻}、@litchar{刂}，见：@secref["list-rules"]。}
]
}
@; @margin-note{
@; @bold{“@racket[刈]”为古活字}
@; @itemlist[
@; @item{@litchar{㐅}表意，“删除”的意思；}
@; @item{@litchar{刂}见：@secref["list-rules"]。}
@; ]
@; }
@margin-note{另见：@racket[􏷲]，@racket[􏾘]}
@examples[#:eval (the-eval)
(𬩽 'c '(a b c d e f))
(􏿁 'c '((a b) (c d) (e f)))
(𬩽/入 米? '(a b 1 c d 3 e 9 f))
(􏿁/入 米? '((a b) (1 d) (j k) (8 f))) ;;

(􏷲~ 'c '(a b c d e c f))
(􏷲^ '(c e) '(a b c d e c f))
]

@section+elemref{查、􏷹，􏷶、􏷶~，􏷹分，􏷹巨}
@margin-note{
@bold{
@litchar{􏷹}为新造字 @linebreak{}
@litchar{􏷶}为新造字
}
@itemlist[
@item{@litchar{查}：查询；}
@item{@litchar{亻}、@litchar{刂}，见：@secref["list-rules"]。}
]
}
@margin-note{另见：@racket[巨]、@racket[巨/入]}
@examples[#:eval (the-eval)
(查 􏻛? '(1 2 -3 4 -5))
(􏷹 􏻛? '(1 2 -3 4 -5))
(􏷶 􏻛? '(1 2 -3 4 -5))
(􏷶~ 􏻛? '(1 2 -3 4 -5))
(􏷹分 􏻛? '(1 2 -3 4 -5)) @; 􏾽离 would still be list
(􏷹巨 􏻛? '(1 2 -3 4 -5))
]

@section+elemref{各，佫，􏷮、􏷭，垎、右垎，佫􏷹、佫􏿝} @;􏷮，􏷭
@margin-note{
@bold{@litchar{佫}为古活字} @linebreak{}
@; @bold{@litchar{􏷬}为新造字} @linebreak{}
@; @bold{@litchar{㦴}为古活字} @linebreak{}
@bold{@litchar{􏷮}为新造字} @linebreak{}
@bold{@litchar{􏷭}为新造字} @linebreak{}
@bold{@litchar{垎}为活用字}
@itemlist[
@item{@litchar{各}：表意，各个元素依次；}
@item{@litchar{夂}：@litchar{各}的简写；}
@item{@litchar{亻}，见：@secref["list-rules"]；}
@item{@litchar{土}，表意，构建。见：@secref["list-rules"]；}
@item{@litchar{且}：见@racket[且]；}
@item{@litchar{戈}：@litchar{或}的简写，见@racket[或]；}
]
}
@margin-note{
为便理解，列下代码，两两等同：
@itemlist[
@item{@code{(佫 某例程 (􏿴 a b c))}}
@item{@code{(􏿴 (某例程 a) (某例程 b) (某例程 c))}}
@item{@code{(􏷮 某例程 (􏿴 a b c))}}
@item{@code{(且 (某例程 a) (某例程 b) (某例程 c))}}
@item{@code{(􏷭 某例程 (􏿴 a b c))}}
@item{@code{(或 (某例程 a) (某例程 b) (某例程 c))}}
@item{@code{(垎 某例程 z (􏿴 a b c))}}
@item{@code{(某例程 c (某例程 b (某例程 a z)))}}
@item{@code{(右垎 某例程 z (􏿴 a b c))}}
@item{@code{(某例程 a (某例程 b (某例程 c z)))}}
]
}

@examples[#:eval (the-eval)
(各 行示 (􏿴 2 4 6 8))
(佫 􏽊 '(1 2 3 4))
(佫 + '(1 2 3 4) '(100 200 300 400))

(􏷮 􏻛? '(1 2 -3 4))
(􏷮 + '(1 2 3 4) '(100 200 300 400))

(􏷮 􏻚? '(1 2 -3 4))
(􏷭 + '(1 2 3 4) '(100 200 300 400))

(垎 + 0 '(1 2 -3 4))
(垎 双 '() '(1 2 -3 4))
(右垎 双 '() '(1 2 -3 4))

(佫􏷹 (入 (x) (且 (􏻛? x) (􏽊 x))) '(1 3 -4 5))
(佫􏿝 vector->list '(#(1) #(2 3) #(4)))
]


@section+elemref{佫之􏻡、佫之􏻠}
@examples[#:eval (the-eval)
(佫之􏻡 char->integer '(#\a #\y #\b #\k #\c #\j #\d))
(佫之􏻠 char->integer '(#\a #\y #\b #\k #\c #\j #\d))
(佫之􏻡 阳 '((3 pears) (1 banana) (2 apples)))
(佫之􏻠 阳 '((3 pears) (1 banana) (2 apples)))
]


@section+elemref{􏿴/组合、􏿴/排列组合，􏿴/笛卡尔积，􏿴/分组}
@examples[#:eval (the-eval)
(􏿴/组合 '(a b c))
(􏿴/排列组合 '(a b c))
(􏿴/笛卡尔积 '(1 2 3) '(a b c))
(􏿴/分组 米? '(1 a 2 b 3 c))
]


@section[#:tag "list-base"]{基础例程}
@defmapping[
racket/base/pairs-and-lists
(
[空 "空"]
)
]
@section[#:tag "list-additional"]{扩展例程}
@defmodule[ming/racket/list]
@defmapping[racket/list]
