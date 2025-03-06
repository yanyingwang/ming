#lang scribble/manual

@(require (for-label racket ming ming/list ming/vector ming/hash ming/string)
           scribble/eval
           ming/scribble
           )
@(define the-eval
         (make-eval-factory '(ming/racket/base ming/racket/string ming/string)))


@(require (file "../../private/scribble-styles/css/ming-fonts.css.rkt"))
@css/ming-fonts
@(require scribble-rainbow-delimiters)
@script/rainbow-delimiters*


@title[#:tag "string"]{句}
Originates from @secref["strings" #:doc '(lib "scribblings/reference/reference.scrbl")] and extends to @secref["ming-string"].


@section[#:tag "overall-of-string"]{Overall}
@defideogr[勹 "introduce a specific data type" "勹" "wrap, wrapper"]{
Imagines it as a data spaces where specific content.
@ideoexamples[@zis[句 􏷂 􏶿]]
}


@section{句 􏽀 􏽁, 句? 􏽀? 􏽁?, 􏼟?}
@eleph-note{@zi[􏷂] @zi[􏶿]}
@eleph-note{@zi[􏽀] @zi[􏽁]}

@defideogr[句 (勹 口) "string, introduce a string data type" "句" "sentences"]{
@zi[勹] introduces a space of a specific data type, where the inside @zi[口] doesn't have a specific meaning, it is just a placehold to distinguish it between @zi[􏷂] or @zi[􏶿]. All of the three characters are similar data types, this is also the reason they share @zi[勹].
@ideoexamples[@rackets[句? 句化􏿴 􏿴化句]]
}
@nested[#:style 'inset]{
@defideogr[句B (句 B) "output type is string" #f #f]{
@ideoexamples[@rackets[􏽀 􏼅 􏼄 􏼃 􏼂]]
}
@defideogr[句L (句 L) "input type is string" #f #f]{
@ideoexamples[@rackets[􏺕 􏼭 􏶐 􏶊 􏶋 邭 􏶉 􏶈 􏶇 􏶆 􏼸? 􏼹?]]
}
@defideogr[句R (句 R) "output type is string" #f #f]{
@; @ideoexamples[􏶑]
}
}


@examples[#:eval (the-eval)
(句 #\T #\h #\i #\s #\I #\s #\S #\t #\r #\i #\n #\g)
(句? (句 #\T #\h #\i #\s #\I #\s #\S #\t #\r #\i #\n #\g))
(􏽀? (句 #\T #\h #\i #\s #\I #\s #\S #\t #\r #\i #\n #\g))
(􏽁? (句 #\T #\h #\i #\s #\I #\s #\S #\t #\r #\i #\n #\g))
(􏽁? "ThisIsString")
(句? "ThisIsString")
(􏼟? "ThisIsString")
(􏼟? "")
]

@section{􏽁化 􏽀化}
@examples[#:eval (the-eval)
(􏽁? (􏽁化 (句 #\T #\h #\i #\s #\I #\s #\S #\t #\r #\i #\n #\g)))
(􏽀? (􏽀化 "ThisIsString"))
]

@section{􏼅, 􏼄}
@eleph-note{@racket[􏼓] @racket[􏼎]}
@defideogr[􏼅 (三 句B) "generate string of duplicated elements" #f #f]
@defideogr[􏼄 (弓 句B) "generate string of index like elements" #f #f]
@examples[#:eval (the-eval)
(􏼅 5 #\t)
(􏼄 5 米化句)
]

@section{􏼃, 􏼁, 􏼂}
@eleph-note{@racket[􏿝] @racket[􏿜]}
@defideogr[􏼃 (毌 句B) "appended string" #f #f]
@defideogr[􏼂 (毌 又 句B) #f #f #f]{
Appends strings with last input being @racket[􏿴] type.
}
@defideogr[􏼁 (山 􏼃) "immutable appended string" #f #f]

@examples[#:eval (the-eval)
(􏼃 "AAA" "BBB" "CCC")
(􏼁 "AAA" "BBB" "CCC")
(􏼂 "AAA" "BBB" '("CCC" "DDD"))
(􏽁? (􏼃 "AAA" "BBB" "CCC"))
(􏽁? (􏼁 "AAA" "BBB" "CCC"))
(􏽁? (􏼂 "AAA" "BBB" '("CCC" "DDD")))
]

@section{􏺕, 􏼭, 邭}
@eleph-note{@racket[巨]  @racket[弔]  @racket[􏾝] @racket[􏻿􏾝]}
@eleph-note{@zi[邭] is short for @litchar{句􏾝}}
@defideogr[􏺕 (句 巨) "measure string length" #f #f]
@defideogr[􏼭 (句 弔) "refers a specific element of string" #f #f]
@defideogr[邭 (句 阝) "substring" #f #f]
@examples[#:eval (the-eval)
(􏺕 "ThisIsString")
(􏼭 "ThisIsString" 3)
(邭 "ThisIsString" 3)
(邭 "ThisIsString" 3 8)
]


@section{􏼘, 􏼘/以􏾝, 􏼅𰅡}
@; @bold{@litchar{拘}为古活字} @linebreak{}
@; @bold{@litchar{􏼿}为古活字}
@defideogr[􏼘 (扌 句 攵) "directly change string" #f #f]
@; @bold{@litchar{邭}为古活字} @linebreak{}
@; @margin-note{另见：@racket[􏼅], @racket[邭]}
@eleph-note{@racket[􏼅] @racket[攸] @racket[􏻿􏾩] @racket[􏿰􏾩] @racket[􏻿􏾩/以􏾝]}
@examples[#:eval (the-eval)
(名 str (句 #\T #\h #\i #\s #\I #\s #\S #\t #\r #\i #\n #\g))

(􏼘 str 1 #\H)
str

(􏼘/以􏾝 str 0 "ABCDEFG" 2 4)
str

(􏼅𰅡 str #\Z)
str
]

@section{􏿴􏵷句 句􏵸􏿴 句化􏿴 􏿴化句}
@examples[#:eval (the-eval)
(􏿴􏵷句 '("This" "Is" "String"))
(􏿴􏵷句 '("This" "Is" "String") "")
(􏿴􏵷句 '("This" "Is" "String") "-")

(句􏵸􏿴 "This Is String")
(句􏵸􏿴 "This Is String" "")
(句􏵸􏿴 "This Is String" " ")
(句􏵸􏿴 "This-Is-String" "-")

(句化􏿴 "ThisIsString")
(􏿴化句 '(#\T #\h #\i #\s #\I #\s #\S #\t #\r #\i #\n #\g))
]


@section{􏶐, 􏶊, 􏶋}
@; resembles @zi[敂].
@defideogr[􏶐 (句 㚘) #f #f #f]
@defideogr[􏶊 (句 𡯂) #f #f #f]
@defideogr[􏶋 (句 正) #f #f #f]
@examples[#:eval (the-eval)
(􏶐 "ThisIsString" "Is" "Isnot")
(􏶊 "\n\r this is string \n\r\n")
(􏶊 "---this--is--string---" "-" #:repeat? #t) 89
(􏶋 "\n\rthis  is  \n\r string \n\r\n")
(􏶋 "---this--is--string---" "-" "+" #:repeat? #t #:trim? #f)
]

@section{􏼹?, 􏼸?, 邭?}
@eleph-note{@racket[邭]}
@; @bold{@litchar{􏼢}为新造字}
@defideogr[􏼹 (句 本) #f #f #f]
@defideogr[􏼸 (句 末) #f #f #f]

@examples[#:eval (the-eval)
(􏼹? "ThisIsString" "Thi")
(􏼸? "ThisIsString" "ing")

(邭? "ThisIsString" "sIs")
(邭? "ThisIsString" "Thi")
(邭? "ThisIsString" "ing")
]

@section{􏶉 􏶈 􏶇 􏶆}
@defzi[􏶉]{@zi[句] + @litchar{AA}.}
@defzi[􏶈]{@zi[句] + @litchar{aa}.}
@defzi[􏶇]{@zi[句] + @litchar{Aa}.}
@defzi[􏶆]{@zi[句] + (@litchar{ß} -> @litchar{ss}).}
@defzi[􏶅]{@zi[句] + (@litchar{a} in @litchar{A}).}
@examples[#:eval (the-eval)
(􏶉 "string upper case")
(􏶈 "string lower case")
(􏶇 "string title case")
(􏶆 "ßtring fold case")
]

@section[#:tag "string-base"]{ming/racket/base}
@defmapping[racket/base/string]
@defmodule[ming/racket/base]

@section[#:tag "string-additional"]{ming/racket/string}
@defmodule[ming/racket/string]

@defmapping[racket/string]
