#lang scribble/manual

@(require (for-label ming/racket/base ming/racket/hash ming/racket/list
                     ming ming/list ming/string  ming/hash)
           scribble/eval)
@(define the-eval
         (make-eval-factory '(ming/racket/base ming/racket/string ming/string)))

@(require (file "../../private/scribble-styles/css/ming-fonts.css.rkt"))
@css/ming-fonts
@(require scribble-rainbow-delimiters)
@script/rainbow-delimiters*

@title[#:tag "ming-string"]{句}
@defmodule[ming/string]
Racket标准库@secref["string"]的名语言扩展。
@margin-note{本页所列之例程的实现代码是名语言，因此源代码有参照意义。}


@deftogether[(
@defproc[(􏽀 [V any?] ...) 􏽀?]
@defproc[(􏽁 [V any?] ...) 􏽁?]
)]{
@margin-note{参见：@racket[􏾐]、@racket[􏾑]。}
@racket[􏽀]：生成内容可以被修改的“字符串”。 @linebreak{}
@racket[􏽀]：生成内容不可被修改的“字符串”。
@examples[#:eval (the-eval)
(􏽀 #\a #\b #\c #\d)
(􏽁 #\a #\b #\c #\d)
]
}

@deftogether[(
@defproc[(􏽀? [V any?]) boolean?]
@defproc[(􏽁? [V any?]) boolean?])]{
@racket[􏽀?]：是否是@racket[􏽀]； @linebreak{}
@racket[􏽁?]：是否是@racket[􏽁]。
@examples[#:eval (the-eval)
(􏽀? (􏽀 #\a #\b #\c #\d))
(􏽁? (􏽁 #\a #\b #\c #\d))
]
}


@defproc[(邭* [STR 句?] [N1 精确非负整数?] [N2 精确非负整数?])
句?]{
@margin-note{另见：@racket[邭]}
@examples[#:eval (the-eval)
(邭* "abcdefg" 0 2)
]
}
