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

@deftogether[(
@defproc[(􏾌 [V any?] ...) 􏾌?]
@defproc[(􏾑 [V any?] ...) 􏾑?]
)]{
@racket[􏾌]：生成“键值对”的唯一性是通过@racket[同?]来确立的@racket[􏿰]。 @linebreak{}
@racket[􏾑]：生成“键值对”可被增、删、改的@racket[􏿰]（另见：@racket[易?]）。
@margin-note{另见：@racket[􏿰]、@racket[􏾋]、@racket[􏾊]、@racket[􏾉]。}
@examples[#:eval (the-eval)
(􏾌 1 2 3 4)
(􏾑 1 2 3 4)
(􏽦? (􏾌 1 2 3 4))
(􏽦? (􏾑 1 2 3 4))
]
}

@deftogether[(
@defproc[(􏾑? [V any?]) boolean?]
@defproc[(􏾐? [V any?]) boolean?])]{
@examples[#:eval (the-eval)
(􏾐? (􏿰 1 2 3 4))
(􏾑? (􏾑 1 2 3 4))
(􏾑? (􏿰^ '((1 . 2) (3 . 4))))
(􏾐? (􏾐^ '((1 . 2) (3 . 4))))
]
}


@deftogether[(
@defproc[(􏽞? (V any?)) boolean?]
@defproc[(􏽝? (V any?)) boolean?]
@defproc[(􏽜? (V any?)) boolean?]
@defproc[(􏽛? (V any?)) boolean?]
)]{
@racket[􏾐?]、@racket[􏾑?]和@racket[􏾎?]、@racket[􏾏?]
之间的互相组合类推例程。@linebreak{}
例如：@racket[􏽞?]等价于@code{(且 (􏾎? V) (􏾐? V))}。
@margin-note{
@bold{
@litchar{􏽞}、@litchar{􏽝}、@litchar{􏽜}、@litchar{􏽛}是新造字
}
@itemlist[
@item{@litchar{十}：@litchar{艹}的简写；}
@item{@litchar{丿一丶}：@litchar{⺮}的简写；}
@item{@litchar{丷}：@litchar{氵}的简写。}
]
}
@examples[#:eval (the-eval)
(􏽞? (􏿰 1 2 3 4))
(􏽝? (􏾑 1 2 3 4))
(􏽝? (􏿰^ '((1 . 2) (3 . 4))))
(􏽞? (􏾐^ '((1 . 2) (3 . 4))))

(􏽞? (􏾋 1 2 3 4))
]
}


@deftogether[(
@defproc[(􏽮? (V any?)) boolean?]
@defproc[(􏽭? (V any?)) boolean?]
@defproc[(􏽬? (V any?)) boolean?]
@defproc[(􏽫? (V any?)) boolean?]
@defproc[(􏽦? (V any?)) boolean?]
@defproc[(􏽥? (V any?)) boolean?]
@defproc[(􏽤? (V any?)) boolean?]
@defproc[(􏽣? (V any?)) boolean?]
@defproc[(􏽪? (V any?)) boolean?]
@defproc[(􏽩? (V any?)) boolean?]
@defproc[(􏽨? (V any?)) boolean?]
@defproc[(􏽧? (V any?)) boolean?]
@defproc[(􏽢? (V any?)) boolean?]
@defproc[(􏽡? (V any?)) boolean?]
@defproc[(􏽠? (V any?)) boolean?]
@defproc[(􏽟? (V any?)) boolean?]
)]{

@racket[􏾌?]、@racket[􏾋?]、@racket[􏾊?]、@racket[􏾉?]和
@racket[􏽞?]、@racket[􏽝?]，@racket[􏽜?]、@racket[􏽛?]之间
的各种互相组合类推例程。@linebreak{}
例如：@racket[􏽮?]等价于@code{(且 (􏾌? V) (􏽞? V))}。
@margin-note{
@bold{
@litchar{􏽮}、@litchar{􏽭}、@litchar{􏽬}、@litchar{􏽫}是新造字@linebreak{}
@litchar{􏽦}、@litchar{􏽥}、@litchar{􏽤}、@litchar{􏽣}是新造字@linebreak{}
@litchar{􏽪}、@litchar{􏽩}、@litchar{􏽨}、@litchar{􏽧}是新造字@linebreak{}
@litchar{􏽢}、@litchar{􏽡}、@litchar{􏽠}、@litchar{􏽟}是新造字
}
}
@examples[#:eval (the-eval)
(􏽮? (􏿰 1 2 3 4))
(􏽦? (􏾑 1 2 3 4))

(􏽦? (􏿰^ '((1 . 2) (3 . 4))))
(􏽢? (􏾏^ '((1 . 2) (3 . 4))))
(􏽡? (􏾁^ '((1 . 2) (3 . 4))))

(􏽞? (􏾋 1 2 3 4))
(􏽭? (􏾋 1 2 3 4))
]
}
