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
“@racket[􏿰]”（@tech[#:doc '(lib "scribblings/reference/reference.scrbl") "hash"]）是一种内部元素都是“键值对（key/value）”的数据结构。


@section[#:tag "hash-rules"]{例程命名规则}
见@secref["naming-rules"]，有：
@tabular[@;#:sep @hspace[0]
         #:style 'boxed
         #:column-properties '(center)
         #:row-properties '(border)
         (list (list @bold{规则} @bold{指示} @bold{含义} @bold{举例})
               (list
               @elem{@bold{@litchar{囗}}/@bold{@litchar{古}}/@bold{@litchar{舌}}/@bold{@litchar{亻}} + @bold{@litchar{􏿰}}}
               @elem{“􏿰”中“键值对”唯一性的确立方式}
               @elem{是通过与之对应的@racket[同?]/@racket[􏾗?]/@racket[􏾃?]/@racket[侗?]中的任一者所确立的}
               @elem{@racket[􏾌]、@racket[􏾋]、@racket[􏾊]、@racket[􏾉]}
               )
               (list
               @elem{@bold{@litchar{山}}/@bold{@litchar{氵}} + @bold{@litchar{􏿰}}}
               @elem{“􏿰”中“键值对”是否可变}
               @elem{是不可或可被增加、删除或修改的}
               @elem{@racket[􏾐?]、@racket[􏾑?]}
               )
               (list
               @elem{@bold{@litchar{⺮}}/@bold{@litchar{艹}} + @bold{@litchar{􏿰}}}
               @elem{“􏿰”中“键值对”之“键”的存储方式}
               @elem{是刚性或柔性的}
               @elem{@racket[􏾎?]、@racket[􏾏?]}
               )
               (list
               @elem{@bold{@litchar{亻}}}
               "相似集（类型相同且元素相似）"
               @elem{出参数据与进参数据相比，类型相同且内容类似}
               @elem{@racket[􏿰攸]}
               )
               (list
               @elem{@bold{@litchar{阝}}}
               "连续集（类型相同且元素连续相同）"
               @elem{出参数据与进参数据相比，类型相同且前者是后者的一部分}
               @elem{@racket[􏿰􏺈]、@racket[􏿰􏺇]}
               )
               (list
               @elem{@bold{@litchar{刂}}}
               "缺失集（删除、移走、去掉部分元素之后的集合）"
               @elem{出参数据与进参数据相比，类型相同且前者是后者的子集}
               @elem{@racket[􏿰􏾘]、@racket[􏿰𠛮]}
               )
               (list
               @elem{@bold{@litchar{扌}}/@bold{@litchar{!}}结尾}
               @elem{修改警示}
               @elem{会直接修改原始数据而非另造新数据作输出}
               @elem{@racket[􏿰􏾩]、@racket[􏿰𫼛]、@racket[􏿰𫼛]、@racket[􏿰􏽘]、@racket[􏿰􏽗]}
               )
               (list
               @elem{@bold{@litchar{^}}结尾}
               @elem{入参}
               @elem{入参数据是@racket[􏿳]类数据}
               @elem{@racket[􏿰^]、@racket[􏾋^]、@racket[􏾊^]、@racket[􏾉^]}
               )
               (list
               @elem{@bold{@litchar{+}}结尾} @; ^-
               @elem{入参}
               @elem{入参数据以相同方式多次出现}
               @elem{@racket[􏿰攸+]、@racket[􏿰􏾩+]}
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
@item{@litchar{山}：稳定的、内容不变的（因为“山”是稳定的，见：@racket[􏾐?]）；}
@item{@litchar{氵}：易动的、内容可变的（因为“水”是易变的，见：@racket[􏾑?]）；}
@item{@litchar{⺮}：刚韧的（因为“竹”是刚韧的，见：@racket[􏾎?]）；}
@item{@litchar{艹}：柔弱的（因为“艸”（草）是柔弱的，见：@racket[􏾏?]）；}
@item{@litchar{艹}（中间加@litchar{丨}）：见@racket[􏾈?]。}
]
@bold{@litchar{􏻵}为新造字}
@itemlist[
@item{@litchar{穴}：简写，通@litchar{空}。}
]
}
@margin-note{另见：@racket[􏾑]}

“􏿰”在以下特性上可以被进一步细分：
@itemlist[
@item{
@bold{是否可以增加、修改、删除“键值对”}，即“􏿰”的内容是否可以被改变：
@itemlist[
@item{@bold{@racket[􏾐]}：内容不可改变的“􏿰”，也称“固􏿰”；}
@item{@bold{@racket[􏾑]}：内容可改变的“􏿰”，也称“易􏿰”（@litchar{扌}偏旁相关的例程或以@litchar{!}结尾的例程只能作用在“易􏿰”上）。}
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
“􏿳”和“􏿰”可以互相进行转换，@litchar{􏿳化}在此用@litchar{^}标记来简写。 @linebreak{}
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

@section+elemref{􏿰?，􏾌?、􏾋?、􏾊?、􏾉?，􏾎?、􏾏?、􏾈?，􏻵?}
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

(􏻵? (􏿰 'a "aa" 'b "bb"))
(􏻵? (􏿰))
]



@section+elemref{􏿰􏺈、􏿰􏺇，􏿰日?}
@margin-note{
@bold{@litchar{􏺈}为古活字} @linebreak{}
@bold{@litchar{􏺇}为新造字} @linebreak{}
@itemlist[
@item{@litchar{日}：“键值对”的“键”（@racket[双]的@racket[阳]）；}
@item{@litchar{月}：“键值对”的“值”（@racket[双]的@racket[阴]）。}
]
}
对于@racket[􏿰]中的“键值对”，因其类于@racket[双]，故在此也称为“明”（@racket[阳]+@racket[阴]）。进而，“键值对”的“键”称为“日”，“值”称为“月”。
@examples[#:eval (the-eval)
(􏿰􏺈 (􏿰 'a "apple" 'b "banana"))
(􏿰􏺇 (􏿰 'a "apple" 'b "banana"))
(􏿰日? (􏿰 'a "apple" 'b "banana") 'a)
]


@; @section+elemref{􏿰􏽚、􏿰𦙨}
@section+elemref{􏿰弔、􏿰𫼛，􏿰􏽙，􏿰􏾘、􏿰􏽘}
@margin-note{
@bold{@litchar{𫼛}为古活字} @linebreak{}
@bold{@litchar{􏽙}为新造字} @linebreak{}
@bold{@litchar{􏾘}为新造字} @linebreak{}
@bold{@litchar{􏽘}为新造字} @linebreak{}
@; @bold{@litchar{􏽚}为新造字} @linebreak{}
@; @bold{@litchar{𦙨}为古活字}
@itemlist[
@item{@litchar{日}：参见@racket[􏿰􏺈]、@racket[􏿰日?]；}
@item{@litchar{弔}：索引、查询，参见@racket[弔]；}
@item{@litchar{扌}、@litchar{阝}、@litchar{刂}，见：@secref["hash-rules"]。}
]
}
@; @itemlist[
@; @item{@racket[􏿰􏽚]：表示对于每一个“􏿰”，以其“明”中“阳”位数据为基准，来索引查询“阴”位数据并返回；}
@; @item{@racket[􏿰𦙨]：表示对于每一个“􏿰”，以其“明”中“阴”位数据为基准，来索引查询“阳”位数据并返回。}
@; ]
@examples[#:eval (the-eval)
@; (􏿰𦙨 (􏿰 'a "apple" 'b "banana" 'c "cat" 'd "dog") "cat")
(􏿰弔 (􏿰 'a "apple" 'b "banana") 'b)
(􏿰弔 (􏿰 'a "apple" 'b "banana") 'b "cat")
(􏿰弔 (􏿰 'a "apple" 'b "banana") 'c "cat")
(􏿰􏽙 (􏿰 'a "apple" 'b "banana") 'b)
(􏿰􏽙 (􏿰 'a "apple" 'b "banana") 'b "cat")
(􏿰􏽙 (􏿰 'a "apple" 'b "banana") 'c "cat")
(􏿰􏾘 (􏿰 'a "apple" 'b "banana") 'a)

(名 h (􏾑 'a "apple" 'b "banana"))
(􏿰𫼛 h 'b "cat")
h
(􏿰𫼛 h 'c "cat")
h
(􏿰􏽘 h 'a)
h
]


@section+elemref{􏿰攸、􏿰攸+，􏿰􏾩、􏿰􏾩+，􏿰攸/入、􏿰􏾩/入}
@margin-note{参见：@racket[攸]}
@examples[#:eval (the-eval)
(􏿰攸 (􏿰 'a "apple" 'b "banana") 'b "ba")
(􏿰攸+ (􏿰 'a "apple" 'b "banana") 'a "ap" 'b "ba")
(􏿰攸/入 (􏿰 'a "apple" 'b "banana" 'c 1) 'c 􏽊)

(名 h (􏾑 'a "apple" 'b "banana"))
(􏿰􏾩+ h 'a "ap" 'b "ba")
h
]


@section+elemref{􏿰𠛮、􏿰􏽗，𠛮􏿰}
@margin-note{
@bold{@litchar{𠛮}为古活字}
@itemlist[
@item{@litchar{刂}：删除；}
]
}
@examples[#:eval (the-eval)
(􏿰𠛮 (􏿰 'a "apple" 'b "banana"))
(名 h (􏾑 'a "apple" 'b "banana"))
(􏿰􏽗 h)
h
(𠛮􏿰 (􏿰 'a "apple" 'b "banana"))
]

@section+elemref{􏿰各、􏿰􏺆、􏿰佫}
@margin-note{
@bold{@litchar{􏺆}为新造字}
@itemlist[
@item{@litchar{又}：@litchar{􏿴}的缩写；}
]
}
@margin-note{参见：@racket[佫]}
@examples[#:eval (the-eval)
(􏿰各 (􏿰 'a "apple" 'b "banana") (入 (K V) (示 K) (示 V)))
(􏿰􏺆 (􏿰 'a "apple" 'b "banana") (入 (K V) (􏿴 V K)))
(􏿰佫 (􏿰 'a "apple" 'b "banana") (入 (K V) (􏸼 V K)))
]

@section+elemref{􏿰􏺈仔?}
@margin-note{参见：@racket[􏿰􏺈]、@racket[仔?]}
@examples[#:eval (the-eval)
(􏿰􏺈仔? (􏿰 'a "aa" 'b "bb") (􏿰 'a "aaa" 'b "bbb" 'c "ccc"))
(􏿰􏺈仔? (􏿰 'a "aa" 'c "cc") (􏿰 'a "aaa" 'b "bbb" 'c "ccc"))
(􏿰􏺈仔? (􏿰 'a "aa" 'd "dd") (􏿰 'a "aaa" 'b "bbb" 'c "ccc"))
(􏿰􏺈仔? (􏿰 'b "bb") (􏿰 'a "aaa" 'b "bbb" 'c "ccc"))
]

@section+elemref{􏿰巨}
@margin-note{
参见：@racket[巨]、@racket[空?]
}
@examples[#:eval (the-eval)
(􏿰巨 (􏿰 'a "aa" 'b "bb"))

]

@section+elemref{􏾑化}
@; @margin-note{
@; @bold{@litchar{􏽕}为新造字}
@; @itemlist[
@; @item{@litchar{复}：复制；}
@; @item{@litchar{亻}，见：@secref["hash-rules"]。}
@; ]
@; }
@examples[#:eval (the-eval)
(􏾐? (􏿰 'a "aa" 'b "bb"))
(􏾐? (􏾑化 (􏿰 'a "aa" 'b "bb")))
]



@section[#:tag "hash-base"]{基础例程}
@defmodule[ming/racket/base]
@defmapping[racket/base/hash]

@section[#:tag "hash-addtional"]{额外例程}
@defmodule[ming/racket/hash]
@defmapping[racket/hash]
