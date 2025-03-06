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
Originates from @secref["hashtables" #:doc '(lib "scribblings/reference/reference.scrbl")] and Extends to @secref["ming-hash"].

@section[#:tag "nameing-rules-of-hash"]{Naming Rules}
@; Extended from @secref["naming-rules"], specifically there are：
@tabular[@;#:sep @hspace[0]
         #:style 'boxed
         #:column-properties '(center)
         #:row-properties '(border)
         (list (list @bold{Rule} @bold{Connotation} @bold{Elucidation} @bold{Example})
               (list
               @elem{@zi[口]|@zi[􏶯]|@zi[􏶮]|@zi[=]|@zi[山]|@zi[𭕄]|@zi[⺮]|@zi[艹]|@zi[􏶭] + @zi[􏿰]} "minor type" @elem{similar to  @zi[􏿰] but differentiate in how keys work or other details.}
               @elem{@code{􏾐? 􏾑? 􏾎? 􏾏? 􏾈? 􏾌? 􏾋? 􏾊? 􏾉?}}
               )
               (list
               @elem{@bold{@zi[亻]}} "--" "--"
               @elem{@racket[􏿰攸]}
               )
               (list
               @elem{@bold{@zi[阝]}} "--" "--"
               @elem{@racket[􏿰􏺈] @racket[􏿰􏺇]}
               )
               (list
               @elem{@bold{@zi[刂]}} "--" "--"
               @elem{@racket[􏿰􏾘] @racket[􏿰𠛮]}
               )
               (list
               @elem{@bold{@zi[扌]}} "--" "--"
               @elem{@racket[􏿰􏾩] @racket[􏿰𫼛] @racket[􏿰𫼛] @racket[􏿰􏽘] @racket[􏿰􏽗]}
               )
               (list
               @elem{@bold{@zi[^]}} "--" @elem{when it meets @zi[􏿰] family chars(@zi[􏾐], @zi[􏾌] etc.), the input will be @zi[􏿳] object futher.}
               @elem{@racket[􏿰^] @racket[􏾋^] @racket[􏾊^] @racket[􏾉^]}
               )
               (list
               @elem{@bold{@zi[?^]}} "is subset of an object" @elem{implies that more than one same type objects and output type is boolean. }
               @elem{@racket[􏿰􏺈?^]}
               )
               (list
               @elem{@bold{@zi[+]}} "--" "--"
               @elem{@racket[􏿰攸+] @racket[􏿰􏾩+]}
               )
         )
         ]

@section{􏿰}
@eleph-note{@racket[􏿳]}
@defzi[􏿰]{
@defzi/sub[广]{@same-as-cnchar-but["广" "hourse" "space where has many elements"]};
@zi[双] indicates each elements is similar to @racket[双].
}

@section{􏾌 􏾋 􏾊 􏾉}
@defzis[􏾌/􏾋/􏾊/􏾉]{
resemble @zi[􏿰].
@defzi/sub[口]/@defzi/sub[􏶯]/@defzi/sub[􏶮]/@defzi/sub[=] are simplified way to write @zi[同]/@zi[􏷇]/@zi[􏷅]/@zi[冃], which indicate the keys are uniqued by using which comparison procedures.}

@section{􏾐 􏾑}
@defzis[􏾐/􏾑]{@zi[山]/@zi[𭕄 ] +  @zi[􏿰].}

@section{􏾎 􏾏 􏾈}
@defzis[􏾎/􏾏/􏾈]{
resemble @zi[􏿰].
@defzi/sub[⺮]{@same-as-cnchar-but["竹" "bamboo" "stongly restained keys"]};
@defzi/sub[艹]{@same-as-cnchar-but["草" "grass" "weakly reatined keys"]};
@defzi/sub[􏶭]{"retains keys strongly or merely weakly"}.
}


@examples[#:eval (the-eval)
(􏿰 1 2 3 4)
(􏽮? (􏿰 1 2 3 4))
]

@section{􏿰^ 􏾋^ 􏾊^ 􏾉^，􏾏^ 􏾁^ 􏾀^ 􏽿^，􏾈^ 􏽽^ 􏽼^ 􏽻^，􏾐^ 􏾆^ 􏾅^ 􏾄^，􏿰化􏿳}
@margin-note{@code{􏾌 􏾑}}
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
@defzi[􏺈]{@zi[日] + @zi[阝], @stands-for{the keys of @racket[􏿰] object.}}
@defzi[􏺇]{@zi[日] + @zi[阝], @stands-for{the values of @racket[􏿰] object.}}
@defzi[明]{@zi[日] + @zi[月], @stands-for{the pair(key+value) of @racket[􏿰] object.}}
@examples[#:eval (the-eval)
(􏿰􏺈 (􏿰 'a "apple" 'b "banana"))
(􏿰􏺇 (􏿰 'a "apple" 'b "banana"))
(􏿰日? (􏿰 'a "apple" 'b "banana") 'a)
]


@; @section{􏿰􏽚 􏿰𦙨}
@section{􏿰弔 􏿰𫼛，􏿰􏽙，􏿰􏾘 􏿰􏽘}
@defzi[𫼛]{@zi[扌] + @zi[弔]}
{@defzi[􏽙]{@zi[弔] + @zi[日]}
{@defzi[􏾘]{@zi[弔] + @zi[刂]}
@defzi[􏽘]{@zi[扌] + @zi[􏾘]}
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


@section{􏿰攸 􏿰攸+，􏿰􏾩 􏿰􏾩+，􏿰攸/入 􏿰􏾩/入}
@eleph-note{@racket[攸]}
@examples[#:eval (the-eval)
(􏿰攸 (􏿰 'a "apple" 'b "banana") 'b "ba")
(􏿰攸+ (􏿰 'a "apple" 'b "banana") 'a "ap" 'b "ba")
(􏿰攸/入 (􏿰 'a "apple" 'b "banana" 'c 1) 'c 􏽊)

(名 h (􏾑 'a "apple" 'b "banana"))
(􏿰􏾩+ h 'a "ap" 'b "ba")
h
]


@section{􏿰𠛮 􏿰􏽗，𠛮􏿰}
@defzi[𠛮]{@zi[全] + @zi[刂].}
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

@section{􏿰􏺈?^}
@eleph-note{@racket[􏿰􏺈]}
@examples[#:eval (the-eval)
(􏿰􏺈?^ (􏿰 'a "aa" 'b "bb") (􏿰 'a "aaa" 'b "bbb" 'c "ccc"))
(􏿰􏺈?^ (􏿰 'a "aa" 'c "cc") (􏿰 'a "aaa" 'b "bbb" 'c "ccc"))
(􏿰􏺈?^ (􏿰 'a "aa" 'd "dd") (􏿰 'a "aaa" 'b "bbb" 'c "ccc"))
(􏿰􏺈?^ (􏿰 'b "bb") (􏿰 'a "aaa" 'b "bbb" 'c "ccc"))
]

@section{􏿰巨 􏻵?}
@eleph-note{@racket[巨 穴?]}
@defzi[􏻵]{@zi[穴] + @zi[􏿰].}
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
