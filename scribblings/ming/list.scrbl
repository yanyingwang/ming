#lang scribble/manual

@(require (for-label ming/racket/base ming/racket/list ming/list)
           ming/list
           scribble/eval
           scribble-rainbow-delimiters)
@(define the-eval
         (make-eval-factory '(ming/racket/base ming/list)))


@script/rainbow-delimiters*

@title[#:tag "lists"]{链}
@declare-exporting[ming/list]
名语言对Racket标准库@secref["pairs-and-lists"]的扩展。

@margin-note{本页所列之例程的实现代码是名语言，因此源代码有参照意义。}

@defproc[(筛分* [程A 程?] [某链 链?])
          链?]{
与@racket[筛分]类似，除返回值不同外。
@examples[#:eval (the-eval)
(筛分* 数? '(a bb 22 jj 38 ic))
]
}

@deftogether[(
@defproc[(出去* [某链 链?] [数A 数?])
          链?]
@defproc[(右出去* [某链 链?] [数A 数?])
          链?]
@defproc[(出去*/入 [某链 链?] [数A 数?])
          链?]
@defproc[(右出去*/入 [某链 链?] [数A 数?])
          链?]
)]{
依次与@racket[出去]、@racket[右出去]、@racket[出去/入]、@racket[右出去/入]类似，除返回值不同外。
@examples[#:eval (the-eval)
(出去* '(a b c d e f) 2)
(右出去* '(a b c d e f) 2)
(出去*/入 '(a b c d 1 f) 词?)
(右出去*/入 '(a b c d 1 f) 词?)
]
}

@defproc[(段 [某链 链?] [数A 数?] [数B 数?])
          链?]{
@racket[某链]的其中一段，从@racket[第]@racket[数A]处元素算起，到@racket[第]@racket[数B]止（不包括@racket[数B]）。

@examples[#:eval (the-eval)
(段 '(a b c d e f) 0 0)
(段 '(a b c d e f) 2 2)
(段 '(a b c d e f) 0 2)
]
}
