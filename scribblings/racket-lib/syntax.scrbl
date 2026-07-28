#lang scribble/manual

@(require (for-label racket ming ming/list)
           scribble/eval
           ming/scribble
           )
@(define the-eval
         (make-eval-factory '(ming/racket/base ming/racket/list)))


@(require (file "../../private/scribble-styles/css/ming-fonts.css.rkt"))
@css/ming-fonts
@(require scribble-rainbow-delimiters)
@script/rainbow-delimiters*


@title[#:tag "syntax"]{文}
Originates from @tech[#:doc '(lib "scribblings/reference/reference.scrbl") "syntax object"].

@defideogr[文 "syntax" "文" "tatoo, text, texture, script"]
@defideogr[卩 "identifier" "卩" "identifier, token, certificate"]{
Also can be seen as the short for @zi-tool{节}.
}

@examples[#:eval (the-eval)
(文? #'(+ 1 2))
(文? #'(+ 1 2))
(文? #'1)
(卩? #'1)
]


@section{􏵥 􏵢 􏵡 􏵣 􏵤}
@tech[#:doc '(lib "scribblings/reference/reference.scrbl") "source location"] is especially called @zi[􏵟], which has fields we call: @zi[􏵥], @zi[􏵡], @zi[􏵢], @zi[􏵣], @zi[􏵤].

@defideogr[􏵟 (文 元) "source location of syntax" #f #f]
@defideogr[􏵥 (文 止) "path of source location" #f #f]
@defideogr[􏵢 (文 韦) "line of source location" #f #f]
@defideogr[􏵡 (文 𢀖) "column of source location" #f #f]
@defideogr[􏵤 (文 占) "span of source location" #f #f]
@defideogr[元 "source location" "元" "head, begining, original"]
@defideogr[止 "location, path" "止" "foot, footprint"]{
Also can be seen as the short for @zi-tool{址}, which exactly means @italic{address, location}.
}
@defideogr[𢀖 "column" "𢀖" "the vertical line in the loom"]{
Also can be seen as the short for @zi-tool{经}.
}
@defideogr[韦 "line" "韦" "the horizontal line in the loom"]{
Also can be seen as the short for @zi-tool{纬}.
}
@defideogr[立 "position" "立" "positon, location"]{
Also can be seen as the short for @zi-tool{位}, which exactly means @italic{position}.
}
@defideogr[占 "span" "占" "occupy"]

@examples[#:eval (the-eval)
(􏵥 #'a)
(􏵡 #'a)
(􏵢 #'a)
(􏵣 #'a)
(􏵤 #'a)
]
 
@section{刘 文化􏿴 文化云 云化文}
@defideogr[云 "data" "云" "cloud"]
@defideogr[刘 (文 刂) "unwrap syntax" "刘" "a kind of weapon, kill"]{
@zi[刂] especially means @italic{unwrap} here when it comes to @litchar{文} as component in the character.
}

@examples[#:eval (the-eval)
(刘 #'a)
(刘 #'(a b c))
(文化􏿴 #'(a b c))
(文化云 #'(a b c))
(云化文 #f '(a b c))
]



@section[#:tag "syntax-base"]{基础例程}
@defmodule[ming/racket/base]
@defmapping[racket/base/syntax]

@; @section[#:tag "syntax-additional"]{额外例程}
@; @defmodule[ming/racket/syntax]
@; @defmapping[racket/syntax]
