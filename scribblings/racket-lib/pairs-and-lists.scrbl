#lang scribble/manual

@(require (for-label racket ming)
           scribble/eval
           ming/scribble
           )
@(define the-eval
         (make-eval-factory '(ming/racket/base ming/racket/list)))

@(require (file "../../private/scribble-styles/css/fonts.css.rkt"))
@css/wenquan-extend-font
@(require scribble-rainbow-delimiters)
@script/rainbow-delimiters*


@title[#:tag "pairs-and-lists"]{双和􏿴}


@section{例程命名规则}
除@secref["naming-rules"]中的总规外，另有：
@itemlist[
@item{凡是以“􏿴”字结尾的，均表示输出结果是􏿴。此如：@racket[􏿴]、@racket[􏿴~]、@racket[序􏿴]、@racket[复􏿴]等。}
@item{使用单字所命名的例程，第一位的参数通常是“􏿴”数据，修饰例程的参数在其后，此如@racket[第]、@racket[笈]、@racket[去]、@racket[留]、@racket[分]、@racket[间]、@racket[理]等。}
@item{与单字的相反，使用多字所命名的例程，“􏿴”数据作为参数通常位居后位，此如：@racket[查找]、@racket[筛选]等。}
]


@section[#:tag "pair-car-cdr-list-list*"]{双，阴、阳，􏿴、􏿫}
“双”（@tech[ #:doc '(lib "scribblings/reference/reference.scrbl") "pair"]）是LISP语言最最基础的数据结构：

对于名语言来说，如果我们把两个数据配成对（@racket[双]在一块），我们就得到一个“双”，而双在一块的这两个数据分别处于他们所构成的这个“双”的@racket[阳]位和@racket[阴]位。

进而，@elemtag["what-is-􏿴􏿫" "如果一个“双”的阴位存的是另外一个“双”，数个双如此前后相接成链状："]
@itemlist[
@item{末尾双的阴位留@racket[空]，这样的数据结构称之为@racket[􏿴]（@racket[list]）；}
@item{末尾双的阴位不留@racket[空]，这样的数据结构称之为@racket[􏿫]（@racket[list*]）。}
]


@margin-note{
@bold{“@racket[􏿴]”、“@racket[􏿫]”为@elemtag["the-char-creating-of-􏿴􏿫" "新造字"]：}
@itemlist[
@item{
因其所代表的数据结构（list）和“@racket[双]”所代表的数据结构（pair）互相之间的内生性变换转化关系而得造：
@itemlist[
@item{多个“@racket[双]”互相衔接并且最后一个双的阴位留空即成“@racket[􏿴]”（不留空是为@racket[􏿫]）；}
@item{每一个“􏿴”同时都是“双”。}
]
}
@item{
两字由“又”和“㐅”、“又”组成，含义：
@itemlist[
@item{其中左起半包围结构的“又”表示其是一种类似链一样的内部元素之间依次互相衔接、可以向后延绵不绝的数据结构；}
@item{其中被包围的居于之后的“㐅”（组成“􏿴”）表示本数据结构的末位元素总是一个空值。}
@item{其中被包围的居于之后的“又”（组成“􏿫”）表示本数据结构的末位元素不是空值。}
]
}
]
}

@examples[#:eval (the-eval)
(双 1 2)

(双 1 (双 2 (双 3 (双 4 空))))
(􏿴 1 2 3 4)

(双 1 (双 2 (双 3 4)))
(􏿫 1 2 3 4)
(􏿫 1 2 3 '(4))

(阳 '(1 . 2))
(阴 '(1 . 2))

(阳 '(1 2 3 4))
(阴 '(1 2 3 4))
(阴之阳 '(1 2 3 4))
(阴之阴阳 '(1 2 3 4))

(阳 '((1 1.1) 2 3 4))
(阳之阳 '((1 1.1) 2 3 4))
(阳之阴阳 '((1 1.1) 2 3 4))
]

@section{􏿝、􏿜}
可用@racket[􏿝]、@racket[􏿜]例程对@elemref["what-is-􏿴􏿫" "􏿴"]类结构数据进行处理并输出相同于@racket[􏿴]、@racket[􏿫]例程输出数据之结构的数据：
@margin-note{
@bold{“@racket[􏿝]”、“@racket[􏿜]”为新造字：}
@itemlist[
@item{两字分别为仿照@elemref[ "the-char-creating-of-􏿴􏿫" "􏿴、􏿫"]字而造，因为他们处理数据后输出结果的数据类型相同（不同在于输入参数之数据类型为@elemref["what-is-􏿴􏿫" "􏿴"]）；}
@item{左上起笔处的偏旁“毌”，表示“贯穿”之意（“毌”是“贯”的古字）。因此意思即为把数个@elemref["what-is-􏿴􏿫" "􏿴"]贯穿起来组成一个新的@elemref["what-is-􏿴􏿫" "􏿴"]并返回之。}
]
}

@examples[#:eval (the-eval)
(􏿴 1 2 3 4)
(􏿝 '(1) '(2) '(3) '(4))
(􏿫 1 2 3 4)
(􏿜 '(1) '(2) '(3) '(4))
(􏿫 1 2 3 '(4))
(􏿜 '(1) '(2) '(3) '((4)))
]

@; @section[#:tag "list-searching"]{第提、索探、筛消、理、各巡}
@; 跟􏿴的查询相关的例程有：
@; @itemlist[
@; @item{引：􏿴中各个元素的序号（索引）称之为“引”。通过􏿴中元素的序列号来查询具体的元素叫@racket[引]。用一个具体值来反向查询此值在􏿴中的引，称之为@racket[索引]。}
@; @item{索：查询􏿴中某值，并返回此值之后的所有数据组成的􏿴，称之为@racket[索]。}
@; @item{寻：@racket[寻]是用来查询联􏿴（association list，􏿴中􏿴）的，即以􏿴中之􏿴的阳位数据为查询对象来返回查询到的数据所在的􏿴。}
@; @item{选：@racket[选]是用例程来查询出所有符合条件的元素所组成的􏿴。@racket[选一]则是只返回第一查到的元素。}
@; @item{删：@racket[删]掉􏿴中某一元素。@racket[删􏿴*]从某一􏿴删掉另一􏿴中相同的所有元素。}
@; @item{@racket[各]：􏿴中的各个元素作为例程的参数传入例程并用返回结果替换原值。}
@; @item{@racket[轮]：􏿴中元素作为参数依次轮换进入执行例程。}
@; ]


@section{序、复}
@examples[#:eval (the-eval)
(序 5 徝)
(序 5 加一)
(复 5 'foo)
(序 5 (入 (n) (复 n 'foo)))
]


@section{甲——癸，末、􏿦}
使用中国古代文字记序符号“@hyperlink["https://zh.wikipedia.org/wiki/%E5%A4%A9%E5%B9%B2" "十天干"]”对􏿴中相应位置的元素进行提取。

@margin-note{
@bold{“@racket[􏿦]”为新造字：}
@itemlist[
@item{因其入参和操作入参的处理行为与“@racket[末]”类似而得偏旁“末”；}
@item{又因其返回结果的数据结构与“@racket[双]”类似而得偏旁“又”。}
]
}
@examples[#:eval (the-eval)
(甲 '(1 2 3 4))
(乙 '(1 2 3 4))
(丙 '(1 2 3 4))
(末 '(1 2 3 4))
(􏿦 '(1 2 3 4))
@; (首 '(1 2 3 4))
@; (身 '(1 2 3 4))
@; (尾 '(1 2 3 4))
]

@section{第、笈、修}
@margin-note{
@bold{“@racket[笈]”为古活字：}
@itemlist[
@item{原义不存，因其形和部首含义和“@racket[第]”对仗呼应，故此借之为“@racket[笈]”所使用。}
]
}

@examples[#:eval (the-eval)
(第 '(a b c d e c f) 2)
(笈 '(a b c d e c f) 'c)
(笈* '(a b c d e c f) 'c)
(笈/入 '(a b c d e c f)
         (入 (x)
             (或 (同? x 'b)
                 (同? x 'c))))
(笈*/入 '(a b c d e c f)
         (入 (x)
             (或 (同? x 'b)
                 (同? x 'c))))

(修 '(10 15 20 25) 1 1555)
(修/入 '(10 15 20 25) 1 加一)
]

@section{佐、佑，􏿣、􏿢，􏿡、􏿠}
@margin-note{
@itemlist[
@item{
@bold{“@racket[佐]”、“@racket[佑]”为古活字：}
@itemlist[
@item{原义不存，字中的偏旁“亻”在此有“例程输出结果的数据类型和其入参的数据类型相同”之意。}
]
}

@item{
@bold{“@racket[􏿣]”、“@racket[􏿢]”为新造字：}
@itemlist[
@item{分别仿照“@racket[佐]”和“@racket[佑]”而造，通过对原字的偏旁“亻”加“丶”而形成“㐅”，表示“去除”之意。}
]
}

@item{
@bold{“@racket[􏿡]”、“@racket[􏿠]”为新造字：}
@itemlist[
@item{分别仿照“@racket[􏿣]”和“@racket[􏿢]”而造，通过在原字右下角处添加“八”以表示“分”的意思。}
]
}

]
}

@examples[#:eval (the-eval)
(佐 '(a b c d e f g) 2)
(佑 '(a b c d e f g) 2)

(􏿣 '(a b c d e f g) 2)
(􏿢 '(a b c d e f g) 2)

(􏿡 '(a b c d e f g) 2)
(􏿠 '(a b c d e f g) 2)
]


@section{间、平、洗、重}
@examples[#:eval (the-eval)
(始􏿴于􏿴? '(a j) '(a j d k))
(始􏿴于􏿴? '(a f j) '(a j d k))

(间 '(a b c d) '和)
(平 '((a b) (c d) (e f)))
(洗 '(a b c d e c f))

(查重 '(a b c d e c f))
(去重 '(a b c d e c f))
]

@section{理、段}
@examples[#:eval (the-eval)
(理 '(21 3 888 666 55 77 1000) <)
(理 '(21 3 888 666 55 77 1000) >)
(理 '("cat" "dog" "chicken" "duck" "fox") 诗<?)
(理 '("cat" "dog" "chicken" "duck" "fox") 诗>?)



(一段数 10 20)
(一段数/间隔 10 20 2)
]


@section{索、探，查、筛、消，计}
@examples[#:eval (the-eval)
(索 'c '(a b c d e f)) ;; 索 寻 寻随
(探 'c '((a b) (c d) (e f))) ;;

(查找 正数? '(1 2 -3 4))
(筛选 正数? '(1 2 -3 4))
(筛除 正数? '(1 2 -3 4))
(筛分 正数? '(1 2 -3 4))

(消减 'c '(a b c d e c f))
(消减/入 偶数? '(1 2 3 4 5 6 7 8))
@; (删* '(c) '(a b c d e c f))
(消尽/以􏿴 '(c e) '(a b c d e c f))
(消尽/入 偶数? '(1 2 3 4 5 6 7 8))

(计数 正数? '(1 2 -3 4))
]

@section{各、巡}
@examples[#:eval (the-eval)
(各 加一 '(1 2 3 4))
(各 + '(1 2 3 4) '(100 200 300 400))

(各都为 正数? '(1 2 -3 4))
(各中有 负数? '(1 2 -3 4))
(各左参与 双 '() '(1 2 -3 4)) ;; 各左参
(各右参与 双 '() '(1 2 -3 4))

(筛而各 (入 (x) (且 (正数? x) (加一 x))) '(1 3 -4 5))
(各而连~ vector->list '(#(1) #(2 3) #(4)))

(巡 (入 (i)
          (行示 i))
      (􏿴 2 4 6 8))
]

@section[#:tag "list-base"]{基础例程}
@defmapping[
racket/base/pairs-and-lists
([对 "将两个数据对在一块。"]
 [阳 "返回居于阳位的数据。"]
 [阴 "返回居于阴位的数据。"]
)
]

@section[#:tag "list-additional"]{额外例程}
@defmodule[ming/racket/list]
@defmapping[racket/list]

@; @(defthing #:kind "汉化" cn-sab (unsyntax (elem "reason .... here")) #:value en-sab)

@; @(define-namespace-anchor anchor)
@; @(define ns (namespace-anchor->namespace anchor))
@; @(defchinesize 甲1 "采用天干" first)

@; @(define expl-mapping1 '((a . "bbbbbb") (c . @elem[sdfsdf@racket[first]])))
@; @(defchinesize "sdfsdf" (racketoutput (dict-ref expl-mapping1 'a " ")) "sdfsf")
@; @(defchinesize abjjjjj @#,(racketoutput (dict-ref expl-mapping1 'a " ")) k)
@; @(defminger abjjjjj @#,( (elem (dict-ref expl-mapping1 'c " "))) k)
@; @(defminger abjjjjj @(unsyntax (apply elem '(racketresult "sdfsfsfsdfsdfsdfsdfw ai"))) k)
