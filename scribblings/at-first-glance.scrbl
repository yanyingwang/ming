#lang scribble/manual

@(require (for-label racket ming/racket)
           scribble/eval
           scribble-rainbow-delimiters
           )

@(define the-eval
         (make-eval-factory '(ming)))

@script/rainbow-delimiters*

@title[#:tag "at-first-glance"]{语言一览}
@declare-exporting[ming]

@itemlist[
@item{
以中国古代春秋战国时期，名家提出的辩题@hyperlink["https://zh.wikipedia.org/wiki/%E7%99%BD%E9%A9%AC%E9%9D%9E%E9%A9%AC" "《白马非马》"]，代码可以演示为：

@interaction[#:eval (the-eval)
(名 马 (链 "白马" "黑马" "黄马"))      (code:comment @#,elem{起一个名字@racketvarfont{马}代表一个链结构的数据集合，集合内容是@racketvalfont{白马}、@racketvalfont{黑马}和@racketvalfont{黄马}。})
(名 白马 "白马")       (code:comment @#,elem{起名@racketvarfont{白马}是一个字符串数据，该字符串内容是@racketvalfont{白马}二字。})
(若 (等同? 马 白马)       (code:comment @#,elem{如果@racketvarfont{马}和@racketvarfont{白马}所代表的内容是等同的：})
(陈 (化 "~v是~v。" 白马 马))      (code:comment @#,elem{那么就转化整合变量名到字符串中并在屏幕上陈列出：@racketoutput{@racketvalfont{@racketvarfont{白马}所代表的内容}是@racketvalfont{@racketvarfont{马}所代表的内容}。}})
(陈 (化 "~v非~v。" 白马 马))      (code:comment @#,elem{否则就转化整合变量名到字符串中并在屏幕上陈列出： @racketoutput{@racketvalfont{@racketvarfont{白马}所代表的内容}非@racketvalfont{@racketvarfont{马}所代表的内容}。}})
)
(code:comment @#,bold{因为@racketvarfont{白马}是字符串意义上的白马,而@racketvarfont{马}是一个包含了“白马”“黑马”“黄马”的集合，故此两者不同，结果是“白马非马”。})
]
}


@item{
三年一班的点名册的简单查询示例：
@interaction[#:eval (the-eval)
(名 三年一班点名册
    (链 "王小明" "李小花" "赵小红"))
(若 (等同? "王小明" (阳 三年一班点名册))
    (陈 "三年一班点名册上的第一个姓名是王小明。")
    (陈 "三年一班点名册上的第一个姓名不是王小明。"))

(倘 (阴之阳 三年一班点名册)
    [("王小明" "王小白") (行陈 "三年一班点名册上的第二个姓名是王小明或王小白。")]
    [("赵小红" "赵大红" "赵红") (行陈 "三年一班点名册上的第二个姓名是赵小红、赵大红或赵红。")]
    [否则 (行陈 "三年一班点名册上的第二个姓名是什么暂未可知。")])

(受 ming/racket/list)
(当 [(等同? "王小明" (甲 三年一班点名册))
     (陈 "三年一班点名册上的第一个姓名是王小明。")]
    [(等同? "赵小红" (甲 三年一班点名册))
     (陈 "三年一班点名册上的第一个姓名是赵小红。")]
    [(等同? "赵小红" (乙 三年一班点名册))
     (陈 "三年一班点名册上的第二个姓名是赵小红。")]
    [否则 (行陈 "三年一班点名册上的第二个姓名是什么暂未可知。")])
]
}
]
