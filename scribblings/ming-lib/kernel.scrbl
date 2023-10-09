#lang scribble/manual

@(require ming/scribble
          (for-label racket
                     ming/racket ming/kernel)
           scribble/example
           scribble-rainbow-delimiters
           racket/sandbox
          )

@(require (file "../../private/scribble-styles/css/ming-fonts.css.rkt"))
@css/ming-fonts
@(require scribble-rainbow-delimiters)
@script/rainbow-delimiters*

@(define the-eval
         (make-eval-factory '(ming ming/kernel)))


@script/rainbow-delimiters*

@title[#:tag "ming-kernel"]{kernel of ming lang}

@section{ming/kenel}
@defmodule[ming/kernel]
The kernel methods and syntaxes of ming lang.

@deftogether[(
@defform[(􏸧 exprs ...)]
@defform[(􏸬 arg1 exprs ...)]
@defform[(􏸫 arg1 arg2 exprs ...)]
@defform[(􏸪 arg1 arg2 arg3 exprs ...)])]{
@eleph-note{@racket[入]}

Same as:
@itemlist[
@item{@code{(λ () exprs ...)}}
@item{@code{(λ (arg1) exprs ...)}}
@item{@code{(λ (arg1 arg2) exprs ...)}}
@item{@code{(λ (arg1 arg2 arg3) exprs ...)}}
]

@examples[#:eval (the-eval)
((􏸧 (􏿴 1 2 3)))
((􏸬 x (􏿴 1 2 x)) 3)
((􏸫 x y (􏿴 1 2 x y)) 3 4)
((􏸪 x y z (􏿴 1 2 x y z)) 3 4 5)
((􏸪  x #:arg y (􏿴 1 2 x y)) 3 #:arg 4)
((􏸧 10))
((􏸬 x x) 10)
]
}

@defform[(􏸞 a b c)]{
@eleph-note{@secref{丫，􏸣、􏸟}}
Is short for @code{(丫 (非 a) b c)}, which can always be wrote as @code{(丫 a c b)}, thus it should take precedence over the previous form in using unless it's really necessary.
@examples[#:eval (the-eval)
(􏸞 (= 1 1) 'unequal 'equal)
]
}
