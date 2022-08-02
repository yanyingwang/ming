#lang scribble/manual

@(require ming/core
          (for-label racket ming/core (mingize racket/list))
           scribble/eval
           scribble-rainbow-delimiters
           racket/sandbox
          )

@(define the-eval
         (make-eval-factory '(ming)))

@(define my-eval (parameterize ([sandbox-output 'string]
                                [sandbox-error-output 'string]
                                [sandbox-memory-limit 50])
     (make-evaluator 'racket/base #:requires `(ming/core (for-syntax . (racket/base))))))

@script/rainbow-delimiters*


@title[#:tag "ming-core"]{名语言核心库}
@declare-exporting[ming]

@defmodule[ming/core]
名语言的核心库，语言扩展程序和汉化程序应置于此。

@defform[(mingize module-path)]{
名化（汉化）一个Racket的库。
@itemlist[
@item{仅只用于@racket[require]的子句，且仅当名语言内部已经定义了该库的翻译文件时才会成功。}
@item{使用时效果和@racket[(require ming/module-path)]等同。}
]


@examples[#:eval (the-eval)
(require racket/list)
(first (list 1 2 3))

(require (mingize racket/list))
(甲 (list 1 2 3))

(require ming/racket/list)
(甲 (list 1 2 3))
]
}


@defproc*[([(mingize-mapping/racket) dict?]
          [(mingize-mapping/racket/base) dict?]
          [(mingize-mapping/racket/list) dict?])]{
@racket[mingize]一个Racket库时，所使用的翻译对照表。

@itemlist[
@item{
默认加载在@tech[#:doc '(lib "scribblings/guide/guide.scrbl") #:key "phase level -1" "phase 1"]（即syntax层）：
@examples[#:eval my-eval
(begin-for-syntax
  (println (mingize-mapping/racket/list)))
]
}

@item{
如果你想增加或修改翻译，可以提交修改源码文件，比如@racket[(require (mingize racket/list))]所使用的翻译文件位于名语言package的@code{mapping/racket/list.rkt}中，修改之即可。@linebreak{}
}

@item{
另外，你也可以在运行时修改。比如我们想把默认的翻译@racket[first] => @racket[甲]，改成@litchar{第一个}：
@examples[#:eval my-eval
(define-for-syntax (mingize-mapping/racket/list) '((first 第一个)))
(require (mingize racket/list))
(第一个 (list 1 2 3))
]
}
]
}
