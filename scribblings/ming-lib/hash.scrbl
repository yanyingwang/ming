#lang scribble/manual

@(require (for-label ming/racket/base ming/racket/hash ming/racket/list
                     ming ming/list ming/hash)
           scribble/eval)
@(define the-eval
         (make-eval-factory '(ming/racket/base ming/racket/hash ming/hash)))

@(require (file "../../private/scribble-styles/css/ming-fonts.css.rkt"))
@css/ming-fonts
@(require scribble-rainbow-delimiters)
@script/rainbow-delimiters*

@title[#:tag "ming-hash"]{􏿰}
@defmodule[ming/hash]
Racket标准库@secref["hash"]的名语言扩展。
@margin-note{本页所列之例程的实现代码是名语言，因此源代码有参照意义。}

@defthing[空􏿳 􏿳?]{
生成@racket[空]@racket[􏿳]，与@code{(􏿳)}等同。

@examples[#:eval (the-eval)
空􏿳
]
}

@defproc[(􏿳 [V any?] ...) 􏿳?]{
生成元素是“键值对”之@racket[􏿴]。
@margin-note{
@bold{@litchar{􏿳}为新造字}
@itemlist[
@item{该字仿照@litchar{􏿴}字而造，表示其也是一种@racket[􏿴]数据结构；}
@item{偏旁@litchar{双}表示该数据的主要组成元素是一种“键值对”（类似@racket[双]）。}
]
}
@examples[#:eval (the-eval)
(􏿳 1 2 3 4)
(􏿳)
(􏿳 1)
(􏿳 1 2 3)
]
}

@defproc[(􏾌 [V any?] ...) 􏾌?]{
生成“键值对”之唯一性通过@racket[同?]来确立的@racket[􏿰]。
@margin-note{另见：@racket[􏾋]、@racket[􏾊]、@racket[􏾉]。}
@examples[#:eval (the-eval)
(􏾌 1 2 3 4)
]
}

@deftogether[(
@defproc[(􏾐 [V any?] ...) 􏾐?]
@defproc[(􏾐? [V any?]) boolean?])]{
生成“键值对”不可被增、删、改的@racket[􏿰]（另见：@racket[固?]）。
@examples[#:eval (the-eval)
(􏾐 1 2 3 4)
(􏾐? (􏾐 1 2 3 4))
(􏾎? (􏾐 1 2 3 4))
(􏾌? (􏾐 1 2 3 4))
(􏿰? (􏾐 1 2 3 4))
]
}


@deftogether[(
@defproc[(􏾑 [V any?] ...) 􏾑?]
@defproc[(􏾑? [V any?]) boolean?])]{
生成“键值对”可被增、删、改的@racket[􏿰]（另见：@racket[易?]）。
@examples[#:eval (the-eval)
(􏾑 1 2 3 4)
(􏾑? (􏾑 1 2 3 4))
(􏾎? (􏾑 1 2 3 4))
(􏾌? (􏾑 1 2 3 4))
(􏿰? (􏾑 1 2 3 4))
]
}
