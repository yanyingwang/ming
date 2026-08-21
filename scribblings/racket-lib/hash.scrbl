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
Originates from @secref["hashtables" #:doc '(lib "scribblings/reference/reference.scrbl")] and extends to @secref["ming-hash"].

@section[#:tag "overall-of-hash"]{Overall}
@; Extended from @secref["naming-rules"], specifically there are：
@tabular[@;#:sep @hspace[0]
         #:style 'boxed
         #:column-properties '(center)
         #:row-properties '(border)
         (list (list @bold{Rule} @bold{Example})
               (list
               @elem{@bold{@zi[亻]}}
               @elem{@racket[􏿰攸]}
               )
               (list
               @elem{@bold{@zi[阝]}} 
               @elem{@racket[􏿰􏺈] @racket[􏿰􏺇]}
               )
               (list
               @elem{@bold{@zi[刂]}} 
               @elem{@racket[􏿰􏾘] @racket[􏿰𠛮]}
               )
               (list
               @elem{@bold{@zi[扌]}} 
               @elem{@racket[􏿰􏾩] @racket[􏿰𫼛] @racket[􏿰𫼛] @racket[􏿰􏽘] @racket[􏿰􏽗]}
               )
               (list
               @elem{@bold{@zi[^SFX]}}
               @elem{@racket[􏿰^] @racket[􏾋^] @racket[􏾊^] @racket[􏾉^]}
               )
               (list
               @elem{@bold{@zi[􏿰PFX]}}
               @elem{@rackets[􏿰􏾘 􏿰𠛮 􏿰𫼛]}
               ))]

@defideogr[广 "indicates a specific data type" "广" "house"]{
Imagines it as a data spaces where has many elements.
}

@defideogr[(口 􏶯 􏶮 =) "equal" #f #f]{
Are the simple way to write @zi[同]/@zi[􏷇]/@zi[􏷅]/@zi[冃], which indicate the keys are uniqued by using which comparison procedures.
Note that, @zi[口] has a diverse usage, it has a different meaning depending on the composition of characters, e.g., in @zi[句], it is juset a placeholder without any specific meaning.
}

@defideogr[⺮  "strongly restained keys" "⺮" "bamboo"]{
Is the component way to write @zi-tool{竹}.
}
@defideogr[艹  "weakly reatined keys" "艹" "grass"]{
Is the component way to write @zi-tool{草}.
}
@defideogr[􏶭  "strongly or merely weakly reatined keys" #f #f]{
Retaining keys strongly or merely weakly.
}

@section{􏿰}
@eleph-note{@racket[􏿳]}

@defideogr[􏿰 (广 双) "hash" #f #f]{
@zi[广] introduces a space of a specific data type, where it has @zi[双] inside, which further indicates each elements of this data type is similar to @racket[双] data type.
}

@defideogr[(􏿰B 􏿰R) (􏿰 (B R))  "minor type of hash" #f #f]{
Resembles @zi[􏿰], means are similar to 􏿰 but different in how keys work or other details.
}

@defideogr[􏿰PFX (􏿰 PFX)  "Process hash" #f #f]{
Implies the type of input data is @zi[􏿰], and how to process this data thus the output are both denpending on the suffix.
}

@section{􏾌 􏾋 􏾊 􏾉, 􏾐 􏾑, 􏾎 􏾏 􏾈}
@defideogr[(􏾌 􏾋 􏾊 􏾉) ((口 􏶯 􏶮 =) 􏿰R) "hash with specific way to uniq key" #f #f]
@defideogr[(􏾐 􏾑) ((山 𭕄) 􏿰B) "mutable or immutable hash" #f #f]
@defideogr[(􏾎 􏾏 􏾈) ((⺮ 艹 􏶭) 􏿰B) "strong or weak or merely weak hash" #f #f]
@defideogr[(􏾁 􏾀 􏽿 􏾈 􏽽 􏽼 􏽻 􏾆 􏾅 􏾄) ((口 􏶯 􏶮 =) (山 𭕄 ⺮ 艹 􏶭) 􏿰) "specific minor type of hash" #f #f]
@ideoexamples[@rackets[􏾐? 􏾑? 􏾎? 􏾏? 􏾈? 􏾌? 􏾋? 􏾊? 􏾉?]]
@examples[#:eval (the-eval)
(􏿰 1 2 3 4)
(􏽮? (􏿰 1 2 3 4))
]

@section{􏿰^ 􏾋^ 􏾊^ 􏾉^，􏾏^ 􏾁^ 􏾀^ 􏽿^，􏾈^ 􏽽^ 􏽼^ 􏽻^，􏾐^ 􏾆^ 􏾅^ 􏾄^，􏿰化􏿳}
@defideogr[(􏿰^ 􏾋^ 􏾊^ 􏾉^ 􏾏^ 􏾁^ 􏾀^ 􏽿^ 􏾈^ 􏽽^ 􏽼^ 􏽻^ 􏾐^ 􏾆^ 􏾅^ 􏾄^) ((􏿰 􏾊 􏾉 􏾏 􏾁 􏾀 􏽿 􏾈 􏽽 􏽼 􏽻 􏾐 􏾆 􏾅 􏾄 􏾋) ^SFX) #f #f #f]{
when @zi[^SFX] meets 􏿰 family chars(􏾐, 􏾌 etc.), the input will be @zi[􏿳] object.
}
@margin-note{@rackets[􏾌 􏾑]}
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

@section{􏿰?, 􏾌? 􏾋? 􏾊? 􏾉?, 􏾎? 􏾏? 􏾈?, 􏻵?}
@defideogr[(􏿰? 􏾌? 􏾋? 􏾊? 􏾉? 􏾎? 􏾏? 􏾈? 􏻵?) ((􏿰 􏾌 􏾋 􏾊 􏾉 􏾎 􏾏 􏾈 􏻵) ?SFX) #f #f #f]
@eleph-note{
@racket[􏾐?] @racket[􏾑?] @linebreak{}
@racket[􏽞?] @racket[􏽝?] @racket[􏽜?] @racket[􏽛?] @linebreak{}
@racket[􏽮?] @racket[􏽭?] @racket[􏽬?] @racket[􏽫?] @linebreak{}
@racket[􏽦?] @racket[􏽥?] @racket[􏽤?] @racket[􏽣?] @linebreak{}
@racket[􏽪?] @racket[􏽩?] @racket[􏽨?] @racket[􏽧?] @linebreak{}
@racket[􏽢?] @racket[􏽡?] @racket[􏽠?] @racket[􏽟?]
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


@section{􏿰􏺈 􏿰􏺇，􏿰日?}
@defideogr[(􏺈 􏺇) ((日 月) 阝) "all the keys or values" #f #f]{
Returns all the keys or values of an object.
}
@defideogr[明 (日 月) #f #f #f]{
@stands-for{the pair(key+value) of an object.}
}
@examples[#:eval (the-eval)
(􏿰􏺈 (􏿰 'a "apple" 'b "banana"))
(􏿰􏺇 (􏿰 'a "apple" 'b "banana"))
(􏿰日? (􏿰 'a "apple" 'b "banana") 'a)
]


@; @section{􏿰􏽚 􏿰𦙨}
@section{􏿰弔 􏿰𫼛，􏿰􏽙，􏿰􏾘 􏿰􏽘}
@defideogr[(𫼛 􏽙 􏾘) (扌 弔 日 刂) #f #f #f]
@defideogr[􏽘 (扌 􏾘) #f #f #f]
@; @bold{@litchar{􏽚}为新造字} @linebreak{}
@; @bold{@litchar{𦙨}为古活字}
@; @racket[􏿰􏽚]：表示对于每一个“􏿰”，以其“明”中“阳”位数据为基准，来索引查询“阴”位数据并返回；
@; @racket[􏿰𦙨]：表示对于每一个“􏿰”，以其“明”中“阴”位数据为基准，来索引查询“阳”位数据并返回。
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


@section{􏿰攸 􏿰𰁦，􏿰􏾩 􏿰𢪛，􏿰攸/入 􏿰􏾩/入}
@eleph-note{@racket[攸]}
@examples[#:eval (the-eval)
(􏿰攸 (􏿰 'a "apple" 'b "banana") 'b "ba")
(􏿰𰁦 (􏿰 'a "apple" 'b "banana") 'a "ap" 'b "ba")
(􏿰攸/入 (􏿰 'a "apple" 'b "banana" 'c 1) 'c 􏽊)

(名 h (􏾑 'a "apple" 'b "banana"))
(􏿰𢪛 h 'a "ap" 'b "ba")
h
]


@section{􏿰𠛮 􏿰􏽗，𠛮􏿰}
@defideogr[𠛮 (全 刂) #f #f #f]
@examples[#:eval (the-eval)
(􏿰𠛮 (􏿰 'a "apple" 'b "banana"))
(名 h (􏾑 'a "apple" 'b "banana"))
(􏿰􏽗 h)
h
(𠛮􏿰 (􏿰 'a "apple" 'b "banana"))
]

@section{􏿰􏷒 􏿰􏷑 􏿰􏷑化􏿴}
@eleph-note{@racket[􏷑]}
@examples[#:eval (the-eval)
(􏿰􏷒 (􏿰 'a "apple" 'b "banana") (入 (K V) (示 K) (示 V)))
(􏿰􏷑 (􏿰 'a "apple" 'b "banana") (入 (K V) (並 V K)))
(􏿰􏷑化􏿴 (􏿰 'a "apple" 'b "banana") (入 (K V) (􏿴 V K)))
]

@; @section{􏿰􏺈?^}
@; @eleph-note{@racket[􏿰􏺈]}
@; @examples[#:eval (the-eval)
@; (􏿰􏺈?^ (􏿰 'a "aa" 'b "bb") (􏿰 'a "aaa" 'b "bbb" 'c "ccc"))
@; (􏿰􏺈?^ (􏿰 'a "aa" 'c "cc") (􏿰 'a "aaa" 'b "bbb" 'c "ccc"))
@; (􏿰􏺈?^ (􏿰 'a "aa" 'd "dd") (􏿰 'a "aaa" 'b "bbb" 'c "ccc"))
@; (􏿰􏺈?^ (􏿰 'b "bb") (􏿰 'a "aaa" 'b "bbb" 'c "ccc"))
@; ]

@section{􏿰巨 􏻵?}
@eleph-note{@racket[巨 穴?]}
@defideogr[􏻵 (穴 􏿰) "empty hash" #f #f]
@examples[#:eval (the-eval)
(􏿰巨 (􏿰 'a "aa" 'b "bb"))
(􏻵? (􏿰 'a "aa" 'b "bb"))
]

@section{􏾑化}
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



@section[#:tag "hash-base"]{ming/racket/base}
@defmodule[ming/racket/base]
@defmapping[racket/base/hash]

@section[#:tag "hash-addtional"]{ming/racket/hash}
@defmodule[ming/racket/hash]
@defmapping[racket/hash]
