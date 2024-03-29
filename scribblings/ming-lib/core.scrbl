#lang scribble/manual

@(require ming/core ming/scribble
          (for-label racket
                     ming/racket ming/core ming/scribble
                     scribble/decode scribble/base)
           scribble/example
           scribble-rainbow-delimiters
           racket/sandbox
          )

@(require scribble-rainbow-delimiters)
@script/rainbow-delimiters*

@(define the-eval
         (make-eval-factory '(ming)))

@(define my-eval (parameterize ([sandbox-output 'string]
                                [sandbox-error-output 'string]
                                [sandbox-memory-limit 50])
     (make-evaluator 'racket/base #:requires `(ming/core ming/racket/base (for-syntax . (racket/base))))))

@script/rainbow-delimiters*

@title[#:tag "ming-core"]{名语言核心库}

@section{ming/core}
@defmodule[ming/core]
名语言核心库，语言关键程序（汉化程序和扩展程序）应含于此。

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

@section{ming/scribble}
@defmodule[ming/scribble]

@margin-note{
使用示例可见@secref["racket library in chinese"]，其说明文档中的汉化是采用本库生成的。
}

@defform[(defchinesize chinese-id reason english-id)
                       #:contracts ([reason (or/c pre-content? string?)])]{
生成从@racket[english-id]汉化而来的@racket[chinese-id]的文档，并给出@racket[reason]为什么选择这个汉字或者汉语词汇作为汉化名。
}

@defform[(defmapping path-id mapping-expr)
                     #:grammar [(mapping-expr ([chinese-id reason] ... ))]
                     #:contracts ([reason (or/c pre-content? string?)])]{
以名语言内部的翻译表为基准来生成一组翻译文档。@linebreak{}
@racket[path-id]应为@racket[ming]库的内部路径@racket[maping/*]中*代表的文件路径。@racketcommentfont{TODO: after refactoring this requires in scribble/core, make this description in defform's contracts.}@linebreak{}
@racket[mapping-expr]可以用来新增或覆盖@racket[path-id]所引进的翻译表中包含的@racket[chinese-id]的额外说明。@linebreak{}

比如代码：
@codeblock|{
#lang scribble/manual
@defmapping[racket/list]
}|

生成的文档可见@racket[甲]处。

而代码：
@codeblock|{
#lang scribble/manual
@defmapping[racket/list ([甲 "甲即是第一的意思。"])]
}|
生成的文档同样如@racket[甲]处，只不过@racket[甲]的说明被@racketvalfont{甲即是第一的意思。}替换。
}


@section[#:tag "mapping-lang"]{mapping-lang}

@margin-note{
如何贡献翻译请见@secref["contributing-mapping"]。
}

名语言为了借用Racket的标准库，需要做大量的翻译。又因翻译文件重在数据，其代码逻辑比较简单，故此另外实现了一个简单的模板来编写翻译代码，@racket[mapping-lang]：

@itemlist[
@item{以@racket[>>>]开头表示开始一个翻译。}
@item{@racket[>>>]也不必非在行首；也可以在行中，如此则会从行中开始另一个翻译。}
@item{@racket[>>>]之后可以跟上二或三个数据，分别为“原名（english-id）”、“翻译名（chinese-id）”和“原因（reason）”，数据间以空格分割。}
@item{三个数据中，“原因”可以被省略；如有则会在使用@racket[defchinesize]、@racket[defmapping]生成文档的时候被默认提取使用。}
@item{“原因”可以是一个@racket[诗]或@racket[􏿴]；使用􏿴可以生成高级定制的HTML代码，请见@racket[elem]。}
]

示例：
@filebox{mapping/racket/list.rkt
@codeblock|{
#lang s-exp "../../private/mapping-lang.rkt"

>>> first 甲 "第一个的意思，源自中国古代文字记序符号十天干。"
>>> second 乙
>>> third 丙 >>> fourth 丁 >>> fifth 戊   ;; 此行共三个翻译
>>> index-of 索引 (elem "从􏿴中查出某个值的" (racket 引))   ;; “原因”可以为一个􏿴
}|}
