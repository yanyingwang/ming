#lang scribble/manual

@(require (for-label racket ming)
           scribble/eval
           scribble-rainbow-delimiters
           )

@(define the-eval
         (make-eval-factory '(ming)))

@script/rainbow-delimiters*



@title[#:tag "at-first-glance"]{一览}
@declare-exporting[ming]


以中国古代春秋战国时期，名家提出的辩题@hyperlink["https://zh.wikipedia.org/wiki/%E7%99%BD%E9%A9%AC%E9%9D%9E%E9%A9%AC" "《白马非马》"]，代码可以演示为：


@examples[#:lang ming
(名 马 (链 "白马" "黑马" "黄马"))
(名 白马 "白马")
(若 (相等? 马 白马)
    (陈 (化 "~v是~v" 白马 马))
    (陈 (化 "~v非~v" 白马 马)))
]


@racketmod[ming
(行陈 "sdfsff")
]

@interaction[#:eval (the-eval)
(require (minglize racket))
(名 马 (链 "白马" "黑马" "黄马"))
(名 白马 "白马")
(若 (相等? 马 白马)
    (陈 (化 "~v是~v" 白马 马))
    (陈 (化 "~v非~v" 白马 马)))
]

点名册：
@interaction[#:eval (the-eval)
(require (minglize racket))
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


