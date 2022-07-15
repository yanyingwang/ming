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

(名 一班姓名表 (链 "王小明" "赵小红" "李小花"))
(若 (同乎 "王小明" (首 一班姓名表))
    (陈 "一班姓名表中排在第一位的姓名是王小明。")
    (陈 "一班姓名表中排在第一位的姓名不是王小明。"))

(倘 (余之首 一班姓名表)
    [("王小明" "王小白") (陈行 "一班姓名表中排在第二位的姓名是王小明或王小白。")]
    [("赵小红" "赵大红" "赵红") (陈行 "一班姓名表中排在第二位的姓名是赵小红、赵大红或赵红。")]
    [else (陈行 "一班姓名表中排在第二位的姓名是什么暂未知。")])

(require ming/list)
(当 [(同乎 "王小明" (甲 一班姓名表))
     (陈 "一班姓名表中排在第一位的姓名是王小明。")]
    [(同乎 "赵小红" (甲 一班姓名表))
     (陈 "一班姓名表中排在第一位的姓名是赵小红。")]
    [(同乎 "赵小红" (乙 一班姓名表))
     (陈 "一班姓名表中排在第二位的姓名是赵小红。")])
]

@examples[#:eval (the-eval)
(require ming/base)

(名 马 "马")
(名 白马 "白马")
(若 (同乎 马 白马)
    (陈 "白马是马")
    (陈 "白马非马"))
]