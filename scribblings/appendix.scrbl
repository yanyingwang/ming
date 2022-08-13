#lang scribble/manual


@title[#:tag "appendix"]{附录}
@declare-exporting[ming]


@section{关键术语翻译表}
@tabular[#:style 'boxed
         #:column-properties '(left right)
         #:row-properties '(bottom-border ())
`((,(bold "英文") ,(bold "中文"))
   ("procedure" "例程，简称程。") @;; 过 关 要
   ("syntax" "法式，简称式，是句法的意思。") @;; 术
   ("associative list" "联链")

   @; ("character" "字")
   @; ("symbol" "词") @; ，标，标记，标志
   @; ("string" "句") @; 文
   @; ("identifier" "标") @; 符号
   @; ("syntax" "")
   @; ("datum" "文")

   @; ("byte" "字节")

   )]






@; (define translation
@;   (hash
@;    'if '若
@;    'case '例
@;    'cond '倘
@;    'for '于
@;    'for* '于甚

@;    'when '当
@;    'unless '挡
@;    'match '像  ;/似/

@;    'define '名
@;    'let '让 ;/令/予
@;    'let* '让甚

@;    'list '表
@;    'array '组 ;排串
@;    'hash '集
@;    'dict '典
@;    'class '类
@;    'struct '构
@;    'equal '同

@;    ;; 'character '符
@;    ;; 'symbol '字
@;    ;; 'keyword '词
@;    ;; 'byte '言
@;    ;; 'string '文
@;    ;; 'text '书
@;    'display '显
@;    'displayln '显行
@;    'write '作
@;    'format '释 ;/夫/凡 ( 句首语气词，夫六国与秦皆诸侯，其势弱于 秦; 夫战，勇气也)
@;    'car '阳
@;    'cdr '阴)
@;   )

@; ;;;;;;;;; to be done:
@; ;;; procedure == ???? 步骤 过程 程序，应找一个文言文单字


@section{TODOS}
@itemlist[
@item{Implement below fake code(easily for others contributing to the translation):
@racketmod[ming/mapping
<racket/list>
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
