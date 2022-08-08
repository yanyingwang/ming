#lang scribble/manual

@(require ming/core ming/scribble
          (for-label racket ming/racket ming/core)
           scribble/example
           scribble-rainbow-delimiters
           racket/sandbox
          )

@; @(define the-eval
@;          (make-eval-factory '(ming)))

@(define my-eval (parameterize ([sandbox-output 'string]
                                [sandbox-error-output 'string]
                                [sandbox-memory-limit 50])
     (make-evaluator 'racket/base #:requires `(ming/core ming/racket/base (for-syntax . (racket/base))))))

@script/rainbow-delimiters*

@(table-of-contents)

@title[#:tag "ming-core"]{名语言标准库}
@declare-exporting[ming]

@section{ming/core}
@defmodule[ming/core]
名语言标准库，语言关键程序（汉化程序和扩展程序）应含于此。

@defform[(mingize module-path)]{
名化（汉化）一个Racket的库。
@itemlist[
@item{仅只用于@racket[require]的子句，且仅当名语言内部已经定义了该库的翻译文件时才会成功。}
@item{当嵌入到@racket[require]中作为子句一块使用时，其和@racket[(require #,(elem "ming/" (racketvarfont "module-path")))]等同。除了后者所使用的翻译表的作用域是在原module中的，因此不能简单的被修改或重定义。}
]

@examples[#:eval my-eval
(require racket/list)
(first (list 1 2 3))

(require (mingize racket/list))
(甲 (list 1 2 3))

(require ming/racket/list)
(甲 (list 1 2 3))
]
}


@; @defproc*[([(mingize-mapping/racket) dict?]
@;           [(mingize-mapping/racket/base) dict?]
@;           [(mingize-mapping/racket/list) dict?])]{
@; @racket[mingize]一个Racket库时，所使用的翻译对照表。

@; @itemlist[
@; @item{
@; 默认加载在@tech[#:doc '(lib "scribblings/guide/guide.scrbl") #:key "meta-compile phase level" "meta-compile时期"]：
@; @examples[#:eval my-eval
@; (begin-for-syntax
@;   (println (mingize-mapping/racket/list)))
@; ]
@; }

@; @item{
@; 如果你想增加或修改翻译，可以提交修改源码文件，比如@racket[(require (mingize racket/list))]所使用的翻译文件位于名语言package的@code{mapping/racket/list.rkt}中，修改之即可。@linebreak{}
@; }

@; @item{
@; 另外，你也可以在运行时修改。比如我们想把默认的翻译@racket[first] => @racket[甲]，改成@racketidfont{第一个}：
@; @examples[#:eval my-eval
@; (define-for-syntax (mingize-mapping/racket/list) '((first 第一个)))
@; (require (mingize racket/list))
@; (第一个 (list 1 2 3))
@; ]
@; }
@; ]
@; }

@; @section{ming/scribble}
@; @defmodule[ming/scribble]

@; @margin-note{
@; 使用示例可见@secref["racket library in chinese"]，其说明文档中的汉化是采用本库生成的p。
@; }


@; @defform[(defchinesize chinese-id reason english-id)]{
@; 生成从@racket[english-id]汉化而来的@racket[chinese-id]的文档，并给出@racket[reason]为什么选择这个汉字或者汉语词汇作为汉化名。
@; }

@; @defform[(defmapping path-expr extra-data)
@;                      #:contracts ([extra-data dict?])]{
@; 以名语言内部的翻译表为基准来生成一组翻译文档。@linebreak{}
@; @racket[path-expr]应为路径@racket[maping/*]中*代表的文件路径。@linebreak{}
@; @racket[extra-data]可以用来定义@racket[path-expr]中包含的@racket[chinese-id]的额外说明。@linebreak{}



@; 比如代码：
@; @examples[#:eval my-eval
@; @defmapping[racket/list '(链 "我的新翻译在此。")]
@; ]
@; 生成的文档为：
@; @defmapping[racket/list '(链 "我的新翻译在此。")]
}
