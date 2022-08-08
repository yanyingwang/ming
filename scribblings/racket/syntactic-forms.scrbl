#lang scribble/manual

@(require (for-label racket ming)
           scribble/eval
           ming/scribble
           scribble-rainbow-delimiters
          )
@script/rainbow-delimiters*

@(define the-eval
         (make-eval-factory '(ming)))


@title[#:tag "syntactic-forms"]{语法形式}
@defmapping[racket/base/syntactic-forms
([入 . "因为外形和拉丁字母λ相似，并且本义有由外至内之意。"]
 [召 . "召见，引入（外部已定义的）的意思。"]
 [宣 . "公开说出，散布，宣传（内部已定义的）的意思。"]
 [名 . "代表，定义的意思。"]
)]
