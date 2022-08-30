#lang scribble/manual

@(require (for-label racket ming)
           scribble/eval
           scribble-rainbow-delimiters
           ming/scribble
           )
@(define the-eval
         (make-eval-factory '(ming/racket/base ming/racket/list)))


@script/rainbow-delimiters*

@title[#:tag "pairs-and-lists"]{双和链}
@declare-exporting[ming]

@section{双、阴阳、链}
“双”（@tech[ #:doc '(lib "scribblings/reference/reference.scrbl") "pair"]）是LISP语言最最基础的数据结构。@linebreak{}

对于名语言来说，如果我们把两个数据@racket[双]在一块，我们就得到一个“双”，而双在一块的这两个数据分别处于他们所构成的这个“双”的@racket[阳]位和@racket[阴]位。@linebreak{}

另外，如果一个“双”的阴位不是存的一个具体数据而是存的另外一个“双”的索引，此时的这个“双”，也叫做@racket[链]（@tech[ #:doc '(lib "scribblings/reference/reference.scrbl") "list"]）。

@examples[#:eval (the-eval)
(双 1 2)
(双? '(1 . 2))
(阳 '(1 . 2))
(阴 '(1 . 2))

(双 1 (双 2 (双 3 4)))
(双 1 (双 2 (双 3 (双 4 空))))
(同? (双 1 (双 2 (双 3 (双 4 空))))
     (链 1 2 3 4))
(链 1 2 3 4)
(链- 1 2 3 4)

(阳 '(1 2 3 4))
(阴 '(1 2 3 4))
(阴之阳 '(1 2 3 4))
(阴之阴阳 '(1 2 3 4))

(阳 '((1 1.1) 2 3 4))
(阳之阳 '((1 1.1) 2 3 4))
(阳之阴阳 '((1 1.1) 2 3 4))

(序链 5 加一)
(复链 5 'foo)

(连 '(1 2) '(3 4) '(5 6) '(7 8))
]


@; @section[#:tag "list-searching"]{第提、索探、筛消、理、各巡}
@; 跟链的查询相关的例程有：
@; @itemlist[
@; @item{引：链中各个元素的序号（索引）称之为“引”。通过链中元素的序列号来查询具体的元素叫@racket[引]。用一个具体值来反向查询此值在链中的引，称之为@racket[索引]。}
@; @item{索：查询链中某值，并返回此值之后的所有数据组成的链，称之为@racket[索]。}
@; @item{寻：@racket[寻]是用来查询联链（association list，链中链）的，即以链中之链的阳位数据为查询对象来返回查询到的数据所在的链。}
@; @item{选：@racket[选]是用例程来查询出所有符合条件的元素所组成的链。@racket[选一]则是只返回第一查到的元素。}
@; @item{删：@racket[删]掉链中某一元素。@racket[删链*]从某一链删掉另一链中相同的所有元素。}
@; @item{@racket[各]：链中的各个元素作为例程的参数传入例程并用返回结果替换原值。}
@; @item{@racket[轮]：链中元素作为参数依次轮换进入执行例程。}
@; ]


@section{甲--癸、末}
@examples[#:eval (the-eval)
(甲 '(1 2 3 4))
(乙 '(1 2 3 4))
(末 '(1 2 3 4))
(末* '(1 2 3 4))
(去甲 '(1 2 3 4))
]

@section{第、提、修}
@examples[#:eval (the-eval)
(第 '(a b c d e c f) 2)
(提 '(a b c d e c f) 'c)
(提* '(a b c d e c f) 'c)
(提/入 '(a b c d e c f)
         (入 (x)
             (或 (同? x 'b)
                 (同? x 'c))))
(提*/入 '(a b c d e c f)
         (入 (x)
             (或 (同? x 'b)
                 (同? x 'c))))

(修 '(10 15 20 25) 1 1555)
(修/入 '(10 15 20 25) 1 加一)
]

@section{取、去、断}
@examples[#:eval (the-eval)
(取 '(a b c d e f g) 2)
(去 '(a b c d e f g) 2)
(断 '(a b c d e f g) 2)
]

@section{间、扁、洗、重}
@examples[#:eval (the-eval)
(始链于链? '(a j) '(a j d k))
(始链于链? '(a f j) '(a j d k))

(间插 '(a b c d) '和)
(扁平 '((a b) (c d) (e f)))
(洗乱 '(a b c d e c f))

(查重 '(a b c d e c f))
(去重 '(a b c d e c f))
]

@section{理、段}
@examples[#:eval (the-eval)
(理 '(21 3 888 666 55 77 1000) <)
(理 '(21 3 888 666 55 77 1000) >)
(理 '("cat" "dog" "chicken" "duck" "fox") 诗<?)
(理 '("cat" "dog" "chicken" "duck" "fox") 诗>?)



(一段数 10 20)
(一段数/间隔 10 20 2)
]


@section{索、探，筛、消，计}
@examples[#:eval (the-eval)
(索 'c '(a b c d e f)) ;; 索 寻 寻随
(探 'c '((a b) (c d) (e f))) ;;

(筛甲 正数? '(1 2 -3 4))
(筛选 正数? '(1 2 -3 4))
(筛除 正数? '(1 2 -3 4))
(筛分 正数? '(1 2 -3 4))

(消 'c '(a b c d e c f))
(消/入 偶数? '(1 2 3 4 5 6 7 8))
@; (删* '(c) '(a b c d e c f))
(消*/以链 '(c e) '(a b c d e c f))
(消*/入 偶数? '(1 2 3 4 5 6 7 8))

(计数 正数? '(1 2 -3 4))
]

@section{各、巡}
@examples[#:eval (the-eval)
(各 加一 '(1 2 3 4))
(各 + '(1 2 3 4) '(100 200 300 400))

(各都为 正数? '(1 2 -3 4))
(各中有 负数? '(1 2 -3 4))
(各左拢 双 '() '(1 2 -3 4))
(各右拢 双 '() '(1 2 -3 4))

(筛而各 (入 (x) (且 (正数? x) (加一 x))) '(1 3 -4 5))
(各而连- vector->list '(#(1) #(2 3) #(4)))

(巡 (入 (i)
          (行示 i))
      (链 2 4 6 8))
]

@section[#:tag "list-base"]{基础例程}
@defmapping[racket/base/pairs-and-lists
([对 "将两个数据对在一块。"]
[阳 "返回居于阳位的数据。"]
[阴 "返回居于阴位的数据。"]
[阳之阳 "取阳位数据，从已取数据中再取阳位数据。"]
)]

@section[#:tag "list-additional"]{额外例程}
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
