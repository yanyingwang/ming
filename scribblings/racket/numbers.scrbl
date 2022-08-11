#lang scribble/manual

@(require (for-label racket ming)
           scribble/eval
           scribble-rainbow-delimiters
           ming/scribble
           )
@; @(define the-eval
@;          (make-eval-factory '(ming/racket/base)))


@; @script/rainbow-delimiters*

@title[#:tag "numbers"]{数}

@section[#:tag "number-types"]{数的类型}
@defmapping[racket/base/number-types]


@section[#:tag "generic-numerics"]{数的运算}
@defmapping[racket/base/generic-numerics]
