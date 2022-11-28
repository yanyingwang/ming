#lang scribble/manual

@(require (for-label racket ming ming/list)
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
@item{@bold{含有上偏旁@litchar{㐅}的}：是为“删除”之意。 此如@racket[􏾹]、@racket[􏾸]、@racket[􏿄]、@racket[􏾼]等。}
@item{@bold{含有左偏旁@litchar{亻}的}：是为“相似者”之意；表示出参之数据结构和进参相同（都是@elemref["what-is-􏿴􏿫" "􏿴"]），并且出参之数据内容和进参类似。 此如@racket[攸]、@racket[􏿊]、@racket[侠]、@racket[伻]、@racket[􏾷]、@racket[􏿄]、@racket[倒]、@racket[𠍣]等。}
@item{@bold{含有右偏旁@litchar{阝}的}：是为“部分”之意；表示出参之数据结构和进参相同（都是@elemref["what-is-􏿴􏿫" "􏿴"]），并且出参之数据内容是进参的一部分。 此如@racket[􏾺]、@racket[𬩽]等。}
@item{@bold{含有偏旁@litchar{辶}的}：表示“遍历”的意思，且其出参数据之结构与进参相同（都是@elemref["what-is-􏿴􏿫" "􏿴"]）。 此如@racket[􏾽]、@racket[𮞑]等。}
@item{@bold{以@litchar{分}字结尾的}：是为“切分”之意，且输出结果是复值。 此如@racket[􏾺分]、@racket[左䢼分]、@racket[􏾽分]等。}
@item{@bold{以@litchar{*}结尾的}：表示加强力度。此如@racket[删*]、@racket[􏿴/数段*]等。}
@item{
除以下子条目外，@bold{含@litchar{/...}的}：是为修饰进参，且并不影响出参数据结构，即是说：出参数据结构由@litchar{/...}前面的决定。此如@racket[􏿴/数段]的出参数据之结构和@racket[􏿴]一样；又如@racket[􏿴/组合]和出参数据之结构和@racket[􏿴]是一样的。
@itemlist[
@item{@bold{含@litchar{/入}的}：表示进参并非常规数据，而是函数。此如@racket[𬩽/入]、@racket[攸/入]、@racket[笈/入]、@racket[􏾺/入]等。}
@item{@bold{含@litchar{/而...}的}：意为“进而”的意思，不影响进参，影响出参，出参数据由@litchar{而}之后的字决定。此如@racket[𮞑/而􏾼]、@racket[𮞑/而􏿝]、@racket[𮞑/而最小数]、@racket[𮞑/而最大数]等。}
]
}





@; @item{凡是以“􏿴”字结尾的，均表示输出结果是􏿴。此如：@racket[􏿴]、@racket[􏿴~]、@racket[序􏿴]、@racket[复􏿴]等。}
@; @item{含有“彳”偏旁的例程，表示其出参数据之结构是@racket[徝]类型。此如：@racket[􏿆]、@racket[􏿅]等。}
@; @item{例程名采用单字的，并且在构字外形上是类似“􏿴”字这样的半包围结构的，表示其出参数据之结构是@elemref["what-is-􏿴􏿫" "􏿴"]类型。此如：@racket[􏿫]、@racket[􏿛]、@racket[􏿝]、@racket[􏿜]等。}
@; @item{例程名采用单个字的，@elemref["what-is-􏿴􏿫" "􏿴"]类型的数据作为入参位于首位，此如@racket[第]、@racket[笈]、@racket[佐]、@racket[佑]、@racket[间]、@racket[理]等。}
@; @item{例程名采用多个字的，@elemref["what-is-􏿴􏿫" "􏿴"]类型的数据作为入参通常位居末位，此如：@racket[计数]、@racket[查找]、@racket[筛选]等。}
]


