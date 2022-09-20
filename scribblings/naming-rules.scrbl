#lang scribble/manual


@(require (for-label racket ming)
           scribble/example
           scribble-rainbow-delimiters)
@(define the-eval
         (make-eval-factory '(racket/base racket/list ming/racket/base ming/racket/list)))

@script/rainbow-delimiters*

@title[#:tag "naming-rules"]{命名规则}

我曾在@secref["retrofit-chinese-to-lisp"]中提到，中文化有利于LISP代码更易被读懂，原因是中文的单字表意特性会更利于构造命名。所以，名语言的关键字命名必须依托在一套工整的规则之上，如此才能实现我所谓的更易读。



@itemlist[
@item{凡是例程名以“*”结尾的，表示加强力度。如@racket[提*]较@racket[提]会返回更多的结果；又入@racket[消*/入]较@racket[消/入]会移除更多的元素。}
@item{凡是例程名以“~”结尾的，表示减轻力度。如@racket[链~]较@racket[链]返回的结果尾部无多余空；又入@racket[连~]较@racket[连]返回的结果尾部也无多余空。}
@item{凡是例程名字中包含“/入”的，均表示例程的参数并非是常规的数据，而是匿名函数（@racket[入]）。}
@item{凡是例程名字中包含“/成”的，均表示例程的输出结果是某一类型。比如“/成链”表示此例程返回的结果是一个@racket[链?]；类似的还有“/成诗”（@racket[诗?]）、“/成词”（@racket[词?]）等等。}
@item{凡是例程名字中包含“/以”，均是在提示例程的参数构造方式。比如：@racket[消/以链]表示其例程的参数是@racket[链?]；又如@racket[诗修!/以它段]较@racket[诗修!]而言，参数多出了三个，这三个分别为另外一个诗，和对另外一个诗取@racket[诗段]的参数。}
@item{......}
@item{......}
]


@section[#:tag "the future of chinese programming language and chinese characters"]{中文编程语言之汉字前瞻}
@smaller{此章节为我部分实现了名语言，催生出了新的想法后的新增：}

我在实现名语言的时候，受现代汉语的影响，大部分的情况下，只是在尝试如何把不同的常用汉字做组合表达。因为现代汉语是在新文化运动的思潮下所形成的，可以说是很大程度上的受了英文这种在表达上很简易的语言（形式层面上）的影响所形成的，而在名语言中我常常要追求用单字来命名概念，因为这样子会更加的简洁明了（语义层面上），其实这很大程度上的就是古文言文的特色。

我因此常常的需要去查找一些古代汉字的含义和用法，这让我的关注点延伸到了汉字在其内部结构上是如何做组合表达的（汉字的造字法），以及不同汉字是如何通过共用偏旁来体现事物之间的内在联系的（期间还去@hyperlink["https://github.com/yanyingwang/mzhengma" "研究了一下郑码输入法"]）。

我因而发现，其实可以借用汉字的造字法，创造一些汉字来命名编程语言内部的原有概念。创造汉字来命名这些概念的过程中，天然的会共用到一些偏旁。这些被创造出来的汉字，也天然的更能体现出编程语言内部的这些概念相互之间的关联关系。

如果我们撇掉汉字的概念不谈，那这其实相当于创造了一个字符系统，然后用这个字符系统作为人机交互的中间语言，而这个中间语言就是人类使用编程语言的API。

这样讲太抽象，也体现不出来采用汉字造字法来命名编程语言原有内部概念的优势，让我来举例说明如何选用或采用汉字的造字法新造汉字去表达LISP编程语言里面的一些固有概念。

首先我们知道LISP编程语言里有以下数据类型和数据操作函数：pair、cons、list、vector、association list、hash、length、string-length、vector-length：

@itemlist[
@item{pair在中文中我们可以用@litchar{双}来表示，这个汉字字符很容易让人理解记忆出pair是什么（即使不懂中文）：类似@racket['(1 . 2)]这样成对的一组结构的数据就是“双”。}
@item{cons是一个数据操作函数，用来把两个数据组合在一块生成一个“双”，例如@racket[(cons 1 2)]的执行结果是一个双：@racket['(1 . 2)]。如果用汉字的造字理论，cons可以用汉字@litchar{𭠎}来表示（该汉字古已有之，由偏旁@litchar{扌}和@litchar{又}组成），@litchar{扌}是@litchar{手}的意思。
}
@item{list是另外一个数据结构，它是pair这种数据结构的衍生：用@racket[cons]像@racket[(cons 1 (cons 2 (cons 3 '())))]这样就会生成@racket['(1 2 3)]这样的list数据。@linebreak{}如果用汉字的造字理论，我们可以用@litchar{}（辶又，半包围结构）来组成，@litchar{辶}表示一个或多个的@litchar{又}组合在一块。
}
@item{association list是list这种数据结构的衍生数据结构——list的每个元素都要是pair，如：@racket['((1 . 2) (3 . 4) (5 . 6))]。如果用汉字的造字理论，association list可以用汉字@litchar{𨑱}来表示（该汉字古已有之，由偏旁@litchar{辶}和@litchar{双}组成）。
}
@item{hash也是一种数据结构，它可以看成是association list的一种变形，如：@racket[#hash((1 . 2) (3 . 4))]。如果用汉字的造字理论，hash可以用汉字@litchar{􏿼}（走双，半包围结构）来表示。}
@item{vector也是一种数据结构，它可以看成是list的变形，如：@racket['#(1 2 3 4)]。@linebreak{}
如果用汉字的造字理论，hash可以用汉字@litchar{􏿻}（辶矢又，半包围上下结构）来表示。}
]

让我们汇总成表格来比照一下用汉字的造字理论所能清晰的表达出来的各个数据结构之间的内部关系：
@tabular[#:style 'boxed
         #:column-properties '(left left)
         #:row-properties '(bottom-border ())
         (list
         (list @bold{English}   @bold{中文}    @bold{代码示例})
         (list @racket[pair]   "双"    @racket[数据结构：'(a . b)])
         (list @racket[cons]   "双"    @racket[生成操作：(双 'a 'b) ==> '(a . b)])

         (list @racket[list]  "􏿽"     @racket[数据结构：'(a b c)])
         (list @racket[list]  "􏿽"     @racket[生成操作：(􏿽 a b c) ==> '(a b c)])

         (list @racket[circular-list]  "㘝"     @racket[数据结构：(㘝 'a 'b 'c)])
         (list @racket[circular-list]  "㘝"     @racket[生成操作：(㘝 'a 'b 'c) ==> ])

         (list @racket[vector] "􏿻"    @racket[数据结构：'矢(a b c)]) ; 应新造一个半格字符"矢"
         (list @racket[vector] "􏿻"    @racket[生成操作：(􏿻 'a 'b 'c) ==> '#(a b c)])

         (list @racket[association list] "𨑱"  @racket[数据结构：'((a . b) (c . d) (e . f))])

         (list @racket[hash] "􏿼"    @racket[数据结构：'走((a . b) (c . d) (e . f))]) ; 应新造一个半格字符"走"
         (list @racket[hash] "􏿼"    @racket[生成操作：(􏿼 'a 'b 'c 'd 'e 'f) ==> '走((a . b) (c . d) (e . f))])

         (list @racket[dict] "𰙪" "")

         (list @racket[length]  "度"        @racket[(度 '(a b c d e)) ==> 5])
         (list @racket[vector-length] "􏿺"  @racket[(􏿺 '矢(a b c d e)) ==> 5])
         (list @racket[string-length] "𬤏"  @racket[(𬤏 "abcde") ==> 5])

         )]

如果我们把@litchar{又}看成是一个数据的话，通过以上例子，我们可以明白如何用汉字的造字理论来清楚的表达出它所命名的LISP语言里面的概念的。

另外，把汉字的这个字符创造实践用在其他的编程语言上恐怕未必能达到这样的效果，这主要因为LISP语言的简单概念层层堆叠以表达复杂概念的特色，这有点像中国古代易经的“太极生两仪两仪生四象四象生八卦”，亦或者是庄子哲学的“道生一，一生二，二生三，三生万物”。

我想，中国汉字的创造恐怕也有受易经这一概念的影响。
