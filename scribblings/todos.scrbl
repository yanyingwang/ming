#lang scribble/manual


@title[#:tag "todos"]{待实现}
@declare-exporting[ming]


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
]