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


@title[#:tag "hash"]{􏿱}

@section+elemref{􏿱、􏾔、􏾒、􏾓，􏿱~?、􏿱?、􏾔?、􏾒?、􏾓?，刚􏿱~?、柔􏿱~?}
“􏿱”（@tech[#:doc '(lib "scribblings/reference/reference.scrbl") "hash"]）是一种元素是“键值对（key/value）”的数据结构，其在以下几种特性上可以被进一步细分：
@itemlist[
@item{@bold{是否可以增加、修改、删除“键值对”}：
即“􏿱”的内容是否可以被修改（见：@racket[固?]，以@litchar{!}结尾的例程不能作用在一个内容不可变的“􏿱”上）。}
@item{@bold{不能有重复的“键值对”：}
即“􏿱”中“键值对”的唯一性是如何被确立的（是通过各个“键值对”之间“键”的相互比较来保证的，这种比较可以是基于@racket[同?]、@racket[􏾗?]、@racket[􏾕?]、@racket[侗?]中的任意一种的，因而与之对应的即有@racket[􏿱]、@racket[􏾔]、@racket[􏾒]、@racket[􏾓]）。}
@item{@bold{刚、柔}：对“􏿱”数据而言，其“键”的存储可以是“刚性”（默认）或“柔性”的。}
]

@margin-note{
@bold{@litchar{􏿱}为新造字} @linebreak{}
@bold{@litchar{􏾔}为新造字} @linebreak{}
@bold{@litchar{􏾒}为新造字} @linebreak{}
@bold{@litchar{􏾓}为新造字}
@itemlist[
@item{该字中的偏旁@litchar{宀}代表“内容不可变”（@racket[固?]），除非指明，比如@racket[易􏿱]代表“内容可变”（@racket[易?]）；}
@item{偏旁@litchar{双}表示该数据的主要组成元素是一种“键值对”（类似@racket[双]）。}
@item{偏旁@litchar{古}表示@litchar{􏾗}；}
@item{偏旁@litchar{舍}表示@litchar{􏾕}；}
@item{偏旁@litchar{亻}表示@litchar{侗}；}
]
}


@examples[#:eval (the-eval)
(􏿱 1 2 3 4)
(固? (􏿱 1 2 3 4))
(􏿱? (􏿱 1 2 3 4))
(􏿱~? (􏿱 1 2 3 4))
(刚􏿱~? (􏿱 1 2 3 4))

(􏾔 1 2 3 4)
(固? (􏾔 1 2 3 4))
(􏾔? (􏾔 1 2 3 4))
(􏿱~? (􏾔 1 2 3 4))
(刚􏿱~? (􏾔 1 2 3 4))
]

@section+elemref{􏿱化􏿳，􏿳化􏿱、􏿳化􏾔、􏿳化􏾒、􏿳化􏾓}
通过@racket[􏿴]数据结构也能构造出来元素是“键值对”的数据结构，这种数据结构我们称之为“􏿳”（association list），然其和“􏿱”在内部特性上是有所不同的（是否可以修改“键值对”、“键值对”是否具有唯一性）。
@margin-note{
@bold{@litchar{􏿳}为新造字}
@itemlist[
@item{该字仿照@litchar{􏿴}字而造，表示其也是一种@racket[􏿴]数据结构；}
@item{偏旁@litchar{双}表示该数据的主要组成元素是一种“键值对”（类似@racket[双]）。}
]
}

@examples[#:eval (the-eval)
(􏿱 1 2 3 4)
(􏿱化􏿳 (􏿱 1 2 3 4))
(􏿳化􏿱 '((1 . 2) (3 . 4)))
(固? (􏿳化􏿱 '((1 . 2) (3 . 4))))
(􏿱? (􏿳化􏿱 '((1 . 2) (3 . 4))))
(刚􏿱~? (􏿳化􏿱 '((1 . 2) (3 . 4))))
(􏿱~? (􏿳化􏿱 '((1 . 2) (3 . 4))))
]

@section+elemref{􏿳化易􏿱、􏿳化易􏾔、􏿳化易􏾒、􏿳化􏾓}
@examples[#:eval (the-eval)
(􏿳化易􏿱 '((1 . 2) (3 . 4)))
(􏿱? (􏿳化易􏿱 '((1 . 2) (3 . 4))))
(刚􏿱~? (􏿳化易􏿱 '((1 . 2) (3 . 4))))
(固? (􏿳化易􏿱 '((1 . 2) (3 . 4))))
(􏿱? (􏿳化易􏿱 '((1 . 2) (3 . 4))))
]

@section+elemref{􏿳化柔􏿱、􏿳化柔􏾔、􏿳化柔􏾒、􏿳化柔􏾓}
@examples[#:eval (the-eval)
(􏿳化柔􏿱 '((1 . 2) (3 . 4)))
(􏿱? (􏿳化柔􏿱 '((1 . 2) (3 . 4))))
(刚􏿱~? (􏿳化柔􏿱 '((1 . 2) (3 . 4))))
(固? (􏿳化柔􏿱 '((1 . 2) (3 . 4))))
(􏿱? (􏿳化柔􏿱 '((1 . 2) (3 . 4))))
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
