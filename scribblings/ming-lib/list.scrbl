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


@title[#:tag "ming-list"]{􏿴}
@defmodule[ming/list]
Racket标准库@secref["pairs-and-lists"]的名语言扩展。
@margin-note{本页所列之例程的实现代码是名语言，因此源代码有参照意义。}


@deftogether[(
@defproc[(弓* [LST 􏿴?] [V any/c])
          殖?]
@defproc[(弓*/入 [LST 􏿴?] [PROC 程?])
          殖?]
)]{
@racket[弓*]、@racket[弓*/入]分别是对@racket[弓]、@racket[弓/入]加强力度。 @linebreak{}
@margin-note{@litchar{弓}为活用字，另见：@racket[弓]、@racket[𰁣]}
@examples[#:eval (the-eval)
(弓* '(a b c d c f) 'c)
(弓*/入 '(a 32 c 11 c f) 米?)
]
}

@deftogether[(
@defproc[(伄 [LST 􏿴?] [N 􏺡?] ...)
          􏿴?]
@defproc[(伄^ [LST 􏿴?] [N-LST (listof 􏺡?)])
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
@defproc[(􏾝 [LST 􏿴?] [N1 􏺡?] [N2 􏺡?])
          􏿴?]
@; @defproc[(􏾝* [LST 􏿴?] [N1 􏺡?] [N2 􏺡?])
@;           􏿴?]
)]{
@racket[􏾝]：返回@racket[LST]的第@racket[N1]至第@racket[N2]之间的元素（从0算起，包含N1不包含N2）。@linebreak[]
@; @racket[􏾝*]：返回@racket[LST]的第@racket[N1]至第@racket[N2]之间的元素（从0算起，包含N1也包含N2）。
@margin-note{@litchar{􏾝}为新造字，另见：@racket[􏾺]、@racket[𨚞]}
@examples[#:eval (the-eval)
(􏾝 '(a b c d e f) 0 0)
(􏾝 '(a b c d e f) 0 1)
(􏾝 '(a b c d e f) 1 2)
(􏾝 '(a b c d e f) 0 2)
(􏾝 '(a b c d e f) 0 5)
(􏾝 '(a b c d e f) 2 5)

@; (􏾝* '(a b c d e f) 0 0)
@; (􏾝* '(a b c d e f) 0 1)
@; (􏾝* '(a b c d e f) 1 2)
@; (􏾝* '(a b c d e f) 0 2)
@; (􏾝* '(a b c d e f) 0 5)
@; (􏾝* '(a b c d e f) 2 5)
]
}

@deftogether[(
@defproc[(􏾘 [LST 􏿴?] [N 􏺡?])
          􏿴?]
@defproc[(􏾘^ [LST 􏿴?] [N-LST (listof 􏺡?)])
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


@defproc[(􏺊 [LST 􏿴?] [N 􏺡?] [M 􏺡?])
          􏿴?]{
返回@racket[LST]左边移除N个元素，右边移除M个元素后的结果。
@margin-note{
本例程等同于： @linebreak{}
@code{(􏷴 (􏷵 LST N) M)}
}
@margin-note{@litchar{􏺊}为新造字，另见：@racket[􏷵]、@racket[􏷴]}
@examples[#:eval (the-eval)
(􏺊 '(a b c d e f g) 1 3)
]
}

@defproc[(巨/入 [LST 􏿴?] [PROC 程?])
          􏺡?]{
以@racket[PROC]来测量@racket[LST]的长度。
@margin-note{@litchar{巨}为活用字，另见：@racket[巨]、@racket[􏷹巨]}
@examples[#:eval (the-eval)
(巨/入 '(a b 12 c 33 d  58 f g) 米?)
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
@margin-note{@litchar{􏷲}为新造字，另见：@racket[􏷲~]、@racket[􏷲^]}
@examples[#:eval (the-eval)
(􏷲 'c '(a b c d e c f))
]
}

@defproc[(仔? [LST1 􏿴?] [LST2 􏿴?])
          boolean?]{
@racket[LST1]是否是@racket[LST2]的子集。
@margin-note{
@bold{@litchar{仔}为活用字}
@itemlist[
@item{@litchar{子}：子集；}
@item{@litchar{亻}：见@secref["list-rules"]}
]
}
@examples[#:eval (the-eval)
(仔? '(a b) '(a b c d e f g))
(仔? '(a e) '(a b c d e f g))
(仔? '(a z) '(a b c d e f g))
]
}



@defproc[(􏿳 [V any?] ...) 􏿳?]{
生成元素是若干个“@racket[双]”的“@racket[􏿴]”，这种数据结构我们称之为“@racket[􏿳]”。“@racket[􏿳]”可以被看作是减配的“@racket[􏿰]”（比如“键值对”不必唯一）。
@margin-note{
@bold{@litchar{􏿳}为新造字}
@itemlist[
@item{@litchar{􏿳}：@litchar{双}+@litchar{􏿴}组合而成，表示其是由若干个“@racket[双]”组成的“@racket[􏿴]”数据结构；}
]
}
@margin-note{另见：@racket[􏿰]}
@examples[#:eval (the-eval)
(􏿳 1 2 3 4 1 5)
(􏿳)
(􏿳 1)
(􏿳 1 2 3)
]
}


@defproc[(􏿳? [V any?]) boolean?]{
是否是@racket[􏿳]。
@margin-note{
等同于： @linebreak{}
@code{(且 (􏿴? V) (􏷮 双? V))}
}
@examples[#:eval (the-eval)
(􏿳? '(1 2 3 4))
(􏿳? (􏿳 1 2 3 4))
(􏿳? '((1 . 2) (3 . 4)))
(􏿳? '((1 2) (3 4)))
(􏿳? '((1 (2)) (3 (4))))
]
}


@deftogether[(
@defproc[(􏺈 [ALST 􏿳?])
          􏿴?]
          @defproc[(􏺇 [ALST 􏿳?])
          􏿴?]
)]{
@itemlist[
@item{@racket[􏺈]：返回所有元素的@racket[阳]组成的@racket[􏿴]；}
@item{@racket[􏺇]：返回所有元素的@racket[阴]组成的@racket[􏿴]；}
]
@margin-note{
分别等同于：
@itemlist[
@item{@code{(佫 阳 ALST)}}
@item{@code{(佫 阴 ALST)}}
]
}
@margin-note{
参见：@racket[􏿰􏺈]、@racket[􏿰􏺇]
}

@examples[#:eval (the-eval)
(􏺈 '((1 . 2) (3 . 4)))
(􏺇 '((1 . 2) (3 . 4)))
]
}
