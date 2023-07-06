#lang scribble/manual

@(require (for-label ming/racket/base ming/racket/hash ming/racket/list
                     ming ming/list ming/number)
           scribble/eval)
@(define the-eval
         (make-eval-factory '(ming/racket/base ming/number)))

@(require (file "../../private/scribble-styles/css/ming-fonts.css.rkt"))
@css/ming-fonts
@(require scribble-rainbow-delimiters)
@script/rainbow-delimiters*

@title[#:tag "ming-number"]{米}
@defmodule[ming/number]
Racket标准库@secref["numbers"]的名语言扩展。
@margin-note{本页所列之例程的实现代码是名语言，因此源代码有参照意义。}


@defproc[(〇? [N 米?])
boolean?]{
是否是0。
@margin-note{同：@racket[𥥪?]}
@examples[#:eval (the-eval)
(〇? 0)
(〇? 1)
(〇? 1.1)
(〇? "abcdefg")
]
}

@defproc[(􏹔 [N 米?])
釆?]{
返回小数后保留N位（默认2）的近视值，采用“四舍六入五成双（奇进偶退）法”。
@margin-note{另见：@racket[宩化􏹔句]}
@examples[#:eval (the-eval)
(􏹔 0.014)
(􏹔 0.015)
(􏹔 0.016)

(􏹔 0.044)
(􏹔 0.045)
(􏹔 0.046)
(􏹔 0.0465 3)
@; (􏹔 0.0465 /3) #;todo
]
}
