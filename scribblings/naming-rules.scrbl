#lang scribble/manual


@(require (for-label racket ming)
           scribble/example
           scribble-rainbow-delimiters)
@(define the-eval
         (make-eval-factory '(racket/base racket/list ming/racket/base ming/racket/list)))

@script/rainbow-delimiters*

@title[#:tag "naming-rules"]{命名规则}

我曾在@secref["retrofit-chinese-to-lisp"]中提到，中文化有利于LISP代码更易被读懂，原因是中文的单字表意特性会更利于构造命名。所以，名语言的关键字命名必须依托在一套工整的规则之上，如此才能实现我所谓的更易读。



@itemlist[
@item{凡是例程名以“*”结尾的，表示加强力度。如@racket[提*]较@racket[提]会返回更多的结果；又入@racket[消*/入]较@racket[消/入]会移除更多的元素。}
@item{凡是例程名以“~”结尾的，表示减轻力度。如@racket[链~]较@racket[链]返回的结果尾部无多余空；又入@racket[连~]较@racket[连]返回的结果尾部也无多余空。}
@item{凡是例程名字中包含“/入”的，均表示例程的参数并非是常规的数据，而是匿名函数（@racket[入]）。}
@item{凡是例程名字中包含“/成”的，均表示例程的输出结果是某一类型。比如“/成链”表示此例程返回的结果是一个@racket[链?]；类似的还有“/成诗”（@racket[诗?]）、“/成词”（@racket[词?]）等等。}
@item{......}
@item{......}
@item{......}
]