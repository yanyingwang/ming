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

@title[#:tag "general-ideographs"]{General Ideographs}


@; @section[#:tag "as-parts"]{As parts of another character}
@; @tech[#:doc "naming-rules"]


@defideogr[(亻) "general subset" "亻" "person, people, human"]{
As component of ideographs, it implies The type of output data is same as the input. And the elements of output data are part of the input.
In particular, @zi[化] is exceptionally different, which has a more diverse usages scenarios, @zi[化IFX], @zi[化SFX].
Note that, if the procedure name has another ideograph prefix it as a word, the input and output type is determinated by the prefix ideographs, e.g., @rackets[􏻿𢪛 􏿰攸 􏻿弔 􏿰弔 􏻿巨 􏿰巨].
@ideoexamples[@zis[伄 攸 𰂋 偏 􏾜 􏾛 偅 𠆯 􏹈]]
}

@defideogr[(阝) "serial subset" "阝" "hill"]{
As component of ideographs, it implies The type of output data is same as the input. And the elements of ouput data is a serial of successive elements of the input.
@ideoexamples[@rackets[􏾝 􏾺 𨚞 􏹋]]
}


@defideogr[(刂) "broken subset" "刂" "knife"]{
Returns a new list as output with removing some elements from the input list.
@ideoexamples[@rackets[􏷵 􏷴 􏺊 􏾘 􏹊 􏹇 𠝤]]
}

@defideogr[(L R B T) #f #f #f]{
Are Shot for: Left, Right, Bottom, Top. Those characters imply the prefix's position as it composes an ideograph.
}

@defideogr[(LB BR BL) ((L R B T) (L R B T)) "extends the prefix from one position to another" #f #f]{
Means the prefix of it extends from such as Left to Bottom in an ideograph when it composes this ideograph. @linebreak{}
@ideoexamples{@zis[又LB 􏿴BR 􏿫BR]}
}

@defideogr[(PFX SFX IFX) #f #f #f]{
Are Shot for: Prefix, Suffix, Infix. Which imply the position of its prefix as this prefix composes a word. @linebreak{}
@ideoexamples[@zis[化IFX 化SFX]]
}

@defideogr[(RTTa RTTb RTTy RTTz) "rotates the prefix" #f #f]{
Rotates the prefix in 90 or 180 or -90 or -180 degree clockwise.
@ideoexamples{@zi[弔RTTz]}
}

@defideogr[(扌 !) "warning, is changing original data" "手" "hands, handle"]{
Has the same meaning as @litchar{!} like how it is prevalently used in lots of modern programming languages.
When you see this component in ideographs that are used to name procedures, you know it immediately that those procedures will directly modify their input data instead of returning a new one as output. @linebreak{}
@ideoexamples[@rackets[􏻿􏾩 􏻿𢪛 􏻿􏽒 􏻿􏷉 􏼅𰅡]]
}


@defideogr[?SFX (? SFX) "is or is not" #f #f]{
Implies the output is boolean.
@ideoexamples[@rackets[双? 􏿴? 􏿳?]]
}

@eleph-note{@racket[弓*] is similar to @racket[弓] except the process is strengthened.}
@defideogr[*SFX (* SFX) "strengthen" #f #f]{
Almost has the same usage as the one named without @zi[*], except this strengthen the processing of inputted data. Thus the data of output may become longer, and the type may be changed accordingly.
@ideoexamples[@rackets[弓*]]
}


@eleph-note{@racket[􏹊~] is similar to @racket[􏹊] except the process is softened.}
@defideogr[~SFX (~ SFX) "~ as suffix, implies strengthen" #f #f]{
Almost has the same usage as the one named without @zi[~], except this soften the processing of inputted data. Thus the data of output may become shorten.
@ideoexamples[@rackets[􏹊~]]
}

@eleph-note{@racket[􏹊^] is similar to @racket[􏹊] except the input dat is list.}
@defideogr[^SFX (^ SFX) "^ as suffix, implies list as input" #f #f]{
Almost has the same usage as the one named without @zi[^], except that input data is a list.
@ideoexamples[@rackets[􏹊^ 伄^ 􏾘^]]
}


@defideogr[/IFX (/ IFX) "/ as infix, implies extending" #f #f]{
The suffix of it is considered as an extending explanation of the prefix.
@ideoexamples[@rackets[􏷍/组合]]
}

@defideogr[空 "empty" "空" "empty"]
@defideogr[穴 "empty" "穴" "hole"]{
Simplifies from @zi[空], which means @italic{empty}.
@ideoexamples[@rackets[穴 􏻸 􏻷]]
}

@defideogr[山 "immutable" "山" "mountain"]{
@ideoexamples[@rackets[山? 􏻼 􏾐? 􏽁]]
}

@defideogr[(水 氵 𭕄) "mutable" "水" "water"]{
@zi[氵] and @zi[𭕄 ] both are the simplified way to write @zi[水] when used as the component of characters.
@ideoexamples[@rackets[水? 􏻽 􏾑? 􏽀]]
}

@defideogr[毌 "append" "毌" "to pass through, all over"]{
Appends the elements, goes through the elements and connect them as one together. (@zi[毌] is the initial form of modern chinese char @zi-tool{贯}.)
@ideoexamples[@rackets[􏿝 􏼉 􏼃]]
}


@defideogr[攵 "modify value" "攵" "raping over something with hands"]{
Appends the elements, goes through the elements and connect them as one together. (Do not confuse with @zi[夂].)
@ideoexamples[@zis[𰁦 攸 􏾩 𢪛]]
}

@defideogr[(土 􏷪) "produce data" "土" "ground, earth"]{
Processes input data and output a new one in a very different type. Implies the type of output data is not same as input.
@ideoexamples[@rackets[􏷎 𡌶]]
}

@defideogr[巨  "length" "巨" "straightedge, ruler, measure"]{
@ideoexamples[@rackets[巨 􏺕]]
}

@defideogr[本 "start, prefix" "本" "root"]{
@ideoexamples[@rackets[􏼹?]]
}

@defideogr[一 "one" "一" "one"]
@defideogr[二 "two" "二" "two"]
@defideogr[三 "three" "三" "three"]{
Note that, meaning is changed to @italic{duplicated elements} if is used with @zi[􏿴BR]. e.g., @racket[􏼓].
}
@defideogr[四 "four" "四" "four"]
@defideogr[五 "five" "五" "five"]
@defideogr[六 "six" "六" "six"]
@defideogr[七 "seven" "七" "seven"]
@defideogr[八 "eight" "八" "eight"]
@defideogr[九 "nine" "九" "nine"]
@defideogr[十 "ten" "十" "ten"]{
Note that, meaning is changed to @italic{a few of fixed length elements} if is used within @zi[􏻿].
}

@defideogr[末 "end, suffix" "末" "treetop"]{
@ideoexamples[@rackets[山? 􏻼 􏾐? 􏽁]]
}

@defideogr[匕  "convert data type" "匕" "upturned person"]{
Examples: @zi[化] @zi[𰅡] @zi[􏵷] @zi[􏵸]
}

@defideogr[化(亻 匕) "convert data type" "化" "a normal person with a upturned person"]{
convert data type by the way of returning a new one in another type.
}

@defideogr[化IFX (化 IFX) "type conversion" #f #f]{
Convert data from type 1 (as input) to type 2 (as output).
@ideoexamples[@rackets[􏻿化􏿴 􏿴化􏻿]]
}

@defideogr[化SFX (化 SFX) "minorly convert data type" #f #f]{
Converting data With reserving the general data type, e.g., between @zi[山] and @zi[水]. @linebreak{}
In this case, input and output are the same type. @linebreak{}
Which means the content of data may be changed, or it is mutable and immutable before but change to immutable and mutable.
@ideoexamples[@rackets[􏻼化 􏽀化 􏽁化 􏼅𰅡]]
}

@defideogr[(𰅡 𰅡SFX) (扌 匕 SFX) "modify data type" #f #f]{
Converts data type with modifying the original data. (@zi[𰅡SFX] resembles @zi[化SFX].)
@ideoexamples[@rackets[􏼅𰅡]]
}

@defideogr[(􏵸 􏵸IFX) (分 匕 IFX) "split and convert data type" #f #f]{
@elem{
Splits data and return it in a different data type.
@ideoexamples[@rackets[句􏵸􏿴]]
}
}

@defideogr[(􏵷 􏵷IFX) (毌 匕 IFX) "append and convert data type" #f #f]{
@elem{
Appends data and return it in a different data type.
@ideoexamples[@rackets[􏿴􏵷句]]
}
}

@defideogr[㚘 "substitue" "替" "substitute, substitution"]{
To easily write it, it may be also wrote in vertical when as component of another ideograph.
@ideoexamples[@rackets[􏶐]]
}

@defideogr[𡯂 "naked, not sharp" "秃" "bald"]{
A state of an object with removing something from its begining and ending.
@ideoexamples[@rackets[􏶊]]
}


@; @section[#:tag "as-characters"]{As characters of another word}
