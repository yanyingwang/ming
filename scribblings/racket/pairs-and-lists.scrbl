#lang scribble/manual

@(require (for-label racket ming)
           scribble/eval
           scribble-rainbow-delimiters
           ming/scribble
           )
@(define the-eval
         (make-eval-factory '(ming/racket/base ming/racket/list)))


@script/rainbow-delimiters*

@title[#:tag "pairs-and-lists"]{对和链}
“对”（@tech[ #:doc '(lib "scribblings/reference/reference.scrbl") "pair"]）是lisp语言最最基础的数据结构。@linebreak{}

@section{base}
对于名语言来说，如果我们把两个数据@racket[对]在一块，我们就得到一个“对”，而对在一块的这两个数据分别处于他们所构成的这个“对”的@racket[阳]位和@racket[阴]位。@linebreak{}
另外，如果一个“对”的阴位不是存的一个具体数据而是存的另外一个“对”的索引，此时的这个“对”，也叫做@racket[链]（@tech[ #:doc '(lib "scribblings/reference/reference.scrbl") "list"]）。

@examples[#:eval (the-eval)
(对 1 2)
(对? '(1 . 2))
(阳 '(1 . 2))
(阴 '(1 . 2))

(对 1 (对 2 (对 3 (对 4 空))))
(等同? (对 1 (对 2 (对 3 (对 4 空))))
       (链 1 2 3 4))
(链 1 2 3 4)
(阳 '(1 2 3 4))
(阴 '(1 2 3 4))
(阴之阳 '(1 2 3 4))
(阴之阴阳 '(1 2 3 4))

(阳 '((1 1.1) 2 3 4))
(阳之阳 '((1 1.1) 2 3 4))
(阳之阴阳 '((1 1.1) 2 3 4))
]

@defmapping[racket/base/pairs-and-lists
([对 "将两个数据对在一块。"]
[阳 "返回居于阳位的数据。"]
[阴 "返回居于阴位的数据。"]
[阳之阳 "取阳位数据，从已取数据中再取阳位数据。"]
[链 "将数据链起来。"]
)]


@section{additional}
@defmodule[ming/racket/list]
@examples[#:eval (the-eval)
(甲 '(1 2 3 4))
(乙 '(1 2 3 4))
(丙 '(1 2 3 4))
]

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
