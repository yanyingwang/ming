#lang scribble/manual

@(require (for-label ming/racket/base ming/racket/list ming/list)
           ming/list
           scribble/eval)
@(define the-eval
         (make-eval-factory '(ming/racket/base ming/list)))

@(require (file "../../private/scribble-styles/css/fonts.css.rkt"))
@css/wenquan-extend-font
@(require scribble-rainbow-delimiters)
@script/rainbow-delimiters*


@title[#:tag "lists"]{􏿴}
@defmodule[ming/list]

名语言对Racket标准库@secref["pairs-and-lists"]的扩展。

@margin-note{本页所列之例程的实现代码是名语言，因此源代码有参照意义。}

@defproc[(筛分* [程A 程?] [某􏿴 􏿴?])
          􏿴?]{
与@racket[筛分]类似，除返回值不同外。
@examples[#:eval (the-eval)
(筛分* 数? '(a bb 22 jj 38 ic))
]
}

@deftogether[(
@defproc[(留去* [某􏿴 􏿴?] [数A 数?])
          􏿴?]
@defproc[(右留去* [某􏿴 􏿴?] [数A 数?])
          􏿴?]
@defproc[(留去*/入 [某􏿴 􏿴?] [数A 数?])
          􏿴?]
@defproc[(右留去*/入 [某􏿴 􏿴?] [数A 数?])
          􏿴?]
)]{
依次与@racket[留去]、@racket[右留去]、@racket[留去/入]、@racket[右留去/入]类似，除返回值不同外。
@examples[#:eval (the-eval)
(留去* '(a b c d e f) 2)
(右留去* '(a b c d e f) 2)
(留去*/入 '(a b c d 1 f) 词?)
(右留去*/入 '(a b c d 1 f) 词?)
]
}

@defproc[(段 [某􏿴 􏿴?] [数A 数?] [数B 数?])
          􏿴?]{
@racket[某􏿴]的其中一段，从@racket[第]@racket[数A]处元素算起，到@racket[第]@racket[数B]止（不包括@racket[数B]）。

@examples[#:eval (the-eval)
(段 '(a b c d e f) 0 0)
(段 '(a b c d e f) 2 2)
(段 '(a b c d e f) 0 2)
]
}
