#lang scribble/manual

@(require (for-label racket ming ming/list ming/vector ming/hash ming/string)
           scribble/example
           scribble-rainbow-delimiters)
@(define the-eval
         (make-eval-factory '(racket/base racket/list ming/racket/base ming/racket/list)))

@(require (file "../private/scribble-styles/css/ming-fonts.css.rkt"))
@css/ming-fonts
@(require scribble-rainbow-delimiters)
@script/rainbow-delimiters*


《SOICOL》中的@hyperlink["http://www.yanying.wang/SOICOL/zhaiyao.html" "〈摘要〉"]、@hyperlink["http://www.yanying.wang/SOICOL/fenxi.html#%28part._~e4~ba~8c~e8~bf~9b~e5~88~b6_~e6~98~93~e7~bb~8f~e5~92~8c~e6~b1~89~e5~ad~97%29" "〈二进制、易经和汉字〉"]章节可以被认为是本命名规则的哲学思源概述，而@hyperlink["http://www.yanying.wang/SOICOL/sheji.html#%28part._~e6~b1~89~e5~ad~97~e9~80~a0~e5~ad~97~e6~b3~95_~e5~9f~ba~e4~ba~8e~e5~85~b6~e5~8f~91~e5~b1~95~e5~87~ba~e7~9a~84~e6~95~b0~e6~8d~ae~e7~bb~93~e6~9e~84~e5~90~8d%29" "〈汉字造字法：基于其发展出的数据结构名〉"]章节则对这种哲学思源作出了具象概述。

@title[#:tag "naming-rules"]{命名总则}

@section[#:tag "word creating rules"]{成字}
@tabular[@;#:sep @hspace[0]
         #:style 'boxed
         #:column-properties '(center)
         #:row-properties '(border)
         (list (list @bold{偏旁} @bold{含义} @bold{进出参} @bold{举例})
               (list
               @elem{@bold{@litchar{亻}}}
               "相似集（类型相同且元素相似）"
               @elem{出参数据与进参数据相比，类型相同且内容类似}
               @elem{@racket[伄]、@racket[攸]、@racket[𰂋]、@racket[偏]、@racket[􏾜]、@racket[􏾛]、@racket[偅]、@racket[𠆯]、@racket[􏹈]}
               )

               (list
               @elem{@bold{@litchar{阝}}}
               "连续集（类型相同且元素连续相同）"
               @elem{出参数据与进参数据相比，类型相同且前者是后者的一部分}
               @elem{（@racket[阴]、@racket[阳]）、@racket[􏾝]、@racket[􏾺]、@racket[𨚞]、@racket[䢼]、@racket[􏹋]、@racket[邭]}
               )

               (list
               @elem{@bold{@litchar{刂}}}
               "缺失集（删除、移走、去掉部分元素之后的集合）"
               @elem{出参数据与进参数据相比，类型相同且前者是后者的子集}
               @elem{@racket[􏷵]、@racket[􏷴]、@racket[􏺊]、@racket[𠝤]、@racket[􏹇]、@racket[􏹊]}
               )

               (list
               @elem{@bold{@litchar{彐}}}
               @elem{寻找（@litchar{寻}的简写）}
               @elem{进参数量很多，而出参数量很少且是其的子集（并非约定规则，但是“寻找”这一动作必然预示着会有这样的效果）}
               @elem{@racket[􏹋]、@racket[􏹉]、@racket[􏹊]、@racket[􏹅]、@racket[􏹌]、@racket[􏹈]、@racket[􏹇]，@racket[􏺗]、@racket[􏺘]}
               )

               @; (list
               @; @elem{@bold{@litchar{刀}}}
               @; "修改"
               @; @elem{}
               @; @elem{@racket[􏻏]}
               @; )

               (list
               @elem{@bold{@litchar{戈}}}
               @elem{修改替换}
               @elem{进参至少有三个（非约定规则，是“替换”这一动作使然）”}
               @elem{@racket[􏼥]}
               )

               @; (list
               @; @elem{@bold{@litchar{匕}}}
               @; @elem{小幅度的修改}
               @; @elem{}
               @; @elem{@racket[􏼝]、@racket[􏺚]、@racket[􏺽]、@racket[􏺾]}
               @; )

               (list
               @elem{@bold{@litchar{土}}}
               "构建、创建"
               @elem{出参类型不一而多变}
               @elem{@racket[垎]}
               )

               (list
               @elem{@bold{@litchar{扌}}}
               @elem{直接修改了原始数据（通标点@bold{@litchar{!}}）}
               @elem{无出参}
               @elem{􏾩(@racket[􏻿􏾩]、@racket[􏿰􏾩])、@racket[􏼘]、􏽒（@racket[􏻿􏽒]）、𰅡(@racket[􏻺𰅡])、@racket[􏻿􏾩/以􏾝]}
               )

               (list
               @elem{@bold{@litchar{攵}}}
               @elem{修改}
               @elem{入参为“索引数字”和“值”（“修改”这一动作使然）}
               @elem{@racket[攸]、@racket[􏼘]、@racket[􏿰攸]}
               )


               (list
               @elem{@bold{@litchar{三}}}
               @elem{若干个相同元素 @linebreak{}
                     （道生一，一生二，二生三，三生万物。故“三”有“多”之意，进而解释为：三个（若干个）一（相同的元素））}
               @elem{无}
               @elem{@racket[􏼓]、@racket[􏻺]、@racket[􏼅]}
               )

               (list
               @elem{@bold{@litchar{弔}}}
               @elem{序数（原是“索引”之意（见@racket[弔]），但因索引是从零开始的序数，故在此借用之）}
               @elem{无}
               @elem{@racket[􏼎]、@racket[􏻻]、@racket[􏼄]}
               )
               (list
               @elem{@bold{@litchar{弔}}}
               @elem{视具体情况，均与“索引”之意有关}
               @elem{进参或出参为@racket[􏺡?]（精确非负整数）}
               @elem{@racket[弔]、@racket[伄]、@racket[􏾘]、@racket[􏾝]、@racket[􏼭]、@racket[􏻿弔]、@racket[􏿰弔]、@racket[􏿰􏾘]}
               )
               
               (list
               @elem{@bold{@litchar{毌}}}
               @elem{贯穿（@litchar{贯}的古字）；}
               @elem{无}
               @elem{@racket[􏿝]、@racket[􏻹]、@racket[􏼃]、@racket[􏼂]、@racket[􏼁]、}
               )

               (list
               @elem{@bold{@litchar{穴}}}
               @elem{空的，无值的（@litchar{空}的简写）}
               @elem{无}
               @elem{@racket[空?]、@racket[𥥪?]、@racket[􏻸?]、@racket[􏻵?]、@racket[􏻷?]、@racket[􏼟?]}
               )

               (list
               @elem{@bold{@litchar{非}}}
               @elem{否定含意}
               @elem{无}
               @elem{@racket[􏼟?]、@racket[𥥪?]、@racket[􏻸?]、@racket[􏻵?]、@racket[􏻷?]、@racket[􏼟?]}
               )


               (list
               @elem{@bold{@litchar{巨}}}
               @elem{测量长度}
               @elem{出参是@racket[米?]（数字）}
               @elem{@racket[巨]、@racket[􏺕]、@racket[􏻿巨]、@racket[􏿰巨]}
               )

               (list
               @elem{@bold{@litchar{米}}}
               @elem{数字（@litchar{数}的简写）}
               @elem{无}
               @elem{@racket[􏼏]、@racket[米?]、@racket[𥥪?]、@racket[夈?]、@racket[粊?]、@racket[􏻛?]、@racket[􏺧?]、@racket[􏽊]}
               )

               (list
               @elem{@bold{@litchar{山}}}
               @elem{稳定的、内容不变的（见：@racket[固?]）}
               @elem{无}
               @elem{@racket[􏻼]、@racket[􏾐]、@racket[􏽁]}
               )

               (list
               @elem{@bold{@litchar{氵}}}
               @elem{易动的、内容可变的（见：@racket[易?]）}
               @elem{无}
               @elem{@racket[􏻽]、@racket[􏾑]、@racket[􏽀]}
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
               @elem{以@bold{@litchar{?}}结尾}
               "指示出参"
               "出参是布尔值"
               @elem{@racket[空?]}
               )
               (list
               @elem{以@bold{@litchar{!}}结尾}
               @elem{对入参数据做出了直接修改（通@bold{@litchar{扌}}）}
               "无出参"
               @elem{@racket[􏿰􏾘!]、@racket[􏿰𠛮!]}
               )
               (list
               @elem{以@bold{@litchar{~}}结尾}
               "减轻力度"
               "出参内容更加贫瘠"
               @elem{@racket[􏹊~]、@racket[􏹇~]}
               )

               @; (list
               @; @elem{以@bold{@litchar{v}}结尾}
               @; @elem{加强力度（且改变出参成@racket[􏿴]）}
               @; @elem{出参内容更加丰富且被封装成@racket[􏿴]数据结构}
               @; @elem{@racket[引v]}
               @; )
               (list
               @elem{以@bold{@litchar{^}}结尾}
               @elem{加强力度（通过改变入参成@racket[􏿴]）}
               @elem{入参内容更加丰富且被封装进@racket[􏿴]数据结构}
               @elem{@racket[􏹊^]、@racket[伄^]}
               )

               (list
               @elem{以@bold{@litchar{/}}符号分割}
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
               @elem{以@bold{@litchar{分}}结尾}
               "分离成复值"
               @elem{出参数据为复值}
               @elem{@racket[􏾺分]、@racket[𨚞分]、@racket[䢼分]、@racket[􏷳分]、@racket[􏹈分]}
               )

               @; (list
               @; @elem{以@litchar{􏿴}结尾}
               @; @elem{构造生成@racket[􏿴]数据}
               @; @elem{出参数据结构是@racket[􏿴]}
               @; @elem{@racket[序􏿴]、@racket[复􏿴]、@racket[𥸬􏿴]}
               @; )

               (list
               @elem{以@bold{@litchar{化}}结尾}
               @elem{类型转换}
               @elem{出参数据内容不变而类型作小幅度改变}
               @elem{@racket[􏻼化]、@racket[􏽀化]、@racket[􏽁化]}
               )
               (list
               @elem{以@bold{@litchar{化}}联结}
               @elem{类型转换}
               @elem{出参数据内容不变而类型改变}
               @elem{@racket[􏻿化􏿴]、@racket[􏿴化􏻿]}
               )
         )
         ]


@section[#:tag "word creating rules"]{混合}
@tabular[@;#:sep @hspace[0]
         #:style 'boxed
         #:column-properties '(center)
         #:row-properties '(border)

         (list (list @bold{规则} @bold{含义} @bold{进出参} @bold{举例})
               (list
               @elem{以@bold{@litchar{𰅡}}结尾}
               @elem{类型不变，数据内容直接被修改转换}
               @elem{出参数据内容不变而类型作小幅度改变}
               @elem{@racket[􏼅𰅡]}
               )
               (list
               @elem{包含@bold{@litchar{/入}}}
               "进参为函数"
               @elem{进参并非常规数据，而是函数}
               @elem{@racket[弓/入]、@racket[𰁣/入]、@racket[攸/入]、@racket[􏾺/入]、@racket[𨚞/入]}
               )
         )
         ]