@section[#:tag "pair-car-cdr-list-list*"]{双，阴、阳，􏿴、􏿫}
@margin-note{
@bold{“@racket[􏿴]”、“@racket[􏿫]”为@elemtag["the-char-creating-of-􏿴􏿫" "新造字"]}
@itemlist[
@item{
因其所代表的数据结构（list）和“@racket[双]”所代表的数据结构（pair）互相之间的内生性变换转化关系而得造：
@itemlist[
@item{多个“@racket[双]”互相衔接并且最后一个双的阴位留空即成“@racket[􏿴]”（不留空是为@racket[􏿫]）；}
@item{每一个“􏿴”类型的数据同时也是“双”类型。}
]
}
@item{
两字由@litchar{又}和@litchar{㐅}、@litchar{又}组成，含义：
@itemlist[
@item{其中左起半包围结构的@litchar{又}表示其是一种类似链一样的内部元素之间依次互相衔接、可以向后延绵不绝的数据结构；}
@item{其中被包围的居于之后的@litchar{㐅}（组成@litchar{􏿴}）表示本数据结构的末位元素总是一个空值。}
@item{其中被包围的居于之后的@litchar{又}（组成@litchar{􏿫}）表示本数据结构的末位元素不是空值。}
]
}
]
}

“双”（@tech[ #:doc '(lib "scribblings/reference/reference.scrbl") "pair"]）是LISP语言最最基础的数据结构：

对于名语言来说，如果我们把两个数据配成对（@racket[双]在一块），我们就得到一个“双”，而双在一块的这两个数据分别处于他们所构成的这个“双”的@racket[阳]位和@racket[阴]位。

进而，@elemtag["what-is-􏿴􏿫" "如果一个“双”的阴位存的是另外一个“双”，数个双如此前后相接成链状："]
@itemlist[
@item{末尾双的阴位留@racket[空]，这样的数据结构称之为@racket[􏿴]（@racket[list]）；}
@item{末尾双的阴位不留@racket[空]，这样的数据结构称之为@racket[􏿫]（@racket[list*]）。}
]

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

@section{􏿴/数段、􏿴/数段*}
用于构造一个元素是一段整数的􏿴。
@examples[#:eval (the-eval)
(􏿴/数段 10 20)
(􏿴/数段* 10 20)
(􏿴/数段 10 20 2)
(􏿴/数段* 10 20 2)
]

@section{序、复} @; 土序 土复 土 means building something.
用于构造@elemref["what-is-􏿴􏿫" "􏿴"]类型的数据。
@examples[#:eval (the-eval)
(序 5 徝)
(序 5 加一)
(复 5 'foo)
(序 5 (入 (n) (复 n 'foo)))
]


@section{攸}
修改􏿴中的某个元素为新值并返回修改后的􏿴。
@margin-note{
@bold{“@racket[攸]”为活古字}
@itemlist[
@item{@litchar{攵}本意是“用手敲打敦促使其改变”，在此引申为“修改”之意；}
@item{@litchar{亻}和@litchar{攵}中间的@litchar{丨}表示只修改了@elemref["what-is-􏿴􏿫" "􏿴"]中的一项元素；}
@item{另外，也可以认为该字分别取@litchar{修}字左部的偏旁（@litchar{亻丨}）和@litchar{改}字右部偏旁（@litchar{攵}）组成，也即含有“修改”的意思。}
]
}
@examples[#:eval (the-eval)
(攸 '(10 15 20 25) 1 1555)
(攸/入 '(10 15 20 25) 1 加一)
]

@; @section{􏿛}
@; 用于修改一个􏿴类型的数据。
@; @margin-note{
@; @bold{“@racket[􏿛]”为新造字}
@; @itemlist[
@; @item{右边的“􏿴”偏旁表示和“@racket[􏿴]”的出参数据类型是相同的（即@elemref["what-is-􏿴􏿫" "􏿴"]）；}
@; @item{左边“亻”偏旁表示入参和出参的数据之内容相似且类型相同（均为@elemref["what-is-􏿴􏿫" "􏿴"]）； }
@; @item{“亻”偏旁和“􏿴”偏旁之间的“丨”表示入参数据和出参数据之内容的不同之处只有一项。}
@; ]
@; }
@; @examples[#:eval (the-eval)
@; (􏿛 '(10 15 20 25) 1 1555)
@; (􏿛/入 '(10 15 20 25) 1 加一)
@; ]

@section{􏿝、􏿜}
用于对@elemref["what-is-􏿴􏿫" "􏿴"]类结构数据进行处理并输出相同于@racket[􏿴]、@racket[􏿫]例程输出数据之结构的数据。
@margin-note{
@bold{“@racket[􏿝]”、“@racket[􏿜]”为新造字}
@itemlist[
@item{两字分别是仿照@elemref[ "the-char-creating-of-􏿴􏿫" "􏿴、􏿫"]字而造：因为与他们处理数据后输出的结果之数据类型相同（不同在于新造字例程的输入参数之数据类型为@elemref["what-is-􏿴􏿫" "􏿴"]）；}
@item{左上起笔处的偏旁@litchar{毌}，表示“贯穿”之意（@litchar{毌}是@litchar{贯}的古字）：因此意思即为把数个@elemref["what-is-􏿴􏿫" "􏿴"]贯穿起来组成一个新的@elemref["what-is-􏿴􏿫" "􏿴"]并返回之。}
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


@section{甲、乙、丙、丁、戊、己、庚、辛、壬、癸}
使用中国古代文字记序符号“@hyperlink["https://zh.wikipedia.org/wiki/%E5%A4%A9%E5%B9%B2" "十天干"]”，对@elemref["what-is-􏿴􏿫" "􏿴"]类型的数据中特定位置之元素进行提取。
@examples[#:eval (the-eval)
(甲 '(1 2 3 4 5 6 7 8 9 10))
(乙 '(1 2 3 4 5 6 7 8 9 10))
(丙 '(1 2 3 4 5 6 7 8 9 10))
(癸 '(1 2 3 4 5 6 7 8 9 10))
]

@section{末、􏿦}
返回􏿴中末尾位置的元素。
@margin-note{
@bold{“@racket[􏿦]”为新造字}
@itemlist[
@item{因字所代表之例程的入参和操作入参的处理行为与“@racket[末]”类似而得偏旁@litchar{末}；}
@item{又因其返回结果的数据之结构与“@racket[双]”的返回类似而得偏旁@litchar{又}。}
]
}
@examples[#:eval (the-eval)
(末 '(1 2 3 4))
(􏿦 '(1 2 3 4))
@; (首 '(1 2 3 4))
@; (身 '(1 2 3 4))
@; (尾 '(1 2 3 4))
]


@section{第，笈、􏿊、􏿊/入}
@; 用于索引􏿴中的元素和查找􏿴中某元素的索引（另见：@racket[􏿊]、@racket[􏿚]）。

@margin-note{
@bold{“@racket[笈]”为活古字}
@itemlist[
@item{原义不存，因其形和“@racket[第]”字能对仗呼应，故此使用之。}
]
@bold{“@racket[􏿊]”为新造字}
}

@examples[#:eval (the-eval)
(第 '(a b c d e c f) 2)
(笈 '(a b c d e c f) 'c)
(笈/入 '(a b c d e c f)
         (入 (x)
             (或 (同? x 'b)
                 (同? x 'c))))

(􏿊 '(a b c d e c f) 'c)
(􏿊/入 '(a b c d e c f)
         (入 (x)
             (或 (同? x 'b)
                 (同? x 'c))))
]


@; @margin-note{
@; @itemlist[
@; @item{
@; @bold{“@racket[佐]”、“@racket[佑]”为活古字}
@; @itemlist[
@; @item{原义不存，字中的偏旁“亻”在此有“例程输出结果的数据类型和其入参的数据类型相同”之意。}
@; ]
@;; }
@; @item{
@; @bold{“@racket[􏿐]”、“@racket[􏿏]”为新造字}
@; @itemlist[
@; @item{分别仿照“@racket[佐]”和“@racket[佑]”而造，通过对原字加“㐅”，表示“去除”之意。}
@; ]
@;; }
@; @item{
@; @bold{“@racket[􏿆]”、“@racket[􏿅]”为新造字}
@; 分别仿照“@racket[佐]”和“@racket[佑]”而造：
@; @itemlist[
@; @item{在原字右下角处添加“分”表示“切分”之意思；}
@; @item{“彳”表示例程的出参数据之结构是@racket[徝]类型。}
@; ]
@;; }
@; ]
@; }
@section{􏾺、𨚞，􏾹、􏾸，􏾺分、𨚞分，􏾺/入、𨚞/入，􏾺于?}
@margin-note{
@bold{“@racket[􏾺]”、“@racket[𨚞]”为新造字}
}
@margin-note{
@bold{“@racket[􏾹]”、“@racket[􏾸]”为新造字}
}


@examples[#:eval (the-eval)
(􏾺 '(a b c d e f g) 2)
(𨚞 '(a b c d e f g) 2)

(􏾹 '(a b c d e f g) 2)
(􏾸 '(a b c d e f g) 2)

(􏾺分 '(a b c d e f g) 2)
(𨚞分 '(a b c d e f g) 2)

(􏾺/入 '(8 4 a b 1 c d 2 e f g 3 5 9) 数?)
(𨚞/入 '(8 4 a b 1 c d 2 e f g 3 5 9) 数?)

(􏾺于? '(a b) '(a b c d e f g))
(􏾺于? '(a b z) '(a b c d e f g))
]


@section{左䢼，左䢼分、左􏾶分}
@margin-note{
@bold{“@racket[䢼]”、“@racket[􏾶]”为新造字}
@itemlist[
@item{@litchar{共}表示“共同，共有”之意。}
]
}
@examples[#:eval (the-eval)
(左䢼 '(a b x y z) '(a b c d e f g))
(左䢼分 '(a b x y z) '(a b c d e f g))
(左􏾶分 '(a b x y z) '(a b c d e f g))
]


@section{侠，伻，􏾷，重、􏿄} @; 侠 􏿃 􏿄 去偅 𠉗
@margin-note{
@; @bold{“@racket[􏿃]”为活用字}
@; @itemlist[
@; @item{“掺”表示把某一值掺入到􏿴中；}
@; @item{“亻”表示出参数据之结构和入参相同（均为􏿴）。}
@; ]
@; }
@bold{“@racket[侠]”为活用字}
@itemlist[
@item{@litchar{夹}表意，意为“把某一值夹杂到􏿴中”；}
]
}

@margin-note{
@bold{“@racket[伻]”为新造字}
@itemlist[
@item{@litchar{平}表意，意为“将􏿴中元素做扁平化处理”；}
]
}

@; @margin-note{
@; @bold{“@racket[𠉗]”为活古字}
@; @itemlist[
@; @item{“乱”字表意，意为“将􏿴中元素做乱序处理”；}
@; @item{“亻”偏旁表示出参数据之结构和入参相同（均为􏿴）；}
@; ]
@; }
@margin-note{
@bold{“@racket[􏾷]”为新造字}
@itemlist[
@item{@litchar{紊}表意（紊本意是“乱”的意思（故有成语“有条不紊”）），意为“对􏿴中元素做乱序处理”；}
]
}
@margin-note{@bold{“@racket[􏿄]”为新造字}}

@examples[#:eval (the-eval)
(侠 '(a b c d) '和)
(伻 '((a b) (c d) (e f)))
(􏾷 '(a b c d e d c b a))

(重 '(a b c d e d c b a))
(􏿄 '(a b c d e d c b a))
]


@section{倒、𠍣}
@margin-note{
@bold{“@racket[𠍣]”为新造字}
@itemlist[
@item{@litchar{排}表意，意为“对􏿴中元素进行排序”。}
]
}
@examples[#:eval (the-eval)
(倒 '(21 3 888 666 55 77 1000))
(𠍣 '(21 3 888 666 55 77 1000) <)
(𠍣 '(21 3 888 666 55 77 1000) >)
(𠍣 '("cat" "dog" "chicken" "duck" "fox") 诗<?)
(𠍣 '("cat" "dog" "chicken" "duck" "fox") 诗>?)
]


@section{𬩽、􏿁，𬩽/入、􏿁/入，删、删*、删/入、删*/入，计}
@margin-note{
@bold{“@racket[􏿁]”为新造字}
@itemlist[
@item{@litchar{日}偏旁表示“取@racket[阳]”之意。}
]
}
@examples[#:eval (the-eval)
(𬩽 'c '(a b c d e f))
(􏿁 'c '((a b) (c d) (e f)))
(𬩽/入 数? '(a b 1 c d 3 e 9 f))
(􏿁/入 数? '((a b) (1 d) (j k) (8 f))) ;;

(删 'c '(a b c d e c f))
(删* '(c e) '(a b c d e c f))
(删/入 正数? '(1 2 -3 4))
(删*/入 正数? '(1 2 -3 4))

(计 正数? '(1 2 -3 4))
]

@section{查、􏾽、􏾼、􏾽分}
@margin-note{@bold{“@racket[􏾽]”、“@racket[􏾼]”为新造字}}
@examples[#:eval (the-eval)
(查 正数? '(1 2 -3 4))
(􏾽 正数? '(1 2 -3 4))
(􏾼 正数? '(1 2 -3 4))
(􏾽分 正数? '(1 2 -3 4)) @; 􏾽离 would still be list
]

@section{各，𮞑，𮞑全、𮞑有，𮞑/参予、𮞑/倒参予，𮞑/而􏾼、𮞑/而􏿝}
@margin-note{@bold{“@racket[𮞑]”为新造字}}
@examples[#:eval (the-eval)
(各 (入 (i)
        (行示 i))
    (􏿴 2 4 6 8))

(𮞑 加一 '(1 2 3 4))
(𮞑 + '(1 2 3 4) '(100 200 300 400))

(𮞑全 正数? '(1 2 -3 4))
(𮞑有 负数? '(1 2 -3 4))

(𮞑/参予 双 '() '(1 2 -3 4))
(𮞑/倒参予 双 '() '(1 2 -3 4))

(𮞑/而􏾼 (入 (x) (且 (正数? x) (加一 x))) '(1 3 -4 5))
(𮞑/而􏿝 vector->list '(#(1) #(2 3) #(4)))

(𮞑/而最大数 char->integer '(#\a #\y #\b #\k #\c #\j #\d))
(𮞑/而最小数 char->integer '(#\a #\y #\b #\k #\c #\j #\d))
(𮞑/而最大数 阳 '((3 pears) (1 banana) (2 apples)))
(𮞑/而最小数 阳 '((3 pears) (1 banana) (2 apples)))
]

@section[#:tag "list-base"]{基础例程}
@defmapping[
racket/base/pairs-and-lists
([阳 "返回居于阳位的数据。"]
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
