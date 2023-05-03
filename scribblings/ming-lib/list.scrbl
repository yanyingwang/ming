#lang scribble/manual

@(require (for-label ming/racket/base ming/racket/list ming/list)
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


@deftogether[(
@defproc[(引* [LST 􏿴?] [V any/c])
          精确非负整数殖?]
@defproc[(引*/入 [LST 􏿴?] [PROC 程?])
          精确非负整数殖?]
)]{
@racket[引*]、@racket[引*/入]分别是对@racket[引]、@racket[引/入]加强力度。 @linebreak{}
@margin-note{另见：@racket[引]、@racket[引v]}
@examples[#:eval (the-eval)
(引* '(a b c d c f) 'c)
(引*/入 '(a 32 c 11 c f) 数?)
]
}

@deftogether[(
@defproc[(伄 [LST 􏿴?] [N 精确非负整数?] ...)
          􏿴?]
@defproc[(伄^ [LST 􏿴?] [N-LST (listof 精确非负整数?)])
          􏿴?]
)]{
@itemlist[
@item{@racket[伄]：以多个@racket[N]作为索引来查找出@racket[LST]中全部对应的元素并组成@racket[􏿴]返回。}
@item{@racket[伄^]：与上同，除了入参类型不同外。 }
]
@margin-note{@litchar{伄}为古活字，另见：@racket[弔]}
@examples[#:eval (the-eval)
(伄 '(a b c d e f g) 0 2 3)
(伄^ '(a b c d e f g) '(0 2 3))
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
@margin-note{@litchar{􏾝}为新造字，另见：@racket[􏾺]、@racket[𨚞]}
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

@deftogether[(
@defproc[(􏾘 [LST 􏿴?] [N 精确非负整数?])
          􏿴?]
@defproc[(􏾘^ [LST 􏿴?] [N-LST (listof 精确非负整数?)])
          􏿴?]
)]{
@itemlist[
@item{@racket[􏾘]：从@racket[LST]中删除索引@racket[N]所对应的元素。}
@item{@racket[􏾘^]：与上同，除了入参类型不同外。 }
]
@margin-note{@litchar{􏾘}为新造字，另见：@racket[弔]，@racket[􏷲]，@racket[􏷶]}
@examples[#:eval (the-eval)
(􏾘 '(a b c d e f g) 1)
(􏾘^ '(a b c d e f g) '(0 1 3))
]
}


@defproc[(𬩵 [LST 􏿴?] [N1 精确非负整数?] [N2 精确非负整数?])
          􏿴?]{
返回@racket[LST]的中间那部分元素（左边移除N1个元素，右边移除N2个元素）。
@margin-note{
本例程即是如下代码的转换： @linebreak{}
@code{(􏷴 (􏷵 LST N1) N2)}
}
@margin-note{@litchar{𬩵}为古活字，另见：@racket[􏾺]、@racket[𨚞]}
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

@defproc[(偅 [LST 􏿴?])
          􏿴?]{
返回@racket[LST]中的重复元素组成的@racket[􏿴]。
@margin-note{@litchar{偅}为古活字，另见：@racket[重]}
@examples[#:eval (the-eval)
(偅 '())
(偅 '(11))
(偅 '(11 22 33 22 44))
(偅 '(11 11 11 22 55 22 33 88 88 88 99 99))
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

