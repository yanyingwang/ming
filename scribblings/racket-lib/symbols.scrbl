#lang scribble/manual

@(require (for-label racket ming ming/list)
           scribble/eval
           ming/scribble
           )
@(define the-eval
         (make-eval-factory '(ming/racket/base ming/racket/symbol)))


@(require (file "../../private/scribble-styles/css/ming-fonts.css.rkt"))
@css/ming-fonts
@(require scribble-rainbow-delimiters)
@script/rainbow-delimiters*

@title[#:tag "symbols"]{􏷂}
Originates from @secref["symbols" #:doc '(lib "scribblings/reference/reference.scrbl")].

@section[#:tag "naming-rules-of-symbol"]{Naming Rules}
@; @secref["naming-rules"]

@section[#:tag "symbol-interned-uninterned-unreadable"]{􏷂 􏺏 􏺍 􏺋}
@racket[􏷂] normally is 􏺏(interned symbol). Also can be：􏺍(uninterned), 􏺋(unreadable, partially interned).

@defideogr[􏷂 "string" "勺" "spoon, spoon-shape objects"]
@defideogr[罒 "interned" "罒" "fishing or bird net, net-shape object, caught by net"]
@defideogr[􏺎 "uninterned" #f #f]{
Resembles @zi[罒], but is broken, thus means "broken bird net".
}
@defideogr[龱 "unreadable, partially interned" #f #f]{
resembles @zi[罒], but is unreadable and "moderate broken bird net".
}
@defideogr[􏺏 (罒 􏷂) #f #f #f]{
Resembles Chinese characters such as @zi-tool{罚}, thus have a simliar meaning.
}
@defideogr[􏺍 (􏺎 􏷂) #f #f #f]
@defideogr[􏺋 (龱 􏷂) #f #f #f]

@examples[#:eval (the-eval)
(􏷂? 'apple)
(􏺏? 'apple)
(􏺋? 'apple)
(􏺌 'apple)
(􏺏? (􏺌 'apple))
]

@section[#:tag "convert-symbols-to-others"]{􏷂化􏽁 􏷂化句 句化􏷂 句化􏺍 句化􏺋}
@examples[#:eval (the-eval)
(􏷂化􏽁 'symbol)
(􏷂化句 'symbol)

(句化􏷂 "string")
(句化􏺍 "string")
(句化􏺋 "string")
]

@section[#:tag "symbols-base"]{ming/racket/base}
@defmodule[ming/racket/base]
@defmapping[racket/base/symbols]

@section[#:tag "symbols-additional"]{ming/racket/symbol}
@defmodule[ming/racket/symbol]
@defmapping[racket/symbol]
