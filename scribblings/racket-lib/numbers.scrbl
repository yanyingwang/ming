#lang scribble/manual


@(require (for-label racket ming)
           scribble/eval
           ming/scribble
           )
@(define the-eval
         (make-eval-factory '(ming/racket/base)))

@(require (file "../../private/scribble-styles/css/ming-fonts.css.rkt"))
@css/ming-fonts
@(require scribble-rainbow-delimiters)
@script/rainbow-delimiters*


@title[#:tag "numbers"]{数}

@margin-note{在跟“数字”相关的例程命名中，@litchar{数}被简写为@litchar{米}偏旁，以便用单字表示跟其相关的概念。}

@section{示例}
@examples[#:eval (the-eval)
(𥻑? 2)
(粰? 1.1)
(+ 2 3 5)
(- (+ 2 3) 5)
(􏽊 10)
(􏽉 10)
(* 32 32)
(次方 32 2)
(平方根 1024)
]

@section[#:tag "number-types"]{数的类型例程}
@defmapping[racket/base/number-types]


@section[#:tag "generic-numerics"]{数的运算例程}
@defmapping[racket/base/generic-numerics]
