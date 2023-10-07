#lang scribble/manual

@(require (for-label racket ming ming/kernel)
           scribble/eval
           ming/scribble
           )
@(define the-eval
         (make-eval-factory '(ming/racket/base ming/kernel ming/racket/function)))

@(require (file "../../private/scribble-styles/css/ming-fonts.css.rkt"))
@css/ming-fonts
@(require scribble-rainbow-delimiters)
@script/rainbow-delimiters*


@title[#:tag "conditionals"]{Conditionals}

@section+autotag{丫，􏸣、􏸟}
@像注{@racket[􏸞]}
@itemlist[
@item{@defzi["丫"]{imagine a data flow that is importing in, and there are two paths it can be exported out.}}
@item{@defzi["􏸣"]{for the data flow case of @litchar{丫}, imagine @litchar{一} as a barrier which has blocked one direction of the export paths, thus the other export path is extended.}}
@item{@defzi["􏸟"]{@code{(􏸟 a b1 ...)} is short for @code{(􏸣 (非 a) b1 ...)}.}}
]
@examples[#:eval (the-eval)
(丫 (= 1 1) 'equal 'unequal)
(􏸣 (= 1 1) 'equal)
(􏸟 (= 1 2) 'unequal)
]


@section+autotag{并、戈}
@itemlist[
@item{
@defzi["并"]{simplifies from @litchar{𠀤} in ancient chinese, means @elucidate{merge two or more than two objects as one}, especially means @elucidate{and} in ming-lang.}
}
@item{
@defzi["戈"]{simplifies from @litchar{或}, means @italic{or} in modern chinese.}
}
]
@examples[#:eval (the-eval)
(并 1 2 3)
(戈 1 2 3)
(并 #t #t #f)
(戈 #f #f #t)
]


@section+autotag{当、肖，夬}
@itemlist[
@item{@defzi["当"]{means @italic{when, on the condition of} in modern chinese.}}
@item{@defzi["肖"]{means @italic{resemble, case} in modern chinese.}}
@item{
@defzi["夬"]{simplifies from @litchar{缺} or @litchar{决} in ancient chinese, especially means @elucidate{when no conditions or cases take effect} in ming-lang. @linebreak{}
Imagine that the data flow is importing in, lots of conditions and cases are implemented as export paths, @litchar{夬} is a breaking point for data to export when no valid conditions and cases are effective.}
}
]
@examples[#:eval (the-eval)
(当
  [(􏻛? 0) (displayln "positive number")]
  [(􏻛? 0) (displayln "negative number")]
  [夬 (displayln "neither positive or negative number")]
)

(肖 (+ 1 1)
  [(1 2 3) (displayln "result is 1 or 2 or 3")]
  [(4 5 6) (displayln "result is 4 or 5 or 6")]
  [夬 (displayln "result is neither 1-3 or 4-6")]
)
]

@section+autotag{非}
@像注{@racket[𥟍]}
@defzi["非"]{means @elucidate{not} in modern chinese.}
@examples[#:eval (the-eval)
(非 1)
((𥟍 𥥪?) 1)
]


@section[#:tag "base-conditionals"]{References}
@defmodule[ming/racket/base]
@defmapping[racket/base/conditionals]




