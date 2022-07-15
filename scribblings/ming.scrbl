#lang scribble/manual

@(require (for-label racket/base)
           scribble/eval
           scribble-rainbow-delimiters
           )

@(define the-eval
         (make-eval-factory '(ming)))

@script/rainbow-delimiters*

@title{名语言/Ming-Lang}
@author[(author+email "Yanying Wang" "yanyingwang1@gmail.com")]

@defmodule[ming/base]
名语言，LISP的中文化方言，Racket的中文化编程语言。

@examples[#:eval (the-eval)
(require ming/base)

(名 三年一班点名册
    (链 "王小明" "李小花" "赵小红"))
(若 (相等? "王小明" (首 三年一班点名册))
    (陈 "三年一班点名册上排在第一位的姓名是王小明。")
    (陈 "三年一班点名册上排在第一位的姓名不是王小明。"))

(倘 (余之首 三年一班点名册)
    [("王小明" "王小白") (行陈 "三年一班点名册上排在第二位的姓名是王小明或王小白。")]
    [("赵小红" "赵大红" "赵红") (行陈 "三年一班点名册上排在第二位的姓名是赵小红、赵大红或赵红。")]
    [else (行陈 "三年一班点名册上排在第二位的姓名是什么暂未可知。")])

(require ming/list)
(当 [(相等? "王小明" (甲 三年一班点名册))
     (陈 "三年一班点名册上排在第一位的姓名是王小明。")]
    [(相等? "赵小红" (甲 三年一班点名册))
     (陈 "三年一班点名册上排在第一位的姓名是赵小红。")]
    [(相等? "赵小红" (乙 三年一班点名册))
     (陈 "三年一班点名册上排在第二位的姓名是赵小红。")])

]

@examples[#:eval (the-eval)
(require ming/base)

(名 马 "马")
(名 白马 "白马")
(若 (相等? 马 白马)
    (陈 (化 "~v是~v" 白马 马))
    (陈 (化 "~v非~v" 白马 马)))
]