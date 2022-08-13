#lang scribble/manual


@(require (for-label racket ming)
           scribble/example
           scribble-rainbow-delimiters)
@(define the-eval
         (make-eval-factory '(racket/base racket/list ming/racket/base ming/racket/list)))

@script/rainbow-delimiters*

@title[#:tag "setin"]{初见}
@declare-exporting[ming]

@section[#:tag "ming-s-retrofit"]{中文化一角}
我在序的《@secref["retrofit-chinese-to-lisp"]》一章节中，曾谈到说把LISP中文化是很有意义的，中文可以改进LISP的难读性并为其带来新的活力。本章节即是我结合之前所说，所实现的一部分名语言的代码。


@; @subsection{pairs}
@; @tech[ #:doc '(lib "scribblings/reference/reference.scrbl") "pairs"]是LISP语言非常基础的一个数据结构，@tech[ #:doc '(lib "scribblings/reference/reference.scrbl") "lists"]、 @secref["dicts" #:doc '(lib "scribblings/reference/reference.scrbl")]等更为复杂的数据结构都是它的衍生。

@; 一个pair包含两个数据，构造一个pair的函数是@racket[cons]。

@; pair在名语言中，被翻译为“@racket[对]”。“对”在中文中可以是动词（对酒当歌），也可以是名词（成双成对）。因此，可以用“对”这个单字来构造所有跟“pair”有关的数据结构。

@; 对于英文而言，“pair”其实也是可以作为动词使用的，但是英文单词和语法的基石是区分词性，区分词性也更利于意思的表达。

@; 然而对于中文来说，严格区分词性不是中文的惯例。如果需要，比如“对子”则肯定是一个名词了。虽然并非所有的词都是通过加“子”变成名词的，但中文具备这种能力，只是在实际使用中没有做完全发挥。

@; 通常情况下，对于编程语言来说，一旦有了一个中心意义的实体，就会在编程中因为各种情况需要不断的围绕它定义名字。中文强大的造词能力所能定义出来一些相关词汇集合，从这些词汇的构成上天然的就能看出他们之间所隐含存在着的一些关联和衍生关系，这对于程序员记忆和理解代码是有极大帮助的。

@; @examples[#:eval (the-eval) #:label "英文"
@; (cons 'a 'b)
@; (pair? '(a . b))
@; ]

@; @examples[#:eval (the-eval) #:label "中文"
@; (对 'a 'b)
@; (对? '(a . b))
@; ]


@subsection{make-list和build-list}
我们以两个Racket标准库里面的例程（Procedures）：@racket[make-list]和@racket[build-list]为例来尝试阐述所说。

@subsubsection{原英文}
从他们的英文名字上，我们很容易得出这两个例程都是用来创建“@racket[list]”的（名语言称之为“@racket[链]”）。

@itemlist[
@item{
@examples[#:eval (the-eval) #:label @elem{对于@racket[make-list]有：}
(make-list 3 'foo)
(make-list 6 "foo")
]
很容易明白，它是用来创建一个包含n个相同值的链的。
}
@item{
@examples[#:eval (the-eval) #:label @elem{对于@racket[build-list]有：}
(build-list 5 values) (code:comment "生成一个包含0-4这个5个数的链。")
(build-list 10 values) (code:comment "生成一个包含0-9这个10个数的链。")
(build-list 10 add1) (code:comment "生成一个包含0-9这个10个数的链，并且每一个数都加上1。")
(build-list 10 (lambda (e) (* 2 e))) (code:comment "生成一个包含0-9这个10个数的链，并且每一个数都乘上自身。")
]
@racket[build-list]的行为更加复杂些：它是用来生成一个链，这个链包含从0数起的n个数，并且生成的时候，这些数是可以被做一些附加处理的。
}
]

对于@racket[make-list]和@racket[build-list]这两个例程的具体作用，从名字上我们仅仅能看出它是用来创建链的，并不能看出它的其它更具体的作用。

@subsubsection{中文化后}
中文化后，@racket[make-list]叫@racket[复链]，意为链内部的每个元素是重复的；@racket[build-list]叫@racket[序链]，意为链内部的元素是按照一定的顺序排列的。

@itemlist[
@item{第一，显然这两个例程的名字有着较原英文更加丰富的含义，这是我上文提到的我所说的中文化的意义；}
@item{第二，古中文即文言文中，字词的词性很弱，或者说是常常有名词活用动词，动词活用名词的用法。故此，“链”这个字是可以被用作动词的，意为创建链、链起来一组数据、将一组数据存在链结构中。总之，字词的表意性因其所处的语境而可以有被活用的留白；}
@item{第三，从整体性的角度讲，和其他例程名放在一块，名字显得有更加有规律可循，语言使用者更容易从整体的角度出发获取到更多意义上的理解。}
]


当然你可以说，这其中的“第一”是因为这两个例程原本的英文名字起的不好。

但我们更加应该看到的是，这本质上反应的是一种文化上的差异：英文世界里是存在着一种把事情都简单化的趋向的，这是我认为这两个例程都采用了@litchar{make-list}和@litchar{build-list}的根本原因，我们即使找出更加贴切的英文词汇来作为这两个例程的名字，但或许这些词汇在实际的实现上看起来都是不够直观的。

但对中文来讲就不一样了，中文的造词能力更强：支撑中文造词能力强的技术层原因是它的单字表意特性；非技术层原因是它所造出的词是更加容易被接收者所理解的（这可能和它字的表象特性有关）。

@examples[#:eval (the-eval) #:label "中文化后的示例："
(链 'val 'val 'val)
(复链 3 'val)

(链 1 2 3 4 5)
(序链 5 加一)
(序链 5 (入 (n) (复链 n 'val)))
]


@section[#:tag "take-a-glance"]{名语言一览}

@subsection{白马非马}
以中国古代春秋战国时期，名家提出的辩题@hyperlink["https://zh.wikipedia.org/wiki/%E7%99%BD%E9%A9%AC%E9%9D%9E%E9%A9%AC" "《白马非马》"]，代码可以演示为：
@examples[#:eval (the-eval) #:label #f
(名 马 (链 "白马" "黑马" "黄马"))      (code:comment @#,elem{起一个名字@racketvarfont{马}代表一个链结构的数据集合，集合内容是@racketvalfont{白马}、@racketvalfont{黑马}和@racketvalfont{黄马}。})
(名 白马 "白马")       (code:comment @#,elem{起名@racketvarfont{白马}是一个字符串数据，该字符串内容是@racketvalfont{白马}二字。})
(若 (同? 马 白马)       (code:comment @#,elem{如果@racketvarfont{马}和@racketvarfont{白马}所代表的内容一样：})
(陈 (格 "~v是~v。" 白马 马))      (code:comment @#,elem{那么就转化整合变量名到字符串中并在屏幕上陈列出：@racketoutput{@racketvalfont{@racketvarfont{白马}所代表的内容}是@racketvalfont{@racketvarfont{马}所代表的内容}。}})
(陈 (格 "~v非~v。" 白马 马))      (code:comment @#,elem{否则就转化整合变量名到字符串中并在屏幕上陈列出： @racketoutput{@racketvalfont{@racketvarfont{白马}所代表的内容}非@racketvalfont{@racketvarfont{马}所代表的内容}。}})
)
(code:comment @#,bold{因为@racketvarfont{白马}是字符串意义上的白马,而@racketvarfont{马}是一个包含了“白马”“黑马”“黄马”的集合，故此两者不同，结果是“白马非马”。})
]

@subsection{三年一班点名册}
三年一班点名册的简单查询示例：
@examples[#:eval (the-eval) #:label #f
(名 三年一班点名册
    (链 "王小明" "李小花" "赵小红"))
(若 (同? "王小明" (阳 三年一班点名册))
    (陈 "三年一班点名册上的第一个姓名是王小明。")
    (陈 "三年一班点名册上的第一个姓名不是王小明。"))

(倘 (阴之阳 三年一班点名册)
    [("王小明" "王小白") (行陈 "三年一班点名册上的第二个姓名是王小明或王小白。")]
    [("赵小红" "赵大红" "赵红") (行陈 "三年一班点名册上的第二个姓名是赵小红、赵大红或赵红。")]
    [否则 (行陈 "三年一班点名册上的第二个姓名是什么暂未可知。")])

(受 ming/racket/list)
(当 [(同? "王小明" (甲 三年一班点名册))
     (陈 "三年一班点名册上的第一个姓名是王小明。")]
    [(同? "赵小红" (甲 三年一班点名册))
     (陈 "三年一班点名册上的第一个姓名是赵小红。")]
    [(同? "赵小红" (乙 三年一班点名册))
     (陈 "三年一班点名册上的第二个姓名是赵小红。")]
    [否则 (行陈 "三年一班点名册上的第二个姓名是什么暂未可知。")])
]
