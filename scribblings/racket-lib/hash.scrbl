#lang scribble/manual

@(require (for-label racket ming)
           scribble/eval
           ming/scribble
           )
@(define the-eval
         (make-eval-factory '(ming/racket/base)))

@(require (file "../../private/scribble-styles/css/fonts.css.rkt"))
@css/wenquan-extend-font
@(require scribble-rainbow-delimiters)
@script/rainbow-delimiters*


@title[#:tag "hash"]{􏿱}

@section+elemref{􏿱、􏿱/􏾬、􏿱/粡、􏿱/侗，􏿱/同?、􏿱/􏾬?、􏿱/粡?、􏿱/侗?，􏿱/刚?、􏿱/柔?，􏿱?}
“􏿱”（@tech[ #:doc '(lib "scribblings/reference/reference.scrbl") "hash"]）是一种元素是“键值对”的数据结构。大体上讲，“􏿱”在以下几种特性上可以被进一步的细分：
@itemlist[
@item{@bold{坚、易}：“可变”（默认）、“不可变”的意思，即一个“􏿱”数据的内容是否可以被修改（以@litchar{!}结尾的例程不能作用在一个“坚􏿱”上）（另见@racket[坚?]）。}
@item{@bold{同、􏾬、粡、侗}：对“􏿱”数据而言，其“键”必须是唯一的，而这种唯一性可以是基于@racket[同?]（默认）、@racket[􏾬?]、@racket[粡?]、@racket[侗?]的任意一种来判定的。}
@item{@bold{刚、柔}：对“􏿱”数据而言，其“键”的存储可以是“刚性”（默认）或“柔性”的。}
]

@margin-note{
@bold{@litchar{􏿱}为新造字}
@itemlist[
@item{该字中的偏旁@litchar{宀}表示“坚”（@racket[坚?]）的意思；}
@item{偏旁@litchar{双}表示该数据的主要组成元素是一种“键值对”（类似@racket[双]）。}
]
}


@examples[#:eval (the-eval)
(􏿱 1 2 3 4)
(􏿱/同? (􏿱 1 2 3 4))
(􏿱/刚? (􏿱 1 2 3 4))
(坚? (􏿱 1 2 3 4))
(􏿱? (􏿱 1 2 3 4))

(􏿱/􏾬 1 2 3 4)
(􏿱/􏾬? (􏿱/􏾬 1 2 3 4))
(􏿱/刚? (􏿱/􏾬 1 2 3 4))
(坚? (􏿱/􏾬 1 2 3 4))
(􏿱? (􏿱/􏾬 1 2 3 4))
]

@section+elemref{􏿱->􏿳，􏿳->􏿱、􏿳->􏿱/􏾬、􏿳->􏿱/粡、􏿳->􏿱/侗}
通过@racket[􏿴]数据结构也能构造出来元素是“键值对”的数据结构，这种数据结构我们称之为“􏿳”（association list）。“􏿳”和“􏿱”虽然内部特性上不同，但从表象上看是非常趋于一致的。
@margin-note{
@bold{@litchar{􏿳}为新造字}
@itemlist[
@item{该字仿照@litchar{􏿴}字而造，表示其也是一种@racket[􏿴]数据结构；}
@item{偏旁@litchar{双}表示该数据的主要组成元素是一种“键值对”（类似@racket[双]）。}
]
}

@examples[#:eval (the-eval)
(􏿱 1 2 3 4)
(􏿱->􏿳 (􏿱 1 2 3 4))
(􏿳->􏿱 '((1 . 2) (3 . 4)))
(􏿱/同? (􏿳->􏿱 '((1 . 2) (3 . 4))))
(􏿱/刚? (􏿳->􏿱 '((1 . 2) (3 . 4))))
(坚? (􏿳->􏿱 '((1 . 2) (3 . 4))))
(􏿱? (􏿳->􏿱 '((1 . 2) (3 . 4))))
]

@section+elemref{􏿳->􏿱/易、􏿳->􏿱/􏾬/易、􏿳->􏿱/粡/易、􏿳->􏿱/侗/易}
@examples[#:eval (the-eval)
(􏿳->􏿱/易 '((1 . 2) (3 . 4)))
(􏿱/同? (􏿳->􏿱/易 '((1 . 2) (3 . 4))))
(􏿱/刚? (􏿳->􏿱/易 '((1 . 2) (3 . 4))))
(坚? (􏿳->􏿱/易 '((1 . 2) (3 . 4))))
(􏿱? (􏿳->􏿱/易 '((1 . 2) (3 . 4))))
]

@section+elemref{􏿳->􏿱/柔、􏿳->􏿱/􏾬/柔、􏿳->􏿱/粡/柔、􏿳->􏿱/侗/柔}
@examples[#:eval (the-eval)
(􏿳->􏿱/柔 '((1 . 2) (3 . 4)))
(􏿱/同? (􏿳->􏿱/柔 '((1 . 2) (3 . 4))))
(􏿱/刚? (􏿳->􏿱/柔 '((1 . 2) (3 . 4))))
(坚? (􏿳->􏿱/柔 '((1 . 2) (3 . 4))))
(􏿱? (􏿳->􏿱/柔 '((1 . 2) (3 . 4))))
]


@section+elemref{􏿱抇、􏿱抈}
对于@racket[􏿱]中的“键值对”，因其是类似于一种@racket[双]的结构而存在的，所以也特别的在此被称之为“明”（@racket[阴]字和@racket[阳]字各取右边偏旁组成的字）。进而：
@itemlist[
@item{@racket[􏿱抇]：表示对于每一个􏿱，以其“明”中“阳”位数据为基准，来索引查询“阴”位数据并返回；}
@item{@racket[􏿱抈]：表示对于每一个􏿱，以其“明”中“阴”位数据为基准，来索引查询“阳”位数据并返回。}
]

@margin-note{
@bold{@litchar{抇}为新造字}
@itemlist[
@item{“@litchar{扌}”有“出参数据结构是进参数据结构中的某一个元素”的含义；}
@item{“@litchar{日}”是@racket{阳}的意思。}
]
@bold{@litchar{抈}为新造字}
@itemlist[
@item{“@litchar{扌}”有“出参数据结构是进参数据结构中的某一个元素”的含义；}
@item{“@litchar{月}”是@racket{阴}的意思。}
]
}


@examples[#:eval (the-eval)
(􏿱抇 (􏿱 'a "apple" 'b "banana" 'c "cat" 'd "dog") 'b)
(􏿱抈 (􏿱 'a "apple" 'b "banana" 'c "cat" 'd "dog") "cat")
]


@section[#:tag "hash-base"]{基础例程}
@defmapping[
racket/base/hash
]
