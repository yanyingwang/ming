#lang scribble/manual

@(require (for-label racket ming ming/list)
           scribble/eval
           ming/scribble
           )
@(define the-eval
         (make-eval-factory '(ming/racket/base ming/racket/list ming/racket/vector ming/list)))

@(require (file "../../private/scribble-styles/css/ming-fonts.css.rkt"))
@css/ming-fonts
@(require scribble-rainbow-delimiters)
@script/rainbow-delimiters*


@title[#:tag "pairs-and-lists"]{双 and 􏿴}
Originates from @secref["pairs" #:doc '(lib "scribblings/reference/reference.scrbl")] and extends to @secref["ming-list"].

@section[#:tag "nameing-rules-of-pair-list"]{Naming Rules}
@; Extended from @secref["naming-rules"], specifically there are：
@tabular[@;#:sep @hspace[0]
         #:style 'boxed
         #:column-properties '(center)
         #:row-properties '(border)
         (list (list @bold{Ideograph} @bold{Connotation} @bold{Elucidation} @bold{Example})
               (list
               @elem{@zi[亻] as component}
               "general subset"
               @elem{Returns a new list with elements produced from the input list. (Implies the input data and output data are the same type.)}
               @elem{@rackets[伄 攸 𰂋 偏 􏾜 􏾛 偅 𠆯 􏹈 􏷍?]}
               )
               @; (list
               @; @elem{@defcomponent[彳]}
               @; "resembler"
               @; @elem{Returns a resemblant list of the input.}
               @; @elem{@racket[𢓜]}
               @; )
               (list
               @elem{@zi[阝] as component}
               "serial subset"
               @elem{Returns a new list with elements serially produced from the input list.(Implies the input data and output data are the same type.)}
               @elem{@racket[􏾝] @racket[􏾺] @racket[𨚞] @racket[􏹋]}
               )
               @; (list
               @; @elem{@defcomponent[􏸋]}
               @; "serial subset of lists"
               @; @elem{Returns a new list with elements serially produced from the input lists.(Implies the multiple input data and output data are the same type.)}
               @; @elem{@racket[左􏸑]}
               @; )
               (list
               @elem{@zi[刂] as component}
               "broken subset"
               @elem{Returns a new list with removing some elements from the input list.}
               @elem{@racket[􏷵] @racket[􏷴] @racket[􏺊] @racket[􏾘] @racket[𠝤] @racket[􏹊] @racket[􏹇]}
               )
               @; (list
               @; @elem{@defcomponent[􏸌]}
               @; "broken subset of lists"
               @; @elem{Returns a new list with removing some elements from the input lists.(Implies the multiple input data and output data are the same type.)}
               @; @elem{@racket[左􏸒]}
               @; )
               (list
               @elem{@zi[分] as component or suffix}
               "split input list to values"
               @elem{Implies the type of output data is values(@racket[並]).}
               @elem{@rackets[􏸄 􏸃 䢼分 􏹈分]})
               @; (list
               @; @elem{@defcomponent[􏸍]}
               @; "split input lists to values"
               @; @elem{Implies input data is lists and the type of output data is values(@racket[並]).}
               @; @elem{@racket[􏸄] @racket[􏸃]}
               @; )
               (list
               @elem{@zi[入] as component or @zi[入] as suffix}
               "function as input"
               @elem{Implies the type of input data is function.}
               @elem{@rackets[􏹃 􏹅 􏹌 􏹂 攸/入 􏾺/入 𨚞/入]}
               )
               @; (list
               @; @elem{@defsuffix[0]}
               @; "original function"
               @; @elem{Implies there is another function named with omitting @litchar{0}.}
               @; @elem{@racket[􏼓0]}
               @; )
               (list
               @elem{@zi[*SFX]}
               "strengthen"
               "Strengthen the process, thus the data of output may become longer, and the type may be changed accordingly."
               @; @elem{@racket[弓*]、@racket[􏼏*]}
               @elem{@racket[弓*] @racket[􏹂*] @racket[􏼏*]}
               )
               (list
               @elem{@zi[~SFX]}
               "soften"
               "Soften the process, thus the output data shorter."
               @elem{@racket[􏹊~] @racket[􏹇~]}
               )
               @; (list
               @; @elem{以@bold{@litchar{v}}结尾}
               @; @elem{加强力度（且改变出参成@racket[􏿴]）}
               @; @elem{出参内容更加丰富且被封装成@racket[􏿴]数据结构}
               @; @elem{@racket[引v]}
               @; )
               (list
               @elem{@zi[^SFX]}
               @elem{list as input}
               @elem{Implies the type of input data is list.}
               @elem{@racket[􏹊^] @racket[伄^] @racket[􏾘^]}
               )
               @; (list
               @; @elem{以@litchar{􏿴}结尾}
               @; @elem{构造生成@racket[􏿴]数据}
               @; @elem{出参数据结构是@racket[􏿴]}
               @; @elem{@racket[序􏿴]、@racket[复􏿴]、@racket[𥸬􏿴]}
               @; )
               (list
               @elem{@zi[?SFX]}
               @elem{boolean as output}
               @elem{Implies the type of output data is boolean.}
               @elem{@racket[双?] @racket[􏿴?] @racket[􏿳?]}
              )
         )]

@defideogr[又 "elment" "又" "Right hand, borrowed as again in simplified chinese."]{
Resembles @italic{human's hand that is holding an object}.
@ideoexamples[@rackets[双 􏿫]]
}
@defideogr[又LB (又 LB) "links pairs, linked pairs" #f #f]{
Is reaching from Left through Bottom to right, we write it in this way to stand multiple @racket[双] linked together.
@ideoexamples[@rackets[􏿴 􏿫]]
}
@defideogr[㐅 "null" #f #f]{
Is same as @zi[穴], because @racket[㐅] is same as @racket[穴].
@ideoexamples[@rackets[㐅? 􏿴]]
}

@section[#:tag "pair-car-cdr-list-list*"]{双, 㐅, 􏿴, 􏿫, 阴, 阳}
Abstractly, we can pair two data together. Integrally, it is called @zi[双]. Separately, the position where set the first data is call @zi[阳], the second is call @zi[阴].

Further more, if we put another @racket[双] to @racket[阴] position of the former @racket[双], we get a linked data. Likewise, the linked data can be extended as long as you want. By this way, if we leave @racket[阴] of the ending @racket[双] to be empty(@racket[㐅]), we get a data called @racket[􏿴]; if not, we call it @racket[􏿫].



@defideogr[双 (又 又) "cons a pair data type" "双" "pair"]{
Two human hand here stand for a data type with spaces of holding two holding data. (@zi[双] is a special minor data type of @zi[􏿴])
}

@defideogr[􏿴 (又LB 㐅) "list, introduce a list data type" #f #f]{
The reaching from Left through Bottom to right @zi[又] stands for @italic{multiple @racket[双] linked head to tail}; @litchar{㐅} means ending with empty(@zi[㐅]).
}

@defideogr[􏿴BR (􏿴 BR) "list resemblance" #f #f]{
Has the similar function process as it resembles and the type of output is same as @racket[􏿴] accordingly.
@ideoexamples[@rackets[􏼓 􏼎 􏼏 􏿝]]
}

@defideogr[􏿫 (又LB 又) "list with last element be pair" #f #f]{
Resembles @zi[􏿴] except substituting @litchar{㐅} with @litchar{又}, which means the ending position is not empty(@zi[㐅]).
}

@defideogr[􏿫BR (􏿫 BR) "resembles 􏿫" #f #f]{
Has the similar function process as it resembles and the type of output is same as @racket[􏿫] accordingly.
@ideoexamples[@rackets[􏿜]]
}

@examples[#:eval (the-eval)
(双 1 2)

(双 1 (双 2 (双 3 (双 4 㐅))))
(􏿴 1 2 3 4)

(双 1 (双 2 (双 3 4)))
(􏿫 1 2 3 4)
(􏿫 1 2 3 '(4))

(阳 '(1 . 2))
(阴 '(1 . 2))

(阳 '(1 2 3 4))
(阴 '(1 2 3 4))

]

@section{阴阳+-}
@defideogr[日 "former" "日" "sun"]{
Originally means @italic{sun} in Chinese. Especially is borrowed to mean the former part of an object, or the positive part of an object in Ming.
@hyperlink["https://en.wikipedia.org/wiki/Yin_and_yang" "wiki"].
}

@defideogr[月 "latter" "月" "moon"]{
Originally Means moon, borrowed to mean the secondary part of of an object, or the negative part of an object in Ming.
@hyperlink["https://en.wikipedia.org/wiki/Yin_and_yang" "wiki"].
}

@defideogr[阳 (阝 日) "the first half part" "阳" "sun, positive"]
@defideogr[阴 "the last half part" "阴" "negative"]

@defideogr[(阳+ 阴+ 阳- 阴-) ((阳 阴) (+ -)) "阴 or 阳 nested in mutiple parenthesis  reverse order" #f #f]{
For the case of procedures that start with @zi[阴] or @zi[阳] and following with @litchar{+} or @litchar{-}, @litchar{+} stands for @zi[阳] and @litchar{-} stands for @zi[阴].

For example, @code{(阴+-- lst)} is short for @code{(阴 (阴 (阳 (阴 lst))))}.
}

@examples[#:eval (the-eval)
(阴+ '(1 2 3 4))
(阴-+ '(1 2 3 4))

(阳 '((1 1.1) 2 3 4))
(阳+ '((1 1.1) 2 3 4))
(阳-+ '((1 1.1) 2 3 4))
]


@section{􏿝, 􏿜}
@defideogr[􏿝 (毌 􏿴BR) #f #f #f]
@defideogr[􏿜 (毌 􏿫BR) #f #f #f]
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


@section{攸}
@defideogr[(攸 􏾩 𰁦 𢪛) ((亻 扌) 丨 攵) #f #f #f]{
@litchar{丨} at here implies only change one value, thus the input values are only two: the index and the setting value.
}
@eleph-note{@racket[𰁦] @racket[􏾩] @racket[𢪛]}
@examples[#:eval (the-eval)
(攸 '(10 15 20 25) 1 1555)
(攸/入 '(10 15 20 25) 1 􏽊)
]


@section{􏼏, 􏼏*}
@defideogr[􏼏 (米 􏿴BR) #f #f #f]
@examples[#:eval (the-eval)
(􏼏 10)
(􏼏 10 20)
(􏼏 10 20 2)
(􏼏* 10 20)
(􏼏* 10 20 2)
]

@section{􏼓, 􏼎}
@defideogr[􏼓 (三 􏿴) #f #f #f]
@defideogr[􏼎 (弓 􏿴) #f #f #f]
@examples[#:eval (the-eval)
(􏼓 5 'foo)
(􏼎 5 並)
(􏼎 5 􏽊)
(􏼎 5 (入 (n)
        (􏼓 5 'foo)))
]

@section{弔, 弓,弓*, 􏹂, 􏹂*}
@defideogr[弓 "index" "弓" "bow"]{
Resembles @italic{a rope wraped on stick, thus this rope can be used to count how many circles it is wrapping on stick}. Especially means @italic{the index} of an object in Ming.
}
@defideogr[􏹂 (弓 入) #f #f #f]
@defideogr[弔 "refer a vlaue from index" "第" "refer, rank"]{
Simplifies from @litchar{第} and resembles @italic{an stick wrapped with a rope in circles, thus it can be used to ref to an specific circle}. Especially means @italic{refer} in Ming.
}
@eleph-note{
@racket[伄] @racket[􏾘] @racket[􏾝] @;，@racket[弓*]、@racket[弓*/入]
}
@examples[#:eval (the-eval)
(弔 '(a b c d e c f) 2)

(弓 '(a b c d e c f) 'c)
(弓* '(a b c d e c f) 'c)

(􏹂 '(a b 11 d 22 c f) 米?)
(􏹂* '(a b 11 d 22 c f) 米?)
]

@section{􏷜, 􏷛, 􏷚, 􏷙, 􏷘, 􏷗, 􏷖, 􏷕, 􏷔, 􏷓}
@defideogr[弔RTTz (弔 RTTz) "No." #f #f]{
Is @zi[弔] rotated -90 degrees, means @italic{No.}, such as No.1 or 2 or 3.... .
}
@defideogr[(􏷜 􏷛 􏷚 􏷙 􏷘 􏷗 􏷗 􏷖 􏷕 􏷔 􏷓) (弔RTTz (一 二 三 四 五 六 七 八 九 十)) "No.1 or 2 or 3..." #f #f]
@eleph-note{@code{(􏷜 '(1 2 3 4 5 6 7 8 9 10))} is same as @code{(弔 '(1 2 3 4 5 6 7 8 9 10) 1)}.}
@examples[#:eval (the-eval)
(􏷜 '(1 2 3 4 5 6 7 8 9 10))
(􏷛 '(1 2 3 4 5 6 7 8 9 10))
(􏷚 '(1 2 3 4 5 6 7 8 9 10))
(􏷙 '(1 2 3 4 5 6 7 8 9 10))
(􏷓 '(1 2 3 4 5 6 7 8 9 10))
]

@section{末, 􏹧}
@defideogr[􏹧 (双 末) #f #f #f]
@examples[#:eval (the-eval)
(末 '(1 2 3 4))
(􏹧 '(1 2 3 4))
(􏹧 '(1 2 3 . 4))
]

@section{巨}
@eleph-note{@racket[􏹃]}
@examples[#:eval (the-eval)
(巨 '(a b c d e 3 f g))
]

@section{􏾺,𨚞, 􏷵,􏷴, 􏸄,􏸃, 􏾺/入,𨚞/入, 􏾺?}
@defideogr[左 "left, from left" "左" "left"]
@defideogr[右 "right, from right" "右" "right"]
@defideogr[分 "split" "分" "split"]{
Implies the output type is @zi[並].
}
@defideogr[(􏾺 𨚞 􏷵 􏷴 􏸃 􏸄) ((左 右) (阝 刂 分)) #f #f #f]
@eleph-note{@racket[􏺊]}
@examples[#:eval (the-eval)
(􏾺 '(a b c d e f g) 2)
(𨚞 '(a b c d e f g) 2)

(􏷵 '(a b c d e f g) 2)
(􏷴 '(a b c d e f g) 2)

(􏸄 '(a b c d e f g) 2)
(􏸃 '(a b c d e f g) 2)

(􏾺/入 '(8 4 a b 1 c d 2 e f g 3 5 9) 米?)
(𨚞/入 '(8 4 a b 1 c d 2 e f g 3 5 9) 米?)

(􏾺? '(a b) '(a b c d e f g))
(􏾺? '(a b z) '(a b c d e f g))
]

@section{䢼, 􏷳, 䢼分}
@defideogr[共 "share" "共" "share, together"]{
Implies the input data are more than one and they are in the same type.
}
@defideogr[(䢼 􏷳) (共 (阝 刂)) #f #f #f]
@examples[#:eval (the-eval)
(䢼 '(a b x y z) '(a b c d e f g))
(􏷳 '(a b x y z) '(a b c d e f g))
(䢼分 '(a b x y z) '(a b c d e f g))
]

@section{𰂋，偏，􏾜，重、𠝤}
@defideogr[间 "insert between" "间" "gap, interval, between"]
@defideogr[扁 "flatten" "扁" "flat, thin"]
@defideogr[糸 "shuffle" "紊" "disorder"]
@defideogr[重 "duplication" "重" "heavy, deep, again, repeat, overlap"]

@defideogr[𰂋 (亻 间) #f #f #f]
@defideogr[偏 (亻 扁) #f #f #f]
@defideogr[􏾜 (亻 糸) #f #f #f]
@defideogr[𠝤 (重 刂) #f #f #f]

@examples[#:eval (the-eval)
(𰂋 '(a b c d) '和)
(偏 '((a b) (c d) (e f)))
(􏾜 '(a b c d e d c b a))

(重 '(a b c d e d c b a))
(𠝤 '(a b c d e d c b a))
]


@section{􏾛、𠆯}
@defideogr[屰 "reverse" "屰" "rotated adult"]
@defideogr[川 "sort" "顺" "in order, comply, sort"]

@defideogr[􏾛 (亻 屰) #f #f #f]
@defideogr[(𠆯 􏽒) ((亻 扌) 川) #f #f #f]{
Resembles Chinese characters such as @zi-tool{训}, @zi-tool{驯}, and thus have a simliar meaning.
}
@examples[#:eval (the-eval)
(􏾛 '(21 3 888 666 55 77 1000))
(𠆯 '(21 3 888 666 55 77 1000) <)
(𠆯 '(21 3 888 666 55 77 1000) >)
(𠆯 '("cat" "dog" "chicken" "duck" "fox") 句<?)
(𠆯 '("cat" "dog" "chicken" "duck" "fox") 句>?)
]

@section{􏹋、􏹉、􏹊~、􏹊^，􏹅，􏹄，􏹌、􏹈，􏹇~、􏹇}

@defideogr[彐 "find" "寻" "find, search, seek"]
@defideogr[(􏹅 􏹇 􏹉 􏹄 􏹈 􏹌 􏹋 􏹊) ((日 亻) 彐 入 (阝 刂)) #f #f #f]

@eleph-note{@racket[􏹊] @racket[􏾘] @racket[􏺈] @racket[􏺇]}
@examples[#:eval (the-eval)
(􏹋 'c '(a b c d e f))
(􏹉 'c '((a b) (c d) (e f)))
(􏹊~ 'c '(a b c d e c f))
(􏹊^ '(c e) '(a b c d e c f))

(􏹌 米? '(a b 1 c d 3 e 9 f))
(􏹈 米? '(a b 1 c d 3 e 9 f))

(􏹅 米? '(a b 1 c d 3 e 9 f))
(􏹄 米? '((a b) (1 d) (j k) (8 f)))

(􏹇 米? '(a b 1 c d 3 e 9 f))
(􏹇~ 米? '(a b 1 c d 3 e 9 f))
]

@section{􏹈分，􏹈巨}
@eleph-note{@racket[巨] @racket[􏹃]}
@examples[#:eval (the-eval)
(􏹈分 米? '(a b 1 c d 3 e 9 f))
(􏹈巨 米? '(a b 1 c d 3 e 9 f))
]

@section{􏷒,􏷑, 􏷐,􏷏，􏷎,右􏷎} @;􏷮，􏷭
@defideogr[夂 "each" "各" "every, each"]{
Do not confuse with @zi[攵].
}
@defideogr[􏷒 (夂 入) "each" #f #f]{
@zi[入] component implies the input data is procedure.
}

@defideogr[(􏷑 􏷉 􏷐 􏷏 􏷎) ((亻 扌 并 戈 土) 􏷒) #f #f #f]{
@code{(􏷑 PROC (􏿴 a b c))} is simplified from: @code{(􏿴 (PROC a) (PROC b) (PROC c))} @linebreak{}
@code{(􏷐 PROC (􏿴 a b c))} is simplf-from: @code{(并 (PROC a) (PROC b) (PROC c))} @linebreak{}
@code{(􏷏 PROC (􏿴 a b c))} is simplified from: @code{(戈 (PROC a) (PROC b) (PROC c))} @linebreak{}
@code{(􏷎 PROC z (􏿴 a b c))} is simplified from: @code{(PROC c (PROC b (PROC a z)))} @linebreak{}
@code{(右􏷎 PROC z (􏿴 a b c))} is simplified from: @code{(PROC a (PROC b (PROC c z)))} @linebreak{}
}

@examples[#:eval (the-eval)
(􏷒 display (􏿴 2 4 6 8))
(􏷑 􏽊 '(1 2 3 4))
(􏷑 + '(1 2 3 4) '(100 200 300 400))

(􏷐 􏻛? '(1 2 -3 4))
(􏷐 + '(1 2 3 4) '(100 200 300 400))

(􏷐 􏻚? '(1 2 -3 4))
(􏷏 + '(1 2 3 4) '(100 200 300 400))

(􏷎 + 0 '(1 2 -3 4))
(􏷎 双 '() '(1 2 -3 4))
(右􏷎 双 '() '(1 2 -3 4))
]


@section{􏷑􏹈,􏷑􏿝, 􏷑􏺗、􏷑􏺘}
@defideogr[大 "max" "大" "big"]
@defideogr[小 "min" "小" "small"]
@defideogr[(􏺗 􏺘) (米 彐 (大 小)) #f #f #f]

@examples[#:eval (the-eval)
(􏹈􏷑 (入 (x) (并 (􏻛? x) (􏽊 x))) '(-2 -1 0 1 2))
(􏷑􏿝 􏻿化􏿴 '(#(1) #(2 3) #(4)))

(􏷑􏺗 char->integer '(#\a #\y #\b #\k #\c #\j #\d))
(􏷑􏺘 char->integer '(#\a #\y #\b #\k #\c #\j #\d))
(􏷑􏺗 阳 '((3 pears) (1 banana) (2 apples)))
(􏷑􏺘 阳 '((3 pears) (1 banana) (2 apples)))
]

@section+elemref{􏷍/组合、􏷍/排列组合，􏷍/笛卡尔积，􏷍/分组}
@examples[#:eval (the-eval)
(􏷍/组合 '(a b c))
(􏷍/排列组合 '(a b c))
(􏷍/笛卡尔积 '(1 2 3) '(a b c))
(􏷍/分组 米? '(1 a 2 b 3 c))
]


@section[#:tag "list-base"]{ming/racket/base}
@defmodule[ming/racket/base]
@defmapping[racket/base/pairs-and-lists]

@section[#:tag "list-additional"]{ming/racket/list}
@defmodule[ming/racket/list]
@defmapping[racket/list]
