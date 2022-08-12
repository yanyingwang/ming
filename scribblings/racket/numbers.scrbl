#lang scribble/manual

@(require (for-label racket ming)
           scribble/eval
           scribble-rainbow-delimiters
           ming/scribble
           )
@(define the-eval
         (make-eval-factory '(ming/racket/base)))


@script/rainbow-delimiters*

@title[#:tag "numbers"]{数}

@examples[#:eval (the-eval)
(偶数? 2)
(浮点数? 1.1)
(+ 2 3 5)
(- (+ 2 3) 5)
(加一 10)
(* 32 32)
(次方 32 2)
(平方根 1024)

]


@section[#:tag "number-types"]{数的类型}
@defmapping[racket/base/number-types]


@section[#:tag "generic-numerics"]{数的运算}
@defmapping[racket/base/generic-numerics]
