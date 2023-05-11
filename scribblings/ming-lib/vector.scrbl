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


@; @defthing[空􏿲 􏿲?]{
@; 生成@racket[空]@racket[􏿲]，与@code{(􏿲)}等同。
@; @examples[#:eval (the-eval)
@; 空􏿲
@; (􏿲)
@; ]
@; }

@defproc[(􏽓 [V 精确非负整数?] ...)
􏽓?]{
@margin-note{参见：@racket[易?]}
@margin-note{另见：@racket[􏿲]、@racket[􏽔]}
生成内容可以被修改的数组。
@examples[#:eval (the-eval)
(􏽓 1 2 3 4)
]
}

@deftogether[(
@defproc[(􏽓? [VEC any?])
          boolean?]
          @defproc[(􏽔? [VEC any?])
          boolean?])]{
@margin-note{
@itemlist[
@item{
@code{(􏽓? VEC)}等同于：
@code{(且 (易? VEC) (􏿲? VEC))}
}
@item{
@code{(􏽔? VEC)}等同于：
@code{(且 (固? VEC) (􏿲? VEC))}
}
]
}
是否是@racket[􏽓]和@racket[􏽔]。
@examples[#:eval (the-eval)
(􏽓? '#(1 2 3 4))
(􏽔? '#(1 2 3 4))
]
}

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
@defproc[(􏿲􏾝化殖* [VEC 􏿲?] [N1 精确非负整数?] [N2 精确非负整数?])
         殖?])]{
@margin-note{另见：@racket[􏿲􏾝*]、@racket[􏿲􏾝化殖]}
@examples[#:eval (the-eval)
(􏿲化殖 '#(a b c d))
(􏿲􏾝化殖* '#(a b c d) 0 2)
]
}


@defproc[(􏿲􏾩/以􏾝* [VEC 􏿲?] [N 精确非负整数?] [VECC 􏿲?] [NN1 精确非负整数?] [NN2 精确非负整数?])
􏿲?]{
@margin-note{另见：@racket[􏿲􏾩/以􏾝]}
@examples[#:eval (the-eval)
(名 vec (􏿲 'a 'b 'c 'd))
(名 vecc (􏿲 'aa 'bb 'cc 'dd))
(􏿲􏾩/以􏾝* vec 0 vecc 1 3)
vec
]
}

@defproc[(易? [V any?]) boolean?]{
@racket[固?]的反义。
@examples[#:eval (the-eval)
(名 vec (􏿲 'a 'b 'c 'd))
(名 vecc (􏿲 'aa 'bb 'cc 'dd))
(􏿲􏾩/以􏾝* vec 0 vecc 1 3)
vec
]
}
