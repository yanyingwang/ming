#lang scribble/manual

@(require (for-label ming/racket/base ming/racket/hash ming/racket/list
                     ming ming/list ming/hash)
           ming/scribble
           scribble/eval)
@(define the-eval
         (make-eval-factory '(ming/racket/base ming/racket/hash ming/hash)))

@(require (file "../../private/scribble-styles/css/ming-fonts.css.rkt"))
@css/ming-fonts
@(require scribble-rainbow-delimiters)
@script/rainbow-delimiters*

@title[#:tag "ming-hash"]{􏿰}
@defmodule[ming/hash]
Originates from @secref["hash"].
@deftogether[(
@defproc[(􏾌 [V any?] ...) 􏾌?]
@defproc[(􏾑 [V any?] ...) 􏾑?]
)]{
@defideogr[(􏾌 􏾑) ((口 𭕄) 􏿰) #f #f #f]
@eleph-note{@racket[􏿰]、@racket[􏾋]、@racket[􏾊]、@racket[􏾉]}
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
@defideogr[(􏾑? 􏾐?) (􏾑 􏾐 ?SFX) #f #f #f]
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
@defideogr[(􏽞? 􏽝? 􏽜? 􏽛?) ((􏾐 􏾑) (􏾎 􏾏) ?SFX) #f #f #f]{
Imagines how they look lik if fully overlap as one charaters.
}
@eleph-note{@racket[􏽞?] is same as @code{(并 (􏾎? V) (􏾐? V))}}
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
@defideogr[(􏽮? 􏽭? 􏽬? 􏽫? 􏽦? 􏽥? 􏽤? 􏽣? 􏽪? 􏽩? 􏽨? 􏽧? 􏽢? 􏽡? 􏽠? 􏽟?) ((􏾌 􏾋 􏾊 􏾉) (􏽞 􏽝 􏽜 􏽛) ?SFX) #f #f #f]
@eleph-note{@racket[􏽮?] is same as @code{(并 (􏾌? V) (􏽞? V))}。}
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
