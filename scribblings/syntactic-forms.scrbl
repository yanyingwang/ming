#lang scribble/manual

@(require (for-label racket ming)
           scribble/eval
           scribble-rainbow-delimiters
          )

@(define the-eval
         (make-eval-factory '(ming)))

@script/rainbow-delimiters*


@title[#:tag "syntactic-forms"]{语法形式}
@declare-exporting[ming]



@defthing[lambda 道]
@defthing[名 define]

@defthing[且 and]
@defthing[或 or]
@defthing[若 if]
@defthing[倘 case]
@defthing[当 cond]
@defthing[否则 else]
@examples[#:eval (the-eval)
(require ming)
(名 三年一班点名册
    (链 "王小明" "李小花" "赵小红"))
(若 (相等? "王小明" (阳 三年一班点名册))
    (陈 "三年一班点名册上的第一个姓名是王小明。")
    (陈 "三年一班点名册上的第一个姓名不是王小明。"))

(倘 (阴之阳 三年一班点名册)
    [("王小明" "王小白") (行陈 "三年一班点名册上的第二个姓名是王小明或王小白。")]
    [("赵小红" "赵大红" "赵红") (行陈 "三年一班点名册上的第二个姓名是赵小红、赵大红或赵红。")]
    [否则 (行陈 "三年一班点名册上的第二个姓名是什么暂未可知。")])

(当 [(相等? "王小明" (甲 三年一班点名册))
     (陈 "三年一班点名册上的第一个姓名是王小明。")]
    [(相等? "赵小红" (甲 三年一班点名册))
     (陈 "三年一班点名册上的第一个姓名是赵小红。")]
    [(相等? "赵小红" (乙 三年一班点名册))
     (陈 "三年一班点名册上的第二个姓名是赵小红。")]
    [否则 (行陈 "三年一班点名册上的第二个姓名是什么暂未可知。")])
]




@defthing[陈 display]
@defthing[行陈 displayln]
@defthing[化 format]
