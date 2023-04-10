#lang scribble/manual

@(require (for-label ming/racket/base ming/racket/vector ming/racket/list
                     ming ming/vector ming/list)
           scribble/eval)
@(define the-eval
         (make-eval-factory '(ming/racket/base ming/racket/vector ming/vector)))

@(require (file "../../private/scribble-styles/css/ming-fonts.css.rkt"))
@css/ming-fonts
@(require scribble-rainbow-delimiters)
@script/rainbow-delimiters*


@title[#:tag "ming-vector"]{􏿲}
@defmodule[ming/vector]
Racket标准库@secref["vector"]的名语言扩展。
@margin-note{本页所列之例程的实现代码是名语言，因此源代码有参照意义。}


@defproc[(􏿲􏾝* [VEC 􏿲?] [N1 精确非负整数?] [N2 精确非负整数?])
􏿲?]{
@margin-note{另见：@racket[􏿲􏾝*]}
@examples[#:eval (the-eval)
(􏿲􏾝* '#(a b c d e f) 0 2)
]
}


@deftogether[(
@defproc[(􏿲化殖 [VEC 􏿲?])
          殖?]
@defproc[(􏿲􏾝*化殖 [VEC 􏿲?] [N1 精确非负整数?] [N2 精确非负整数?])
         殖?])]{
@margin-note{另见：@racket[􏿲􏾝*]、@racket[􏿲􏾝化殖]}
@examples[#:eval (the-eval)
(􏿲化殖 '#(a b c d))
(􏿲􏾝*化殖 '#(a b c d) 0 2)
]
}


@defproc[(􏿲攸!/以􏾝* [VEC 􏿲?] [N 精确非负整数?] [VECC 􏿲?] [NN1 精确非负整数?] [NN2 精确非负整数?])
􏿲?]{
@margin-note{另见：@racket[􏿲攸!/以􏾝]}
@examples[#:eval (the-eval)
(名 vec (􏿲 'a 'b 'c 'd))
(名 vecc (􏿲 'aa 'bb 'cc 'dd))
(􏿲攸!/以􏾝* vec 0 vecc 1 3)
vec
]
}
