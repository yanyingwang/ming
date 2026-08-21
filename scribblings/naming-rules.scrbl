#lang scribble/manual

@(require (for-label racket ming ming/list ming/vector ming/hash ming/string)
           scribble/example
           ming/scribble
           scribble-rainbow-delimiters)
@(define the-eval
         (make-eval-factory '(racket/base racket/list ming/racket/base ming/racket/list)))

@(require (file "../private/scribble-styles/css/ming-fonts.css.rkt"))
@css/ming-fonts
@(require scribble-rainbow-delimiters)
@script/rainbow-delimiters*

@title[#:tag "naming-rules"]{Naming Rules}


@section[#:tag "character-rules"]{Characters}
@margin-note{You may need to read @secref["character-implications"] first.}


@tabular[@;#:sep @hspace[0]
         #:style 'boxed
         #:column-properties '(center)
         #:row-properties '(border)
         (list (list @bold{Part} @bold{Connotation} @bold{Elucidation} @bold{Example})
               (list
               @elem{@bold{@litchar{亻}}}
               "general subset"
               @elem{The type of output data is same as input, content is part of input.}
               @elem{@code{伄 攸 𰂋 偏 􏾜 􏾛 偅 𠆯 􏹈}}
               )

               (list
               @elem{@bold{@litchar{阝}}}
               "serial subset"
               @elem{The type of output data is same as input, content is a serial part of input.}
               @elem{@code{阴 阳 􏾝 􏾺 􏴌 䢼 􏹋 邭}}
               )

               (list
               @elem{@bold{@litchar{刂}}}
               "broken subset"
               @elem{The type of output data is same as input, content is almost same, except some elements are removed.}
               @elem{@code{􏷵 􏷴 􏺊 𠝤 􏹇 􏹊}}
               )

               (list
               @elem{@bold{@litchar{彐}}}
               "find"
               @elem{Simplifies from @litchar{寻}, which means @italic{find}.}
               @elem{@code{􏹋 􏹉 􏹊 􏹅 􏹌 􏹈 􏹇 􏺗 􏺘}}
               )

               @; (list
               @; @elem{@bold{@litchar{刀}}}
               @; "修改"
               @; @elem{}
               @; @elem{@racket[􏻏]}
               @; )

               (list
               @elem{@bold{@litchar{戈}}}
               "substitute"
               @elem{Means @italic{substitute}.}
               @elem{@racket[􏶐]}
               )

               @; (list
               @; @elem{@bold{@litchar{匕}}}
               @; @elem{小幅度的修改}
               @; @elem{}
               @; @elem{@racket[􏶊]、@racket[􏺚]、@racket[􏺽]、@racket[􏺾]}
               @; )

               (list
               @elem{@bold{@litchar{土 }}}
               "produce"
               @elem{Means @italic{create, build, produce}.}
               @elem{@racket[垎]}
               )

               (list
               @elem{@bold{@litchar{扌}}}
               @elem{Same as usage of @bold{@litchar{!}}}
               @elem{Means @italic{directly modify the original data instead of creating new one}, thus the output is void.}
               @elem{@code{􏻿􏾩 􏼘 􏻿􏽒 􏻺𰅡}}
               )

               (list
               @elem{@bold{@litchar{攵}}}
               "modify"
               @elem{Means @italic{modify value corresponding to specified index}, thus inputs are @italic{index number} and @italic{expected value}.}
               @elem{@code{攸 􏼘}}
               )

               (list
               @elem{@bold{@litchar{三}}}
               "duplicated elements"
               @elem{Means @italic{three}, especially means @italic{duplicated elments}.}
               @elem{@code{􏼓 􏻺 􏼅}}
               )

               (list
               @elem{@bold{@litchar{弓}}}
               "index"
               @elem{Means @italic{index}(ref to @racket[弓]), especially means @italic{a range of numbers}.}
               @elem{@code{􏼎 􏻻 􏼄}}
               )
               (list
               @elem{@bold{@litchar{弔}}}
               "value of index"
               @elem{Means @italic{Returns corresponding vaule of index}, thus the type of input data is @racket[􏺡?].}
               @elem{@code{弔 伄 􏾘 􏾝 􏼭 􏻿弔 􏿰弔 􏿰􏾘}}
               )
               
               (list
               @elem{@bold{@litchar{毌}}}
               "append"
               @elem{Simplifies from @litchar{贯}, which means @italic{append}.}
               @elem{@code{􏿝 􏻹 􏼃 􏼂 􏼁}}
               )

               (list
               @elem{@bold{@litchar{穴}}}
               "empty"
               @elem{Simplifies from @litchar{空}, means @italic{empty}.}
               @elem{@code{空? 𥥪? 􏻸? 􏻵? 􏻷? 􏼟?}}
               )

               (list
               @elem{@bold{@litchar{非}}}
               "not"
               @elem{Means @italic{not}.}
               @elem{@code{􏼟?}}
               )


               (list
               @elem{@bold{@litchar{巨}}}
               "length"
               @elem{Means @italic{return the length}.}
               @elem{@code{巨 􏺕 􏻿巨 􏿰巨}}
               )

               (list
               @elem{@bold{@litchar{米}}}
               "number"
               @elem{Simplifies from @litchar{数}, which means @italic{number}.}
               @elem{@code{􏼏 米? 𥥪? 夈? 粊? 􏻛? 􏺧? 􏽊}}
               )

               @; (list
               @; @elem{@bold{@litchar{山}}}
               @; @elem{稳定的、内容不变的（见：@racket[固?]）}
               @; @elem{无}
               @; @elem{@racket[􏻼]、@racket[􏾐]、@racket[􏽁]}
               @; )

               @; (list
               @; @elem{@bold{@litchar{氵}}}
               @; @elem{易动的、内容可变的（见：@racket[易?]）}
               @; @elem{无}
               @; @elem{@racket[􏻽]、@racket[􏾑]、@racket[􏽀]}
               @; )
         )
         ]


@section[#:tag "punctuation-rules"]{Punctuations}
@tabular[@;#:sep @hspace[0]
         #:style 'boxed
         #:column-properties '(center)
         #:row-properties '(border)
         (list (list @bold{Rule} @bold{Connotation} @bold{Elucidation} @bold{Example})
               (list
               @elem{suffix @bold{@litchar{?}}}
               "boolean as output"
               "Is or not is. the output is boolean."
               @elem{@code{空? 𥥪?}}
               )
               (list
               @elem{suffix @bold{@litchar{!}}}
                @elem{same as usage of @bold{@litchar{攵}}}
               @elem{Means @italic{directly modify the original data instead of creating new one}, thus the output is void.}
               @elem{@code{􏿰􏾘! 􏿰𠛮!}}
               )
               (list
               @elem{suffix @bold{@litchar{~}}}
               "softly"
               "Immediately returns result once meet the request."
               @elem{@code{􏹊~ 􏹇~}}
               )

               @; (list
               @; @elem{以@bold{@litchar{v}}结尾}
               @; @elem{加强力度（且改变出参成@racket[􏿴]）}
               @; @elem{出参内容更加丰富且被封装成@racket[􏿴]数据结构}
               @; @elem{@racket[引v]}
               @; )
               (list
               @elem{suffix @bold{@litchar{^}}}
               "list as input"
               @elem{The type of input data is list}
               @elem{@code{􏹊^ 伄^}}
               )
               (list
               @elem{suffix @bold{@litchar{+}}}
               "same type objects as input"
               @elem{"more than one same type objects as input" }
               @elem{@code{􏿰攸+ 􏿰􏾩+}}
               )

               (list
               @elem{include @bold{@litchar{/}}}
               @elem{Of}
               @elem{output is determinated by prefix of @litchar{/}}
               @elem{@code{􏿴/组合 􏿴/分组}}
               )
         )
         ]

@section[#:tag "word-rules"]{Words}

@tabular[@;#:sep @hspace[0]
         #:style 'boxed
         #:column-properties '(center)
         #:row-properties '(border)
         (list (list @bold{Rule} @bold{Connotation} @bold{Elucidation} @bold{Example})
               (list
               @elem{suffix @bold{@litchar{分}}}
               "splits data"
               "Splits input data, and output them in values type."
               @elem{@racket[􏾺分]、@racket[􏴌分]、@racket[䢼分]、@racket[􏷳分]、@racket[􏹈分]}
               )

               @; (list
               @; @elem{以@litchar{􏿴}结尾}
               @; @elem{构造生成@racket[􏿴]数据}
               @; @elem{出参数据结构是@racket[􏿴]}
               @; @elem{@racket[序􏿴]、@racket[复􏿴]、@racket[𥸬􏿴]}
               @; )

               
         )
         ]


@section[#:tag "hybrid-rules"]{Hybrids}
@tabular[@;#:sep @hspace[0]
         #:style 'boxed
         #:column-properties '(center)
         #:row-properties '(border)

         (list (list @bold{Rule} @bold{Connotation} @bold{Elucidation} @bold{Example})
               (list
               @elem{suffix @bold{@litchar{𰅡}}}
               @elem{directly attribute convert}
               @elem{Directly convert attribute of data with modifying the orignal data.}
               @elem{@racket[􏼅𰅡]}
               )
               (list
               @elem{include @bold{@litchar{/入}}}
               "Function as input"
               @elem{Means Type of input data is procedure.}
               @elem{@code{弓/入 𰁣/入 攸/入 􏾺/入 􏴌/入}}
               )
         )
         ]

