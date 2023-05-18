#lang s-exp "../../../private/mapping-lang.rkt"


>>> string? 句? ; keyword 勾 ; symbol 勺
>>> string 句 "创建一个内容可变的字符串数据结构" ;; TODO: create all the procedures started with 易 to 坚
>>> make-string 复句 "创建一个内容可变的字符串数据结构，其内容为N个重复相同的字"
>>> string->immutable-string 􏽁化 @elem{把@racket[􏽀]转变为@racket[􏽁]}
>>> string-length 句度
>>> string-ref 句弔
>>> string-set! 句􏾩 @elem{直接修改原始数据第N处字（从0算起）为某字}
>>> substring 句􏾝 @elem{返回句第N到M处内容组成的@racket[􏽀]}
>>> string-copy 􏽀化 @elem{把@elem{􏽁}转化为@elem{􏽀}}
>>> string-copy! 句􏾩/以􏾝 @elem{从第N处字（从0算起）开始做覆盖（以另一个句的@racket[句􏾝]结果为内容）}
>>> string-fill! 句复! "把句的内容全部变成某一个重复的字" ; 句㙏!
>>> string-append 贯句 @elem{把很多句连成一个@racket[􏽀]}
>>> string-append-immutable 贯􏽁 @elem{把很多句连成一个@racket[􏽁]}

>>> string->list 句化􏿴 @elem{把@racket[句]转化为@racket[􏿴]}
>>> list->string 􏿴化句 @elem{把@racket[􏿴]转化为@racket[句]}
>>> build-string 序句 "生成一个句中每个字都是按照一定的顺序排列的句"
>>> string=? 句=?
>>> string<? 句<?
>>> string<=? 句<=?
>>> string>? 句>?
>>> string>=? 句>=?

>>> string-ci=? 句ci=?
>>> string-ci<? 句ci<?
>>> string-ci<=? 句ci<=?
>>> string-ci>? 句ci>?
>>> string-ci>=? 句ci>=?

>>> string-upcase 句大写化
>>> string-downcase 句小写化
>>> string-titlecase 句标题化
>>> string-foldcase 句标题化*
