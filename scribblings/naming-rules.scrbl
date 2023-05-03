#lang scribble/manual

@(require (for-label racket ming ming/list ming/vector)
           scribble/example
           scribble-rainbow-delimiters)
@(define the-eval
         (make-eval-factory '(racket/base racket/list ming/racket/base ming/racket/list)))

@(require (file "../private/scribble-styles/css/ming-fonts.css.rkt"))
@css/ming-fonts
@(require scribble-rainbow-delimiters)
@script/rainbow-delimiters*


《SOICOL》中的@hyperlink["http://www.yanying.wang/SOICOL/zhaiyao.html" "〈摘要〉"]、@hyperlink["http://www.yanying.wang/SOICOL/fenxi.html#%28part._~e4~ba~8c~e8~bf~9b~e5~88~b6_~e6~98~93~e7~bb~8f~e5~92~8c~e6~b1~89~e5~ad~97%29" "〈二进制、易经和汉字〉"]章节可以被认为是本命名规则的哲学思源概述，而@hyperlink["http://www.yanying.wang/SOICOL/sheji.html#%28part._~e6~b1~89~e5~ad~97~e9~80~a0~e5~ad~97~e6~b3~95_~e5~9f~ba~e4~ba~8e~e5~85~b6~e5~8f~91~e5~b1~95~e5~87~ba~e7~9a~84~e6~95~b0~e6~8d~ae~e7~bb~93~e6~9e~84~e5~90~8d%29" "〈汉字造字法：基于其发展出的数据结构名〉"]章节对这种哲学思源作出了具象概括。

@title[#:tag "naming-rules"]{命名总则}

@section[#:tag "word creating rules"]{单字}
@tabular[@;#:sep @hspace[0]
         #:style 'boxed
         #:column-properties '(center)
         #:row-properties '(border)
         (list (list @bold{规则} @bold{含义} @bold{进出参} @bold{举例})
               (list
               @elem{左偏旁@litchar{亻}}
               "相似集（类型相同且元素相似）"
               @elem{出参数据与进参数据相比，类型相同且内容类似}
               @elem{@racket[伄]、@racket[攸]、@racket[𰂋]、@racket[偏]、@racket[􏾜]、@racket[􏾛]、@racket[偅]、@racket[𠆯]、@racket[􏷹]}
               )

               (list
               @elem{右偏旁@litchar{阝}}
               "连续集（类型相同且元素连续相同）"
               @elem{出参数据与进参数据相比，类型相同且前者是后者的一部分}
               @elem{@racket[􏾝]、@racket[􏾺]、@racket[𨚞]、@racket[𬩵]、@racket[䢼]、@racket[𬩽]}
               )

               (list
               @elem{右偏旁@litchar{刂}}
               "缺失集（删除、移走、去掉部分元素之后的集合）"
               @elem{出参数据与进参数据相比，类型相同且前者是后者的子集}
               @elem{@racket[􏷵]、@racket[􏷴]、@racket[𠝤]、@racket[􏷶]、@racket[􏷲]}
               )

               (list
               @elem{左偏旁@litchar{土}}
               "“构建”、“创建”的意思"
               @elem{出参类型不一而多变}
               @elem{@racket[垎]}
               )

         )
         ]


@section[#:tag "word creating rules"]{标点}
@tabular[@;#:sep @hspace[0]
         #:style 'boxed
         #:column-properties '(center)
         #:row-properties '(border)
         (list (list @bold{规则} @bold{含义} @bold{进出参} @bold{举例})
               (list
               @elem{以@litchar{?}结尾}
               "指示出参"
               "出参是布尔值"
               @elem{@racket[空?]}
               )
               (list
               @elem{以@litchar{!}结尾}
               "指示过程"
               "对入参数据做出了直接修改"
               @elem{@racket[􏿲攸!]}
               )
               (list
               @elem{以@litchar{~}结尾}
               "减轻力度"
               "出参内容更加贫瘠"
               @elem{@racket[􏷲~]、@racket[􏷶~]}
               )

               (list
               @elem{以@litchar{v}结尾}
               @elem{加强力度（且改变出参成@racket[􏿴]）}
               @elem{出参内容更加丰富且被封装成@racket[􏿴]数据结构}
               @elem{@racket[引v]}
               )
               (list
               @elem{以@litchar{^}结尾}
               @elem{加强力度（通过改变入参成@racket[􏿴]）}
               @elem{入参内容更加丰富且被封装进@racket[􏿴]数据结构}
               @elem{@racket[􏷲^]、@racket[伄^]}
               )

               (list
               @elem{以@litchar{/}符号分割}
               @elem{@litchar{/}之后的内容是为修饰@litchar{/}之前的内容的}
               @elem{出参数据由@litchar{/}之前的内容决定}
               @elem{@racket[􏿴/组合]、@racket[􏿴/分组]}
               )
         )
         ]

@section[#:tag "word creating rules"]{组词}
@tabular[@;#:sep @hspace[0]
         #:style 'boxed
         #:column-properties '(center)
         #:row-properties '(border)
         (list (list @bold{规则} @bold{含义} @bold{进出参} @bold{举例})
               (list
               @elem{以@litchar{分}结尾}
               "分离成复值"
               @elem{出参数据为复值}
               @elem{@racket[􏾺分]、@racket[𨚞分]、@racket[䢼分]、@racket[􏷳分]、@racket[􏷹分]}
               )

               (list
               @elem{以@litchar{􏿴}结尾}
               @elem{构造生成@racket[􏿴]数据}
               @elem{出参数据结构是@racket[􏿴]}
               @elem{@racket[序􏿴]、@racket[复􏿴]、@racket[𥸬􏿴]}
               )

               (list
               @elem{@litchar{/入}}
               "进参为函数"
               @elem{进参并非常规数据，而是函数}
               @elem{@racket[度/入]、@racket[引/入]、@racket[引v/入]、@racket[𬩽/入]、@racket[􏿁/入]、@racket[攸/入]、@racket[􏾺/入]、@racket[𨚞/入]}
               )

               (list
               @elem{以@litchar{化}结尾}
               @elem{类型转换}
               @elem{出参数据内容不变而类型作小幅度改变}
               @elem{@racket[􏿲定化]}
               )

               (list
               @elem{以@litchar{化}联结}
               @elem{类型转换}
               @elem{出参数据内容不变而类型改变}
               @elem{@racket[􏿲化􏿴]、@racket[􏿴化􏿲]}
               )
         )
         ]


@section[#:tag "word creating rules"]{混用}
@tabular[@;#:sep @hspace[0]
         #:style 'boxed
         #:column-properties '(center)
         #:row-properties '(border)
         (list (list @bold{规则} @bold{含义} @bold{进出参} @bold{举例})
               (list
               @elem{@litchar{/入}}
               "进参为函数"
               @elem{进参并非常规数据，而是函数}
               @elem{@racket[度/入]、@racket[引/入]、@racket[引v/入]、@racket[𬩽/入]、@racket[􏿁/入]、@racket[攸/入]、@racket[􏾺/入]、@racket[𨚞/入]}
               )
         )
         ]