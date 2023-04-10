#lang scribble/manual

@(require (for-label ming/racket/base ming/racket/list)
           ming/list
           scribble/eval)
@(define the-eval
         (make-eval-factory '(ming/racket/base ming/racket/list ming/list)))

@(require (file "../../private/scribble-styles/css/ming-fonts.css.rkt"))
@css/ming-fonts
@(require scribble-rainbow-delimiters)
@script/rainbow-delimiters*


@title[#:tag "ming-lists"]{􏿴}
@defmodule[ming/list]
Racket标准库@secref["pairs-and-lists"]的名语言扩展。
@margin-note{本页所列之例程的实现代码是名语言，因此源代码有参照意义。}

@; @section{􏿊、􏿚}
@; @margin-note{
@; @bold{“@racket[􏿊]”为新造字}
@; @itemlist[
@; @item{在“@racket[笈]”字的基础上添加了左偏旁“亻”，表示例程的出参数据类型和入参的相同(即均为@elemref["what-is-􏿴􏿫" "􏿴"])；}
@; ]
@; }
@section{引*、𠇁~}
@margin-note{另见：@racket[引]、@racket[引/入]，@racket[𠇁/入]、@racket[𠇁/入]}
@deftogether[(
@defproc[(引* [LST 􏿴?] [V any/c])
          精确非负整数殖?]
@defproc[(𠇁~ [LST 􏿴?] [V any/c])
         (listof 精确非负整数?)]
@defproc[(引*/入 [LST 􏿴?] [PROC 程?])
          精确非负整数殖?]
@defproc[(𠇁~/入 [LST 􏿴?] [PROC 程?])
         (listof 精确非负整数?)]
)]{
@racket[引*]、@racket[引*/入]分别与@racket[𠇁]、@racket[𠇁/入]同，除返回值不同外。 @linebreak{}
@racket[𠇁~]、@racket[𠇁~/入]分别与@racket[引]、@racket[引/入]同，除返回值不同外。
@examples[#:eval (the-eval)
(引* '(a b c d c f) 'c)
(𠇁~ '(a b c d c f) 'c)
(引*/入 '(a 32 c 11 c f) 数?)
(𠇁~/入 '(a 32 c 11 c f) 数?)
]
}



@; @margin-note{
@; @bold{“@racket[􏿚]”为新造字}
@; @itemlist[
@; @item{在“@racket[笈]”字的基础上添加了一个“多”字，表示例程相较之会（反复多次的）取出所有满足条件的元素。；}
@; ]
@; }
@; @defproc[(􏿚 [lst 􏿴?] [v any/c])
@;           􏾴?]{
@; 与@racket[笈]类似，但返回的是满足条件的所有元素。
@; @examples[#:eval (the-eval)
@; (笈 '(a b c d c f) 'c)
@; (􏿚 '(a b c d c f) 'c)
@; ]
@; }

@; @defproc[(筛分* [程A 程?] [某􏿴 􏿴?])
@;           􏿴?]{
@; 与@racket[筛分]类似，除返回值不同外。
@; @examples[#:eval (the-eval)
@; (筛分* 数? '(a bb 22 jj 38 ic))
@; ]
@; }

@; @deftogether[(
@; @defproc[(分* [某􏿴 􏿴?] [数A 数?])
@;           􏿴?]
@; @defproc[(右分* [某􏿴 􏿴?] [数A 数?])
@;           􏿴?]
@; @defproc[(分*/入 [某􏿴 􏿴?] [数A 数?])
@;           􏿴?]
@; @defproc[(右分*/入 [某􏿴 􏿴?] [数A 数?])
@;           􏿴?]
@; )]{
@; 依次与@racket[分]、@racket[右分]、@racket[分/入]、@racket[右分/入]类似，除返回值不同外。
@; @examples[#:eval (the-eval)
@; (分* '(a b c d e f) 2)
@; (右分* '(a b c d e f) 2)
@; (分*/入 '(a b c d 1 f) 词?)
@; (右分*/入 '(a b c d 1 f) 词?)
@; ]
@; }

@deftogether[(
@defproc[(弔-* [LST 􏿴?] [V 精确非负整数?] ...)
          殖?]
@defproc[(伄-* [LST 􏿴?] [V 精确非负整数?] ...)
          􏿴?]
@defproc[(伄^ [LST 􏿴?] [V-LST (listof 精确非负整数?)])
          􏿴?]
@defproc[(弔^ [LST 􏿴?] [V-LST (listof 精确非负整数?)])
          殖?]
)]{
@itemlist[
@item{@racket[弔-*]：以多个@racket[V]作为索引来查找出@racket[LST]中全部对应的元素。}
@item{@racket[伄-*]：与上同，除了出参类型不同外。}
@item{@racket[伄^]：与上同，除了入参类型不同外。 }
@item{@racket[弔^]：与上同，除了出参类型不同外。}
]

@margin-note{另见：@racket[弔]}
@examples[#:eval (the-eval)
(弔-* '(a b c d e f g) 0 2 3)
(伄-* '(a b c d e f g) 0 2 3)
(伄^ '(a b c d e f g) '(0 2 3))
(弔^ '(a b c d e f g) '(0 2 3))
]
}


@deftogether[(
@defproc[(􏾝 [LST 􏿴?] [N1 精确非负整数?] [N2 精确非负整数?])
          􏿴?]
@defproc[(􏾝* [LST 􏿴?] [N1 精确非负整数?] [N2 精确非负整数?])
          􏿴?]
)]{
@racket[􏾝]：返回@racket[LST]的第@racket[N1]至第@racket[N2]之间的元素（从0算起，包含N1不包含N2）。@linebreak[]
@racket[􏾝*]：返回@racket[LST]的第@racket[N1]至第@racket[N2]之间的元素（从0算起，包含N1也包含N2）。
@margin-note{另见：@racket[􏾺]、@racket[𨚞]}
@examples[#:eval (the-eval)
(􏾝 '(a b c d e f) 0 0)
(􏾝 '(a b c d e f) 0 1)
(􏾝 '(a b c d e f) 1 2)
(􏾝 '(a b c d e f) 0 2)
(􏾝 '(a b c d e f) 0 5)
(􏾝 '(a b c d e f) 2 5)

(􏾝* '(a b c d e f) 0 0)
(􏾝* '(a b c d e f) 0 1)
(􏾝* '(a b c d e f) 1 2)
(􏾝* '(a b c d e f) 0 2)
(􏾝* '(a b c d e f) 0 5)
(􏾝* '(a b c d e f) 2 5)
]
}

@defproc[(𬩵 [LST 􏿴?] [N1 精确非负整数?] [N2 精确非负整数?])
          􏿴?]{
返回@racket[LST]的中间那部分元素（左边移除N1个元素，右边移除N2个元素）。
@margin-note{
本例程即是如下代码的转换： @linebreak{}
@code{(􏷴 (􏷵 LST N1) N2)}
}
@margin-note{另见：@racket[􏾺]、@racket[𨚞]}

@examples[#:eval (the-eval)
(𬩵 '(a b c d e f g) 1 3)
]
}


@defproc[(度/入 [LST 􏿴?] [PROC 程?])
          精确非负整数?]{
以@racket[PROC]来测量@racket[LST]的长度。
@margin-note{另见：@racket[度]、@racket[􏷹度]}
@examples[#:eval (the-eval)
(度/入 '(a b 12 c 33 d  58 f g) 数?)
]
}


@defproc[(􏷲 [V any/c] [LST 􏿴?] (PROC 程? 同?))
          􏿴?]{
从@racket[LST]中找出@racket[V]并移除之。
@margin-note{另见：@racket[􏷲~]、@racket[􏷲^]}
@examples[#:eval (the-eval)
(􏷲 'c '(a b c d e c f))
]
}

