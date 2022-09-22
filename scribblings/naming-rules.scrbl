#lang scribble/manual

@(require (for-label racket ming)
           scribble/example
           scribble-rainbow-delimiters
           (file "../private/scribble-styles/css/fonts.css.rkt"))
@(define the-eval
         (make-eval-factory '(racket/base racket/list ming/racket/base ming/racket/list)))

@css/wenquan-extend-font
@script/rainbow-delimiters*


@title[#:tag "naming-rules"]{命名规则}
我曾在@secref["retrofit-chinese-to-lisp"]中提到，中文化有利于LISP代码更易被读懂，原因是中文的单字表意特性会更利于构造命名。所以，名语言的关键字命名必须依托在一套工整的规则之上，如此才能实现我所谓的更易读。

@section[#:tag "word creating rules"]{组词规则}
由字组词的规则如下：

@itemlist[
@item{凡是例程名以@litchar{*}结尾的，表示加强力度。如@racket[提*]较@racket[提]会返回更多的结果；又如@racket[消*/入]较@racket[消/入]会移除更多的元素。}
@item{凡是例程名以@litchar{~}结尾的，表示减轻力度。如@racket[链~]较@racket[链]返回的结果尾部无多余空；又如@racket[连~]较@racket[连]返回的结果尾部也无多余空。}
@item{凡是例程名字中包含@litchar{/入}的，均表示例程的参数并非是常规的数据，而是匿名函数（@racket[入]）。}
@item{凡是例程名字中包含@litchar{/成}的，均表示例程的输出结果是某一类型。比如@litchar{/成链}表示此例程返回的结果是一个@racket[链?]；类似的还有@litchar{/成诗}（@racket[诗?]）、@litchar{/成词}（@racket[词?]）等等。}
@item{凡是例程名字中包含@litchar{/以}，均是在提示例程的参数构造方式。比如：@racket[消*/以链]表示其例程的参数是@racket[链?]；又如@racket[诗修!/以它段]较@racket[诗修!]而言，参数多出了三个（这三个分别为另外一个诗，和对另外一个诗取@racket[诗段]的参数）。}
@item{......}
@item{......}
]

@section[#:tag "character creating rules"]{选造字规则}
汉字的构造法才是汉语的精髓所在：汉字的构造，在其本质上是关于如何把现实世界间存在的多维度实物（以及实物间的关联关系）全都抽象化的体现在一个二维世界上的超级实践。

能熟练读或写中文的人，基本上都明白汉字的造字方法，我下面将举例说明如何在编程语言中引入这种造字法去表达编程中的固有概念：

首先我们知道LISP编程语言里有以下数据类型和数据操作函数：pair、cons、list、vector、association list、hash、length、string-length、vector-length：

@itemlist[
@item{@bold{pair}在中文中我们可以用@litchar{双}来表示，这个汉字字符很容易让人理解@bold{pair}是什么：类似@racket['(1 . 2)]这样成对的一组数据结构我们称之为“双”。我们使用@racket[(cons 1 2)]来生成一个“双”。}
@; @item{@bold{cons}是一个数据操作函数，用来把两个数据组合在一块生成一个“双”，例如@racket[(cons 1 2)]的执行结果是一个双：@racket['(1 . 2)]。如果用汉字的造字理论，cons可以用汉字@litchar{𭠎}来表示（该汉字古已有之，由偏旁@litchar{扌}和@litchar{又}组成），@litchar{扌}是@litchar{手}的意思。
@; }

@item{@bold{list}是另外一个数据结构，它是@bold{pair}这种数据结构的衍生：用@racket[cons]像@racket[(cons 1 (cons 2 (cons 3 '())))]这样就会生成@racket['(1 2 3)]这样的@bold{list}数据结构。
@linebreak{}
我们用@litchar{􏿽}（由@litchar{辶}和@litchar{又}组成，半包围结构）来表达@bold{list}，这里的@litchar{辶}表示一个或多个的@litchar{又}（表示数据）组合在一块。
}

@item{@bold{vector}也是一种数据结构，它和@bold{list}类似。如：@racket['#(1 2 3 4)]。
@linebreak{}
@bold{vector}可以用汉字@litchar{􏿻}（由@litchar{矢}、@litchar{辶}和@litchar{又}组成，左右半包围结构）来表示。}

@item{@bold{association list}是@bold{list}这种数据结构的衍生数据结构：每个元素都是@bold{pair}的@bold{list}。如：@racket['((1 . 2) (3 . 4) (5 . 6))]。
@linebreak{}
@bold{association list}用@litchar{𨑱}来表示（该字古已有之，由偏旁@litchar{辶}和@litchar{双}组成）。
}

@item{@bold{hash}也是一种数据结构，它和@bold{association list}类似。如：@racket[#hash((1 . 2) (3 . 4))]。
@linebreak{}
@bold{hash}可以用汉字@litchar{􏿼}（@litchar{走}和@litchar{双}组成，半包围结构）来表示。}

@item{@bold{struct}是较以上各数据结构都更结构化的一种数据结构，我们用汉字@litchar{缀}表示之。}
@item{@bold{class}是较@bold{struct}更为抽象的一种数据结构，我们用汉字@litchar{䄌}表示之。}
]

下面让我们把以上所讲内容汇总成表格，来观察一下编程语言的各个概念之间的关联关系是如何被用汉字造字法创造出来的字符所含蕴的：

@tabular[#:style 'boxed
         #:column-properties '(left left)
         #:row-properties '(bottom-border ())
         (list
         (list @bold{英语单词（English Word）}  @bold{中文字符（Chinese Character）}   @bold{数据结构示例/（Showing）} @bold{数据结构创建示例/（Constructor）})
         (list @racket[pair]   "双"          @racket['(a . b)]       @racket[(双 'a 'b)])
         (list @racket[list]  "􏿽"           @racket['(a b c)]       @racket[(􏿽 a b c)])
         (list @racket[circular-list]  "㘝"   @code|{'口(a b c)}|       @racket[(㘝 'a 'b 'c)])
         (list @racket[vector] "􏿻"           @code|{'矢(a b c)}| @racket[(􏿻 'a 'b 'c)]) ; 应新造一个半格字符"矢"
         (list "----------" "---" "----------------------------" "---------------------------------------")
         (list @racket[association list] "𨑱"  @racket['((a . b) (c . d))] @racket[(􏿽 (双 'a 'b) (双 'c 'd))])
         (list @racket[hash] "􏿼"            @code|{'走((a . b) (c . d))}|       @racket[(􏿼 'a 'b 'c 'd)]) ; 应新造一个半格字符"走"
         (list "----------" "---" "----------------------------" "---------------------------------------")
         (list @racket[dict] "𰙪" "" "")
         (list @racket[struct] "缀" "" "")
         (list @racket[class] "䄌" "" "")
         (list "----------" "---" "----------------------------" "---------------------------------------")
         (list @racket[length]  "度"       "使用示例："  @code|{(度 '(a b c d e)) ==> 5}|)
         (list @racket[vector-length] "􏿺" "使用示例："  @code|{(􏿺 '矢(a b c d e)) ==> 5}|)
         (list @racket[string-length] "𬤏" "使用示例："  @code|{(𬤏 "abcde") ==> 5}|)
         )]


如果我们把@litchar{又}看成是编程中数据的概念抽象的话，通过以上例子，我们就可以明白要如何用汉字的造字法来的表达LISP语言里面的固有概念。并且我们能看到，较之英文，汉字的表达是更能体现出概念之间的逻辑关系的。

另外值得注意的是，我们如果把汉字的这个字符创造法用在其他的编程语言上恐怕未必能达到以上这样的效果，这主要因为LISP编程语言的极简主义特色：把一些简单的概念层层堆叠以组建表达复杂的概念。

这个特色在我看来，和中国上古时期易经的“太极生两仪，两仪生四象，四象生八卦”，亦或是春秋战国时期道家老庄哲学的“道生一，一生二，二生三，三生万物”有异曲同工之妙。

然后再反观中国汉字的造字法，会感觉这三者好似都遵从了同一理念。
