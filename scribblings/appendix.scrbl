#lang scribble/manual


@title[#:tag "appendix"]{附录}
@declare-exporting[ming]


@section{关键术语翻译表}
@tabular[#:style 'boxed
         #:column-properties '(left right)
         #:row-properties '(bottom-border ())
`((,(bold "英文") ,(bold "中文"))
   ("procedure" "程，例程，过 关 要")
   ("syntax" "式、术，句法")
   ("associative list" "联链")
   ("string" " ")
   ("byte" "")
   )]


@section{TODOS}
@itemlist[
@item{Implement below fake code(easily for others contributing to the translation):
@racketmod[ming/mapping
FOR:racket/list
first 甲
second 乙
...
]

}
@item{Find a way to automatically generate the scribble doc from the ming-mapping data.}

@item{Create an exception handler which would be able to return chinese messages.}

@item{make mappings able to autoload without explicitly requiring it in the ming/core ming/private/core and ming/scribble}

@item{write a online ming code running page.}

@item{remove println debuging code after adding test code.}
]
