#lang scribble/manual

@(require (for-label racket ming ming/list ming/hash)
           scribble/eval
           ming/scribble)
@(define the-eval
         (make-eval-factory '(ming/racket/base ming/racket/hash ming/hash)))

@(require (file "../../private/scribble-styles/css/ming-fonts.css.rkt"))
@css/ming-fonts
@(require scribble-rainbow-delimiters)
@script/rainbow-delimiters*


@title[#:tag "hash"]{􏿰}
@margin-note{另见名扩展库：@secref["ming-hash"]}

@section[#:tag "rules"]{例程命名规则}
除总@secref["naming-rules"]外，另有：
@tabular[@;#:sep @hspace[0]
         #:style 'boxed
         #:column-properties '(center)
         #:row-properties '(border)
         (list (list @bold{规则} @bold{指示} @bold{含义} @bold{举例})
               (list
               @elem{以@litchar{^}结尾}
               @elem{指示入参}
               @elem{入参数据是@racket[􏿳]类数据}
               @elem{@racket[􏿰^]、@racket[􏾋^]、@racket[􏾊^]、@racket[􏾉^]}
               )
               (list
               @elem{包含@litchar{􏿰}和@litchar{囗}/@litchar{古}/@litchar{舌}/@litchar{亻}中任一者的}
               @elem{指示“􏿰”中“键值对”唯一性的确立方式}
               @elem{是通过与之对应的@racket[同?]/@racket[􏾗?]/@racket[􏾃?]/@racket[侗?]中的任一者所确立的}
               @elem{@racket[􏾌]、@racket[􏾋]、@racket[􏾊]、@racket[􏾉]}
               )
               (list
               @elem{包含@litchar{􏿰}和@litchar{山}/@litchar{氵}中任一者的}
               @elem{指示“􏿰”中“键值对”是否可变}
               @elem{是不可或可被增加、删除或修改的}
               @elem{@racket[􏾐?]、@racket[􏾑?]}
               )
               (list
               @elem{包含@litchar{􏿰}和@litchar{⺮}/@litchar{艹}中任一者的}
               @elem{指示“􏿰”中“键值对”之“键”的存储方式}
               @elem{是刚性或柔性的}
               @elem{@racket[􏾎?]、@racket[􏾏?]}
               )
         )
         ]

@section+elemref{􏿰、􏾌、􏾋、􏾊、􏾉}
@margin-note{
@bold{@litchar{􏿰}为新造字}
@itemlist[
@item{@litchar{广}：工厂、容器、外壳；}
@item{@litchar{双}：键值对（因为类似@racket[双]，另见：@racket[􏿳]）；}
]
@bold{@litchar{􏾌}}、@bold{@litchar{􏾋}}、@bold{@litchar{􏾊}}、@bold{@litchar{􏾉}为新造字}
@itemlist[
@item{@litchar{囗}：@litchar{同}的简写，见@racket[同?]；}
@item{@litchar{古}：@litchar{􏾗}的简写，见@racket[􏾗?]；}
@item{@litchar{舌}：@litchar{􏾃}的简写，见@racket[􏾃?]；}
@item{@litchar{亻}：@litchar{侗}的简写，见@racket[侗?]。}
]
@bold{@litchar{􏾐}}、@bold{@litchar{􏾑}}、@bold{@litchar{􏾎}}、@bold{@litchar{􏾏}、@bold{@litchar{􏾈}}为新造字}
@itemlist[
@item{@litchar{山}：内容不可变的（因为“山”是稳定的，见：@racket[􏾐?]）；}
@item{@litchar{氵}：内容可变的（因为“水”是易变的，见：@racket[􏾑?]）；}
@item{@litchar{⺮}：刚韧的（因为“竹”是刚韧的，见：@racket[􏾎?]）；}
@item{@litchar{艹}：柔弱的（因为“艸”（草）是柔弱的，见：@racket[􏾏?]）；}
@item{@litchar{艹}（中间加@litchar{丨}）：见@racket[􏾈?]。}
]
}
@margin-note{另见：@racket[􏾑]}

“@racket[􏿰]”（@tech[#:doc '(lib "scribblings/reference/reference.scrbl") "hash"]）是一种内部元素都是“键值对（key/value）”的数据结构，其在以下特性上可以被进一步细分：
@itemlist[
@item{
@bold{是否可以增加、修改、删除“键值对”}，即“􏿰”的内容是否可以被改变：
@itemlist[
@item{@bold{@racket[􏾐]}：内容不可改变的“􏿰”，也称“固􏿰”；}
@item{@bold{@racket[􏾑]}：内容可改变的“􏿰”，也称“易􏿰”（以@litchar{!}结尾的例程只能作用在“易􏿰”上）。}
]
}
@item{
@bold{不能有重复的“键值对”}，即“键值对”的唯一性要如何被确立（通过各个“键值对”之间“键”的相互比较来确立）：
@itemlist[
@item{@bold{@racket[􏾌]}：比较函数是@racket[同?]；}
@item{@bold{@racket[􏾋]}：比较函数是@racket[􏾗?]；}
@item{@bold{@racket[􏾊]}：比较函数是@racket[􏾃?]；}
@item{@bold{@racket[􏾉]}：比较函数是@racket[侗?]。}
]
}
@item{
对于“键值对”，其“键”的存储可以是：
@itemlist[
@item{@bold{@racket[􏾎]}：刚性的；}
@item{@bold{@racket[􏾏]}：柔性的；}
@item{@bold{@racket[􏾈]}：类􏾧的。}
]
}
]
通过@racket[􏿰]创建的是@racket[􏾌?]、@racket[􏾎?]和@racket[􏾐?]都是真的“􏿰”。
@examples[#:eval (the-eval)
(􏿰 1 2 3 4)
(􏽮? (􏿰 1 2 3 4))
]

@section+elemref{􏿰^、􏾋^、􏾊^、􏾉^，􏾏^、􏾁^、􏾀^、􏽿^，􏾈^、􏽽^、􏽼^、􏽻^，􏾐^、􏾆^、􏾅^、􏾄^，􏿰化􏿳}
“􏿳”和“􏿰”可以互相进行转换，“@racket[􏿳]化@racket[􏿰]”在此用@litchar{^}标记来简写。 @linebreak{}
通过@racket[􏿰^]创建的是@racket[􏾌?]、@racket[􏾎?]和@racket[􏾑?]都为真的“􏿰”。
@margin-note{另见：@racket[􏾑]、@racket[􏿳]}
@examples[#:eval (the-eval)
(􏿰^ '((1 . 2) (3 . 4)))
(􏽦? (􏿰^ '((1 . 2) (3 . 4))))

(􏾏^ '((1 . 2) (3 . 4)))
(􏽦? (􏾏^ '((1 . 2) (3 . 4))))

(􏾁^ '((1 . 2) (3 . 4)))
(􏽡? (􏾁^ '((1 . 2) (3 . 4))))

(􏿰化􏿳 (􏿰 1 2 3 4))
(􏿰化􏿳 (􏾋 1 2 3 4))
(􏿰化􏿳 (􏾑 1 2 3 4))
]

@section+elemref{􏿰?，􏾌?、􏾋?、􏾊?、􏾉?，􏾎?、􏾏?、􏾈?}
@margin-note{
另见：@linebreak{}
@racket[􏾐?]、@racket[􏾑?]，@linebreak{}
@racket[􏽞?]、@racket[􏽝?]、@racket[􏽜?]、@racket[􏽛?]，@linebreak{}
@racket[􏽮?]、@racket[􏽭?]、@racket[􏽬?]、@racket[􏽫?]，@linebreak{}
@racket[􏽦?]、@racket[􏽥?]、@racket[􏽤?]、@racket[􏽣?]，@linebreak{}
@racket[􏽪?]、@racket[􏽩?]、@racket[􏽨?]、@racket[􏽧?]，@linebreak{}
@racket[􏽢?]、@racket[􏽡?]、@racket[􏽠?]、@racket[􏽟?]。
}
@examples[#:eval (the-eval)
(􏿰? (􏿰 1 2 3 4))
(􏾌? (􏿰 1 2 3 4))
(􏾎? (􏿰 1 2 3 4))
(􏾐? (􏿰 1 2 3 4))
(􏽮? (􏿰 1 2 3 4))

(􏿰^ '((1 . 2) (3 . 4)))
(􏾌? (􏿰^ '((1 . 2) (3 . 4))))
(􏾎? (􏿰^ '((1 . 2) (3 . 4))))
(􏾑? (􏿰^ '((1 . 2) (3 . 4))))
(􏽦? (􏿰^ '((1 . 2) (3 . 4))))

(􏽦? (􏾏^ '((1 . 2) (3 . 4))))
(􏽡? (􏾁^ '((1 . 2) (3 . 4))))
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
