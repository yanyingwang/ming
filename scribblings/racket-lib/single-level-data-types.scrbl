#lang scribble/manual

@(require (for-label racket ming)
           scribble/eval
           ming/scribble
           )
@(define the-eval
         (make-eval-factory '(ming/racket/base ming/racket/string)))

@(require scribble-rainbow-delimiters)
@script/rainbow-delimiters*

@title[#:tag "zi--wen"]{字、词、参、名、料、文}

@margin-note{请注意，这里说的“词”（另有“@secref["string"]”）是一种数据结构，和@racket[􏿴]类似。}

对名语言来说，语言构成的最基本单位称之为“字”（@tech[ #:doc '(lib "scribblings/reference/reference.scrbl") "Character"]），多个字连在一块可以构成“词”（@tech[ #:doc '(lib "scribblings/reference/reference.scrbl") "Symbol"]）或“@secref["string"]”。

@examples[#:eval (the-eval)
(字? #\a)
(字? #\+)
(字? #\梨) @; character
(词? '一只梨) @; symbol
(词参? '#:一只梨) @;keyword 关键词 箴 铭
(诗? "一只梨") @; string
(词->诗 '春分，夏至，秋分，冬至。)
(词参->诗 '#:春分，夏至，秋分，冬至。)   @;keyword->string
(诗->词 "春分，夏至，秋分，冬至。") @; (string->symbol ...)
(诗->词参 "春分，夏至，秋分，冬至。")  @; string->keyword
(诗->􏿴 "半个苹果") @;(string->list ...)
(名? #'半个苹果) @; identifier? 符 号
]

对名语言（LISP）来说，“词”和“􏿴”是比较特殊的两种数据结构，因为这两者是名语言代码在“文”（@tech[ #:doc '(lib "scribblings/reference/reference.scrbl") "syntax object"]）层面上所使用到的数据结构。

什么是“文”呢？简单而言，一段名语言的代码就是“文”。

对于其他很多编程语言来说，代码就是简单意义上的代码，但对名语言（LISP语言）来说，一段代码必须以某种形式的可以在代码中被表示出来（以便被操作，用代码来生成代码），这种在代码中另外被表示着的一段代码我们称之为“文”。

细究的话，“文”通常由两种要素组成：“具体的代码”和“具体代码的上下文环境”（包括代码在文件的第几行第几列、作用域等等）。

对名语言来说，“具体代码”我们称之为“料”（原料、资料的意思，英文datum）。通常情况下，“料”所使用的数据结构是由“词”所组成的“􏿴”，而由“词”所组成的“􏿴”附加上上下文环境就可以被转化成“文”了：
@examples[#:eval (the-eval)
(词? '+)
(词? 'a)
@; (各全都 词? '(+ a b c))
(料->文 #f '(+ a b c))

]
比如上面示例中，我们把一个“􏿴”转化成“文”（附加的上下文环境是@racket[#f]）。

但如果求这个“文”的话，会报错，原因是这个“文”的上下文环境（@racket[#f]）中没有定义@racket[a]、@racket[b]、@racket[c]：
@examples[#:eval (the-eval)
(求 (料->文 #f '(+ a b c)))
(文 (+ 1 2 3))
(求 (料->文 #f '(+ 1 2 3)))
(code:comment "")
(文 一个香梨) @; syntax
(文 '一个香梨)
(文 "一个香梨")
(code:comment "")
(文->料 #'(1 2 3)) @; syntax->datum
(文->􏿴 #'(1 2 3)) @; syntax->list
(code:comment "")
(料->文 #f 1) @; datum->syntax
(料->文 #f '一个香梨)
(料->文 #f '(1 2 3))
]

@defmapping[racket/base/syntax]
