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
@margin-note{另见名扩展库：@secref["ming-lists"]}

@section[#:tag "rules"]{例程命名规则}
除总@secref["naming-rules"]外，另有：

@tabular[@;#:sep @hspace[0]
         #:style 'boxed
         #:column-properties '(center)
         #:row-properties '(border)
         (list (list @bold{规则} @bold{含义} @bold{进出参} @bold{举例})
               @; (list
               @; @elem{上偏旁@litchar{㐅}}
               @; "删除、移走、去掉"
               @; "仅对数据内容产生影响"
               @; @elem{@racket[􏾹]、@racket[􏾸]、@racket[􏿄]、@racket[􏾼]}
               @; )
               (list
               @elem{左偏旁@litchar{亻}}
               "相似集（类型相同且元素相似）"
               @elem{出参数据与进参数据相比，类型相同且内容类似}
               @elem{@racket[𠇁]、@racket[攸]、@racket[𰂋]、@racket[偏]、@racket[􏾷]、@racket[仮]、@racket[􏿀]、@racket[􏷹]}
               )

               (list
               @elem{右偏旁@litchar{阝}}
               "连续集（类型相同且元素连续相同）"
               @elem{出参数据与进参数据相比，类型相同且前者是后者的一部分}
               @elem{@racket[􏾝]、@racket[􏾺]、@racket[𨚞]、@racket[𬩵]、@racket[䢼]、@racket[𬩽]}
               )

               (list
               @elem{右偏旁@litchar{刂}}
               "缺失集（删除、移走、去掉部分元素之后的集合）"
               @elem{出参数据与进参数据相比，类型相同且前者是后者的子集}
               @elem{@racket[􏷵]、@racket[􏷴]、@racket[𠝤]、@racket[􏷶]、@racket[􏷲~]}
               )


               (list
               @elem{左偏旁@litchar{土}}
               "“构建”、“创建”的意思"
               @elem{出参类型不一而多变}
               @elem{@racket[垎]}
               )

               (list
               @elem{以@litchar{分}结尾}
               "分离成复值"
               @elem{出参数据为复值}
               @elem{@racket[􏾺分]、@racket[𨚞分]、@racket[䢼分]、@racket[􏷹分]}
               )

               (list
               @elem{以@litchar{*}结尾}
               "加强力度（对出参）"
               "出参内容更加丰富"
               @elem{@racket[􏿴/数段*]}
               )

               (list
               @elem{以@litchar{^}结尾}
               "加强力度（对入参）"
               "入参是􏿴数据结构"
               @elem{@racket[􏷲^]}
               )

               (list
               @elem{以@litchar{~}结尾}
               "减轻力度"
               "出参内容更加贫瘠"
               @elem{@racket[􏷲~]、@racket[􏷶~]}
               )

               (list
               @elem{以@litchar{/}符号分割}
               @elem{@litchar{/}之后的内容是为修饰@litchar{/}之前的内容的}
               @elem{出参数据由@litchar{/}之前的内容决定}
               @elem{@racket[􏿴/数段]、@racket[􏿴/组合]}
               )

               (list
               @elem{@litchar{/入}}
               "进参为函数"
               @elem{进参并非常规数据，而是函数}
               @elem{@racket[度/入]、@racket[引/入]、@racket[𠇁/入]、@racket[𬩽/入]、@racket[􏿁/入]、@racket[攸/入]、@racket[􏾺/入]、@racket[𨚞/入]}
               )

               @; (list
               @; @elem{@litchar{之}}
               @; "的"
               @; @elem{影响出参，出参数据由@litchar{之}之后的内容决定}
               @; @elem{@racket[𮞑而􏾽]、@racket[𮞑而􏿝] @linebreak{} @racket[𮞑而最小数]}
               @; )

               @; (list
               @; @elem{@litchar{而}}
               @; "进而"
               @; @elem{影响出参，出参数据由@litchar{而}之后的内容决定}
               @; @elem{@racket[𮞑而􏾽]、@racket[𮞑而􏿝] @linebreak{} @racket[𮞑而最小数]}
               @; )
         )
         ]

@; @item{凡是以“􏿴”字结尾的，均表示输出结果是􏿴。此如：@racket[􏿴]、@racket[􏿴~]、@racket[序􏿴]、@racket[复􏿴]等。}
@; @item{含有“彳”偏旁的例程，表示其出参数据之结构是@racket[􏾴]类型。此如：@racket[􏿆]、@racket[􏿅]等。}
@; @item{例程名采用单字的，并且在构字外形上是类似“􏿴”字这样的半包围结构的，表示其出参数据之结构是@elemref["what-is-􏿴􏿫" "􏿴"]类型。此如：@racket[􏿫]、@racket[􏿛]、@racket[􏿝]、@racket[􏿜]等。}
@; @item{例程名采用单个字的，@elemref["what-is-􏿴􏿫" "􏿴"]类型的数据作为入参位于首位，此如@racket[第]、@racket[笈]、@racket[佐]、@racket[佑]、@racket[间]、@racket[理]等。}
@; @item{例程名采用多个字的，@elemref["what-is-􏿴􏿫" "􏿴"]类型的数据作为入参通常位居末位，此如：@racket[计数]、@racket[查找]、@racket[筛选]等。}


@section+elemref[#:tag "pair-car-cdr-list-list*"]{双，􏿴、􏿫}
“双”（@tech[ #:doc '(lib "scribblings/reference/reference.scrbl") "pair"]）是LISP语言最最基础的数据结构：
对于名语言来说，如果我们把两个数据配成对（@racket[双]在一块），我们就得到一个“双”，而双在一块的这两个数据分别处于他们所构成的这个“双”的@racket[阳]位和@racket[阴]位。

进而，@elemtag["what-is-􏿴􏿫" "如果一个“双”的阴位存的是另外一个“双”，数个双如此前后相接成链状："]
@itemlist[
@item{末尾双的阴位留@racket[空]，这样的数据结构称之为@racket[􏿴]（@racket[list]）；}
@item{末尾双的阴位不留@racket[空]，这样的数据结构称之为@racket[􏿫]（@racket[list*]）。}
]

@margin-note{
@bold{“@racket[􏿴]”、“@racket[􏿫]”为@elemtag["the-char-creating-of-􏿴􏿫" "新造字"]}
@itemlist[
@item{
因其所代表的数据结构（list）和“@racket[双]”所代表的数据结构（pair）互相之间的内生性变换转化关系而得造：
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


@section+elemref{􏿴/数段、􏿴/数段*}
用于构造一个元素是一段整数的􏿴。
@examples[#:eval (the-eval)
(􏿴/数段 10)
(􏿴/数段 10 20)
(􏿴/数段 10 20 2)
(􏿴/数段* 10 20)
(􏿴/数段* 10 20 2)
]

@section+elemref{序􏿴、复􏿴}
用于构造@elemref["what-is-􏿴􏿫" "􏿴"]类型的数据。
@examples[#:eval (the-eval)
(􏿴/复 5 'foo)
(􏿴/序 5 殖)
(􏿴/序 5 加一)
(􏿴/序 5 (入 (n)
        (􏿴/复 n 'foo)))
]

@section+elemref{攸}
修改􏿴中的某个元素为新值并返回修改后的􏿴。
@margin-note{
@bold{“@racket[攸]”为古活字}
@itemlist[
@item{@litchar{攵}本意是“用手敲打敦促使其改变”，在此引申为“修改”之意；}
@item{@litchar{亻}和@litchar{攵}中间的@litchar{丨}表示只修改了@elemref["what-is-􏿴􏿫" "􏿴"]中的一项元素；}
@item{另外，也可以认为该字分别取@litchar{修}字左部的偏旁（@litchar{亻丨}）和@litchar{改}字右部偏旁（@litchar{攵}）组成，也即含有“修改”的意思。}
]
}
@examples[#:eval (the-eval)
(攸 '(10 15 20 25) 1 1555)
(攸/入 '(10 15 20 25) 1 加一)
]

@; @section{􏿛}
@; 用于修改一个􏿴类型的数据。
@; @margin-note{
@; @bold{“@racket[􏿛]”为新造字}
@; @itemlist[
@; @item{右边的“􏿴”偏旁表示和“@racket[􏿴]”的出参数据类型是相同的（即@elemref["what-is-􏿴􏿫" "􏿴"]）；}
@; @item{左边“亻”偏旁表示入参和出参的数据之内容相似且类型相同（均为@elemref["what-is-􏿴􏿫" "􏿴"]）； }
@; @item{“亻”偏旁和“􏿴”偏旁之间的“丨”表示入参数据和出参数据之内容的不同之处只有一项。}
@; ]
@; }
@; @examples[#:eval (the-eval)
@; (􏿛 '(10 15 20 25) 1 1555)
@; (􏿛/入 '(10 15 20 25) 1 加一)
@; ]

@section+elemref{􏿝、􏿜}
用于对@elemref["what-is-􏿴􏿫" "􏿴"]类结构数据进行处理并输出相同于@racket[􏿴]、@racket[􏿫]例程输出数据之结构的数据。
@margin-note{
@bold{“@racket[􏿝]”、“@racket[􏿜]”为新造字}
@itemlist[
@item{两字分别是仿照@elemref[ "the-char-creating-of-􏿴􏿫" "􏿴、􏿫"]字而造：因为与他们处理数据后输出的结果之数据类型相同（不同在于新造字例程的输入参数之数据类型为@elemref["what-is-􏿴􏿫" "􏿴"]）；}
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

@section+elemref{末、􏷽}
返回􏿴中末尾位置的元素。
@margin-note{
@bold{“@racket[􏷽]”为新造字}
@itemlist[
@item{因字所代表之例程的入参和操作入参的处理行为与“@racket[末]”类似而得偏旁@litchar{末}；}
@item{又因其返回结果的数据之结构与“@racket[双]”的返回类似而得偏旁@litchar{又}。}
]
}
@examples[#:eval (the-eval)
(末 '(1 2 3 4))
(􏷽 '(1 2 3 4))
@; (首 '(1 2 3 4))
@; (身 '(1 2 3 4))
@; (尾 '(1 2 3 4))
]

@section+elemref{度} @; 度􏷹 = 度/入
@margin-note{另见：@racket[度/入]}
@examples[#:eval (the-eval)
(度 '(a b c d e 3 f g))
@; (度/入 数? '(a b c d e 3 f g))
]

@; @section+elemref{第，笈、笈/入，􏿊、􏿊/入}
@; @; 用于索引􏿴中的元素和查找􏿴中某元素的索引（另见：@racket[􏿊]、@racket[􏿚]）。
@; @margin-note{
@; @bold{“@racket[笈]”为古活字}
@; @itemlist[
@; @item{原义不存，因其形和“@racket[第]”字能对仗呼应，故此使用之。}
@; ]
@; @bold{“@racket[􏿊]”为新造字}
@; }

@; @examples[#:eval (the-eval)
@; (第 '(a b c d e c f) 2)
@; (笈 '(a b c d e c f) 'c)
@; (笈/入 '(a b c d e c f)
@;          (入 (x)
@;              (或 (同? x 'b)
@;                  (同? x 'c))))

@; (􏿊 '(a b c d e c f) 'c)
@; (􏿊/入 '(a b c d e c f)
@;          (入 (x)
@;              (或 (同? x 'b)
@;                  (同? x 'c))))
@; ]

@; @section+elemref{挮，扱、扱/入，伋、伋/入}
@; @margin-note{
@; @bold{“@racket[挮]”为古活字}
@; @itemlist[
@; @item{原义不存，是在@litchar{弟}的基础上增加@litchar{扌}偏旁而得用；}
@; @item{@litchar{弟}在古代通@litchar{第}，故在此借用其意。}
@; ]
@; @bold{“@racket[扱]”为古活字}
@; @itemlist[
@; @item{原义不存，因其形和“@racket[挮]”字能对仗呼应，故此使用之。}
@; ]
@; @bold{“@racket[伋]”为古活字}
@; @itemlist[
@; @item{原义不存，修改@litchar{扱}的偏旁@litchar{扌}为@litchar{亻}以暗示出参类型。}
@; ]
@; }

@; @section+elemref{𫼛，弔、弔/入，伄、伄/入}
@; @margin-note{
@; @bold{“@racket[弔、𫼛、伄]”为古活字}
@; @itemlist[
@; @item{@litchar{弔}像是木桩上缠绕的绳子，借以表示“索引”的意思；}
@; @item{@litchar{𫼛}是对@litchar{弔}加@litchar{扌}，表示提取某索引处的值。}
@; @item{@litchar{伄}是对@litchar{弔}加@litchar{亻}，含义见：@secref["rules"]。}
@; ]
@; }

@section+elemref{引、引/入，𠇁、𠇁/入、弔}
@margin-note{
@bold{“@racket[𠇁]”为古活字} @linebreak{}
@bold{“@racket[弔]”为古活字}
@itemlist[
@item{@litchar{引}是“索引”的意思，即返回某值的索引；}
@item{@litchar{𠇁}是对@litchar{引}加@litchar{亻}，含义见：@secref["rules"]。}
@; @item{@litchar{𢪉}是对@litchar{引}加@litchar{扌}，表示用某索引提取相对应的值。}
@item{@litchar{弔}（可以认为是@litchar{第}的简写）表示是用某索引提取相对应的值。}
]
}
@margin-note{
另见：@racket[引*]、@racket[引*/入]，@racket[𠇁~]、@racket[𠇁~/入]，@racket[伄]、@racket[􏾝]
}
@examples[#:eval (the-eval)
(引 '(a b c d e c f) 'c)
(𠇁 '(a b c d e c f) 'c)
(引/入 '(a b 11 d 22 c f) 数?)
(𠇁/入 '(a b 11 d 22 c f) 数?)
(弔 '(a b c d e c f) 2)
]


@; @margin-note{
@; @itemlist[
@; @item{
@; @bold{“@racket[佐]”、“@racket[佑]”为活古字}
@; @itemlist[
@; @item{原义不存，字中的偏旁“亻”在此有“例程输出结果的数据类型和其入参的数据类型相同”之意。}
@; ]
@;; }
@; @item{
@; @bold{“@racket[􏿐]”、“@racket[􏿏]”为新造字}
@; @itemlist[
@; @item{分别仿照“@racket[佐]”和“@racket[佑]”而造，通过对原字加“㐅”，表示“去除”之意。}
@; ]
@;; }
@; @item{
@; @bold{“@racket[􏿆]”、“@racket[􏿅]”为新造字}
@; 分别仿照“@racket[佐]”和“@racket[佑]”而造：
@; @itemlist[
@; @item{在原字右下角处添加“分”表示“切分”之意思；}
@; @item{“彳”表示例程的出参数据之结构是@racket[􏾴]类型。}
@; ]
@;; }
@; ]
@; }

@; @section+elemref{􏾺、𨚞，􏾹、􏾸，􏾺分、𨚞分，􏾺/入、𨚞/入，􏾺于?}
@; @margin-note{
@; @bold{“@racket[􏾹]”、“@racket[􏾸]”为新造字}
@; }
@section+elemref{􏾺、𨚞，􏷵、􏷴，􏾺分、𨚞分，􏾺/入、𨚞/入，􏾺于?}
@margin-note{
@bold{
“@racket[􏾺]”、“@racket[𨚞]”为新造字 @linebreak{}
“@racket[􏷵]”、“@racket[􏷴]”为新造字
}
@itemlist[
@item{@litchar{左}：从左；}
@item{@litchar{右}：从右；}
@item{@litchar{阝}、@litchar{刂}见：@secref["rules"]。}
]
}
@margin-note{另见：@racket[𬩵]}
@examples[#:eval (the-eval)
(􏾺 '(a b c d e f g) 2)
(𨚞 '(a b c d e f g) 2)

(􏷵 '(a b c d e f g) 2)
(􏷴 '(a b c d e f g) 2)

(􏾺分 '(a b c d e f g) 2)
(𨚞分 '(a b c d e f g) 2)

(􏾺/入 '(8 4 a b 1 c d 2 e f g 3 5 9) 数?)
(𨚞/入 '(8 4 a b 1 c d 2 e f g 3 5 9) 数?)

(􏾺于? '(a b) '(a b c d e f g))
(􏾺于? '(a b z) '(a b c d e f g))
]

@; @section+elemref{左䢼，左䢼分、左􏾶分}
@section+elemref{䢼，􏷳，䢼分}
@margin-note{
@; @bold{“@racket[䢼]”、“@racket[􏾶]”为新造字}
@bold{“@racket[䢼]”、“@racket[􏷳]”为新造字}
@itemlist[
@item{@litchar{共}：共同、共有}
@item{@litchar{阝}、@litchar{刂}，见：@secref["rules"]。}
]
}
@examples[#:eval (the-eval)
(䢼 '(a b x y z) '(a b c d e f g))
(􏷳 '(a b x y z) '(a b c d e f g))
(䢼分 '(a b x y z) '(a b c d e f g))
]


@section+elemref{𰂋，偏，􏾷，重、𠝤} @; 侠 􏿃 􏿄 去偅 𠉗 伻
@; @bold{“@racket[􏿃]”为活用字}
@; @itemlist[
@; @item{“掺”表示把某一值掺入到􏿴中；}
@; @item{“亻”表示出参数据之结构和入参相同（均为􏿴）。}
@; ]

@; @bold{“@racket[侠]”为活用字}
@; @itemlist[
@; @item{@litchar{夹}表意，意为“把某一值夹杂到􏿴中”；}
@; ]

@; @bold{“@racket[伻]”为新造字}
@; @itemlist[
@; @item{@litchar{平}表意，意为“将􏿴中元素做扁平化处理”；}
@; ]

@; @bold{“@racket[𠉗]”为活古字}
@; @itemlist[
@; @item{“乱”字表意，意为“将􏿴中元素做乱序处理”；}
@; @item{“亻”偏旁表示出参数据之结构和入参相同（均为􏿴）；}
@; ]
@; @margin-note{@bold{“@racket[􏿄]”为新造字}}

@margin-note{
@bold{
“@racket[𰂋]”为新造字 @linebreak{}
“@racket[偏]”为活用字 @linebreak{}
“@racket[􏾷]”为新造字 @linebreak{}
“@racket[𠝤]”为古活字
}
@itemlist[
@item{@litchar{间}：间以；}
@item{@litchar{扁}：扁平；}
@item{@litchar{紊}：乱（故有成语“有条不紊”）；}
@item{@litchar{重}：重复之元素；}
@item{@litchar{亻}、@litchar{刂}，见：@secref["rules"]。}
]
}

@examples[#:eval (the-eval)
(𰂋 '(a b c d) '和)
(偏 '((a b) (c d) (e f)))
(􏾷 '(a b c d e d c b a))

(重 '(a b c d e d c b a))
(𠝤 '(a b c d e d c b a))
]


@section+elemref{仮、􏿀} @; 𠍣
@; @bold{“@racket[排]”为新造字}
@; @itemlist[
@; @item{@litchar{排}表意，意为“对􏿴中元素进行排序”。}
@; ]
@margin-note{
@bold{“@racket[仮]”为古活字}
@itemlist[
@item{@litchar{反}表意，意为“反向、倒序”，即为“把􏿴反过来，对􏿴中元素进行倒序排列”。}
]
}
@margin-note{
@bold{“@racket[􏿀]”为新造字}
@itemlist[
@item{@litchar{理}表意，意为“整理，排列”，即为“对􏿴中元素按照一定规则进行整理排序”。}
]
}
@examples[#:eval (the-eval)
(仮 '(21 3 888 666 55 77 1000))
(􏿀 '(21 3 888 666 55 77 1000) <)
(􏿀 '(21 3 888 666 55 77 1000) >)
(􏿀 '("cat" "dog" "chicken" "duck" "fox") 诗<?)
(􏿀 '("cat" "dog" "chicken" "duck" "fox") 诗>?)
]

@section+elemref{𬩽、𬩽/入，􏿁、􏿁/入，􏷲~、􏷲^} @;删/入、删*/入，刈、刈*

@margin-note{
@bold{“@racket[􏿁]”为新造字} @linebreak{}
@bold{“@racket[𬩽]”为古活字} @linebreak{}
@bold{“@racket[􏷲]”为新造字}
@itemlist[
@item{@litchar{寻}表意“寻找”；}
@item{@litchar{日}偏旁表示“取@racket[阳]”之意。}
@item{@litchar{亻}、@litchar{刂}，见：@secref["rules"]。}
]
}
@; @margin-note{
@; @bold{“@racket[刈]”为古活字}
@; @itemlist[
@; @item{@litchar{㐅}表意，“删除”的意思；}
@; @item{@litchar{刂}见：@secref["rules"]。}
@; ]
@; }
@margin-note{另见：@racket[􏷲]}
@examples[#:eval (the-eval)
(𬩽 'c '(a b c d e f))
(􏿁 'c '((a b) (c d) (e f)))
(𬩽/入 数? '(a b 1 c d 3 e 9 f))
(􏿁/入 数? '((a b) (1 d) (j k) (8 f))) ;;

(􏷲~ 'c '(a b c d e c f))
(􏷲^ '(c e) '(a b c d e c f))
@; (删/入 正数? '(1 2 -3 4))
@; (删*/入 正数? '(1 2 -3 4))
]

@section+elemref{查、􏷹，􏷶、􏷶~，􏷹分，􏷹度}
@margin-note{
@bold{
“@racket[􏷹]”为新造字 @linebreak{}
“@racket[􏷶]”为新造字
}
@itemlist[
@item{@litchar{查}：查询；}
@item{@litchar{亻}、@litchar{刂}，见：@secref["rules"]。}
]
}
@margin-note{另见：@racket[度]、@racket[度/入]}
@examples[#:eval (the-eval)
(查 正数? '(1 2 -3 4 -5))
(􏷹 正数? '(1 2 -3 4 -5))
(􏷶 正数? '(1 2 -3 4 -5))
(􏷶~ 正数? '(1 2 -3 4 -5))
(􏷹分 正数? '(1 2 -3 4 -5)) @; 􏾽离 would still be list
(􏷹度 正数? '(1 2 -3 4 -5))
]

@section+elemref{各，佫，􏷮，􏷭，垎、右垎，佫􏷹、佫􏿝}
 @; @margin-note{@bold{“@racket[𮞑]”为古活字}}
@margin-note{
@bold{“@racket[佫]”为古活字} @linebreak{}
@bold{“@racket[􏷮]”为新造字} @linebreak{}
@bold{“@racket[􏷭]”为新造字} @linebreak{}
@bold{“@racket[垎]”为活用字}
@itemlist[
@item{@litchar{各}：表意，各个元素依次；}
@item{@litchar{亻}，见：@secref["rules"]；}
@item{@litchar{土}，表意，构建。见：@secref["rules"]；}
@item{@litchar{且}：见@racket[且]；}
@item{@litchar{或}：见@racket[或]；}
]
}
@margin-note{
下列代码，为便理解，两两等同：
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
(佫 加一 '(1 2 3 4))
(佫 + '(1 2 3 4) '(100 200 300 400))

(􏷮 正数? '(1 2 -3 4))
(􏷮 + '(1 2 3 4) '(100 200 300 400))

(􏷭 负数? '(1 2 -3 4))
(􏷭 + '(1 2 3 4) '(100 200 300 400))

(垎 + 0 '(1 2 -3 4))
(垎 双 '() '(1 2 -3 4))
(右垎 双 '() '(1 2 -3 4))

(佫􏷹 (入 (x) (且 (正数? x) (加一 x))) '(1 3 -4 5))
(佫􏿝 vector->list '(#(1) #(2 3) #(4)))
]


@section+elemref{佫之最大数、佫之最小数}
@examples[#:eval (the-eval)
(佫之最大数 char->integer '(#\a #\y #\b #\k #\c #\j #\d))
(佫之最小数 char->integer '(#\a #\y #\b #\k #\c #\j #\d))
(佫之最大数 阳 '((3 pears) (1 banana) (2 apples)))
(佫之最小数 阳 '((3 pears) (1 banana) (2 apples)))
]


@section+elemref{􏿴/组合、􏿴/排列组合，􏿴/笛卡尔积，􏿴/分组}
@examples[#:eval (the-eval)
(􏿴/组合 '(a b c))
(􏿴/排列组合 '(a b c))
(􏿴/笛卡尔积 '(1 2 3) '(a b c))
(􏿴/分组 数? '(1 a 2 b 3 c))
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

@; @(defthing #:kind "汉化" cn-sab (unsyntax (elem "reason .... here")) #:value en-sab)

@; @(define-namespace-anchor anchor)
@; @(define ns (namespace-anchor->namespace anchor))
@; @(defchinesize 甲1 "采用天干" first)

@; @(define expl-mapping1 '((a . "bbbbbb") (c . @elem[sdfsdf@racket[first]])))
@; @(defchinesize "sdfsdf" (racketoutput (dict-ref expl-mapping1 'a " ")) "sdfsf")
@; @(defchinesize abjjjjj @#,(racketoutput (dict-ref expl-mapping1 'a " ")) k)
@; @(defminger abjjjjj @#,( (elem (dict-ref expl-mapping1 'c " "))) k)
@; @(defminger abjjjjj @(unsyntax (apply elem '(racketresult "sdfsfsfsdfsdfsdfsdfw ai"))) k)
