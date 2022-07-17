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

@section[#:tag "序"]{序}
@subsection{为什么}
相较于现今主流的编程语言，LISP的语法是极其简单的（称为@hyperlink["https://en.wikipedia.org/wiki/S-expression" "S表达式"]）：
@itemlist[
@item{它首先由括号约定执行优先级；}
@item{然后由每个括号中的第一个字词表示此括号内容的含义（称为@hyperlink["https://zh.wikipedia.org/wiki/%E6%B3%A2%E5%85%B0%E8%A1%A8%E7%A4%BA%E6%B3%95" "前缀表达式"]）。}
]
例如：@code{1+1+1}用S表达式写作@racket[(+ 1 1 1)]，又如：@code{1+2-3}用S表达式写作@racket[(- (+ 1 2) 3)]。

@linebreak{}

由此可见，对人类而言，LISP代码的含义，就是其S表达式中居首位的关键字所能表达的意思了。

而现今的编程语言都是宿主在英语之上的，包括LISP。所以当代的编程语言，天然的是受限于英语的，如果我们假设有更加适合于编程语言的宿主语言的话。


显而易见的，中文相较于英文，可以用更短的空间表达更多的意义。@linebreak{}
It's very obvious to notice that comparing to English, Chinese can use less space to express much more meaning.

总体而言，汉语在语法上更加自由，在语素的颗粒度上更加精细，在书写表达上更有上千年的实践和文化积淀，另更有近代吸收西方文化后的白话文改革和拼音标点符号的引入。

上所述种种，更加使用人口之众，都让我认为，将LISP的语法寄宿在汉语下，将拥有强大表达力的汉语融入在S表达式那幽幽的括号中所产生的编程语言，会将人机交互带入另一层境界。

@subsection{如何做}
@itemlist[
@item{Racket语言，编程语言设计和实现的平台，可先用它设计一个方言，并逐步汉化翻译已实现了的内部库。}
@item{在如上的过程中，逐步建立自动化代码翻译工具，以便让更多人更容易的投入到翻译中。}
@item{循环往复，另可在翻译中引入切合汉语的有意义的新特性。}
]

@subsection{释惑}
@itemlist[
@item{名语言的目的是为了探索以汉语的博大精深，兼容并包，是否可以让编程语言以另外一种方式变得更容易被人理解。}
@item{为什么选择LISP/Racket语言实现：第一，我认为LISP的语法特性间接的做了很大程度的留白，这得以让中文发挥出它最大程度的优势。第二，是认为scheme语言的特殊性，其高级抽象形态的实现都可以回溯到最基本的函数定义上，这也得以让人可以循环渐进的完成其固有的内部英文定义。}
@item{名会秉持实事求是的精神，不会采用通俗的计算机中文中已有的通用翻译作为编程语言关键字，而是在兼顾汉语的古今含义上做出折取选择。故此，其字词的选择不会求完全的文言文化，也不会求完全的白话文化，甚至不会求完全的汉化（西文字母、标点符号所独有的优点不容被忽视）。}
@item{另外我认为，名的实现过程，除去代码上的东西外，会类似于一个汉语地方方言的实现。所谓方言，比如河南话更甚于说是吴语，即是选择了汉语中的部分字词，定义出了自己方言的特殊意义。而名的实现，我认为会类似于这样一个过程，只不过是在选择时，需要兼顾编程和相应的英文词汇而翻译。}
@item{名的其中之重要一目的是为了给汉语编程探索和指明道路。}
]

@subsection{汉语字典索引}
@itemlist[
@item{@url{http://qiyuan.chaziwang.com/}}
@item{@url{https://www.hwxnet.com/}}
@item{@url{https://cidian.qianp.com/}}
]


@section{语言示例一览}
@examples[#:eval (the-eval)
(require ming/base)

(名 三年一班点名册
    (链 "王小明" "李小花" "赵小红"))
(若 (相等? "王小明" (阳 三年一班点名册))
    (陈 "三年一班点名册上的第一个姓名是王小明。")
    (陈 "三年一班点名册上的第一个姓名不是王小明。"))

(倘 (阴之阳 三年一班点名册)
    [("王小明" "王小白") (行陈 "三年一班点名册上的第二个姓名是王小明或王小白。")]
    [("赵小红" "赵大红" "赵红") (行陈 "三年一班点名册上的第二个姓名是赵小红、赵大红或赵红。")]
    [否则 (行陈 "三年一班点名册上的第二个姓名是什么暂未可知。")])

(require ming/list)
(当 [(相等? "王小明" (甲 三年一班点名册))
     (陈 "三年一班点名册上的第一个姓名是王小明。")]
    [(相等? "赵小红" (甲 三年一班点名册))
     (陈 "三年一班点名册上的第一个姓名是赵小红。")]
    [(相等? "赵小红" (乙 三年一班点名册))
     (陈 "三年一班点名册上的第二个姓名是赵小红。")]
    [否则 (行陈 "三年一班点名册上的第二个姓名是什么暂未可知。")])
]


以中国古代春秋战国时期，名家提出的辩题@hyperlink["https://zh.wikipedia.org/wiki/%E7%99%BD%E9%A9%AC%E9%9D%9E%E9%A9%AC" "“白马非马”"]，代码可以演示为：
@examples[#:eval (the-eval)
(require ming/base)

(名 马 (链 "白马" "黑马" "黄马"))
(名 白马 "白马")
(若 (相等? 马 白马)
    (陈 (化 "~v是~v" 白马 马))
    (陈 (化 "~v非~v" 白马 马)))
]