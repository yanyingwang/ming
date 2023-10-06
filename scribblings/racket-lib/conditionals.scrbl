#lang scribble/manual

@(require (for-label racket ming ming/conditional)
           scribble/eval
           ming/scribble
           )
@(define the-eval
         (make-eval-factory '(ming/racket/base ming/conditional)))

@(require (file "../../private/scribble-styles/css/ming-fonts.css.rkt"))
@css/ming-fonts
@(require scribble-rainbow-delimiters)
@script/rainbow-delimiters*


@title[#:tag "conditionals"]{conditionals}


@section+elemref{丫、􏸞，􏸣、􏸟}
@itemlist[
@item{@litchar{丫}：imagine a data flowing that is imported in, and there are two paths it can be exported out.}
@item{@litchar{􏸣}：for the data flowing case of @litchar{丫}, imagine @litchar{一} as a barrier which has obstacled one direction of the export paths, thus the other export path is extending.}
@item{@litchar{􏸞}：shorts for @code{(丫 (非 a) b c)}.}
@item{@litchar{􏸟}：shorts for @code{(􏸣 (非 a) b1 b2 b3)}.}
]
@examples[#:eval (the-eval)
(丫 (= 1 1) 'equal 'unequal)
(􏸞 (= 1 1) 'unequal 'equal)

(􏸣 (= 1 1) 'equal)
(􏸟 (= 1 2) 'unequal)
]


@section+elemref{并、戈}
@itemlist[
@item{@litchar{并}：means "merge" in modern chinese, especially borrow as the meaning of "and" in ming-lang.}
@item{@litchar{戈}：shorts for @litchar{或}, which means "or" in modern chinese.}
]
@examples[#:eval (the-eval)
(并 1 2 3)
(戈 1 2 3)

(并 #t)
(并 #f)
(并 #t #f)
(并 #t #t #f)

(戈 #t)
(戈 #f)
(戈 #t #f)
(戈 #f #f #t)
]



@section[#:tag "base-conditionals"]{References}
@defmodule[ming/racket/base]
@defmapping[racket/base/conditionals]
