#lang scribble/manual

@(require (for-label ming/racket/base ming/racket/list ming/list)
           ming/list
           scribble/eval)
@(define the-eval
         (make-eval-factory '(ming/racket/base ming/racket/list ming/list)))

@(require (file "../../private/scribble-styles/css/fonts.css.rkt"))
@css/wenquan-extend-font
@(require scribble-rainbow-delimiters)
@script/rainbow-delimiters*


@title[#:tag "lists"]{􏿴}
@defmodule[ming/list]
名语言对Racket标准库@secref["pairs-and-lists"]的扩展。

@margin-note{本页所列之例程的实现代码是名语言，因此源代码有参照意义。}

@section{􏿊、􏿚}
@secref["第_笈_􏿉" #:doc '(lib "ming/scribblings/ming.scrbl")]的扩展例程。
@margin-note{
@bold{“@racket[􏿊]”为新造字}
@itemlist[
@item{在“@racket[笈]”字的基础上添加了左偏旁“亻”，表示例程的出参数据类型和入参的相同(即均为@elemref["what-is-􏿴􏿫" "􏿴"])；}
]
}
@defproc[(􏿊 [lst 􏿴?] [v any/c])
          􏿴?]{
与@racket[笈]类似，除返回值不同外。
@examples[#:eval (the-eval)
(笈 '(a b c d c f) 'c)
(􏿊 '(a b c d c f) 'c)
]
}

@margin-note{
@bold{“@racket[􏿚]”为新造字}
@itemlist[
@item{在“@racket[笈]”字的基础上添加了一个“多”字，表示例程相较之会（反复多次的）取出所有满足条件的元素。；}
]
}
@defproc[(􏿚 [lst 􏿴?] [v any/c])
          徝?]{
与@racket[笈]类似，但返回的是满足条件的所有元素。
@examples[#:eval (the-eval)
(笈 '(a b c d c f) 'c)
(􏿚 '(a b c d c f) 'c)
]
}





@defproc[(筛分* [程A 程?] [某􏿴 􏿴?])
          􏿴?]{
与@racket[筛分]类似，除返回值不同外。
@examples[#:eval (the-eval)
(筛分* 数? '(a bb 22 jj 38 ic))
]
}

@deftogether[(
@defproc[(分* [某􏿴 􏿴?] [数A 数?])
          􏿴?]
@defproc[(右分* [某􏿴 􏿴?] [数A 数?])
          􏿴?]
@defproc[(分*/入 [某􏿴 􏿴?] [数A 数?])
          􏿴?]
@defproc[(右分*/入 [某􏿴 􏿴?] [数A 数?])
          􏿴?]
)]{
依次与@racket[分]、@racket[右分]、@racket[分/入]、@racket[右分/入]类似，除返回值不同外。
@examples[#:eval (the-eval)
(分* '(a b c d e f) 2)
(右分* '(a b c d e f) 2)
(分*/入 '(a b c d 1 f) 词?)
(右分*/入 '(a b c d 1 f) 词?)
]
}

@defproc[(段 [某􏿴 􏿴?] [数A 数?] [数B 数?])
          􏿴?]{
@racket[某􏿴]的其中一段，从@racket[第]@racket[数A]处元素算起，到@racket[第]@racket[数B]止（不包括@racket[数B]）。

@examples[#:eval (the-eval)
(段 '(a b c d e f) 0 0)
(段 '(a b c d e f) 2 2)
(段 '(a b c d e f) 0 2)
]
}
