#lang at-exp s-exp "../../../private/mapping-lang.rkt"


>>> string? 句? ; keyword 勾 ; symbol 勺
>>> string 句 "创建一个内容可变的字符串数据结构" ;; TODO: create all the procedures started with 易 to 坚
>>> make-string 􏼅 @elem{构造内容是若干个相同元素的@racket[句]} ;复句
>>> string->immutable-string 􏽁化 @elem{把@racket[􏽀]转变为@racket[􏽁]}
>>> string-length 􏺕 "句的长度"  ;􏼬 句巨
>>> string-ref 􏼭 "返回句的第N个元素（从0算起）" ; 句弔
>>> string-set! 􏼘 @elem{直接修改原始数据第N处字（从0算起）为某字} ;句􏾩 敂! 拘
>>> substring 句􏾝 @elem{返回句第N到M处内容组成的@racket[􏽀]} ;邭 句􏾝
>>> string-copy 􏽀化 @elem{把@elem{􏽁}转化为@elem{􏽀}}
>>> string-copy! 􏼘/以􏾝 @elem{从第N处字（从0算起）开始做覆盖（以另一个句的@racket[句􏾝]结果为内容）} ;句􏾩/以􏾝
>>> string-fill! 􏼅𰅡 "把句的内容全部变成某一个重复的字" ; 句㙏! 句复! 𰅡 𢪎 􏼗化! 􏼗𰅡 􏼗𢪎  􏼗 􏼖
>>> string-append 􏼃 @elem{把很多句连成一个@racket[􏽀]} ; 贯句 􏼱
>>> string-append-immutable 􏼁 @elem{把很多句连成一个@racket[􏽁]} ; 􏼯

>>> string->list 􏼳 @elem{句化字􏿴：把@racket[句]转化为@racket[􏿴]（由@racket[字]组成）} ;句化􏿴
>>> list->string 􏼲 @elem{字􏿴化句：把@racket[􏿴]（由@racket[字]组成）转化为@racket[句]} ; 􏿴化句
>>> build-string 􏼄 @elem{构造内容是一系列序数转化成@racket{字}所组成的@racket[句]} ; 序句 􏼔
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

>>> string-upcase 􏺔 @elem{将句大写化} ;􏼨
>>> string-downcase 􏺓 @elem{将句小写化} ;􏼧
>>> string-titlecase 􏺒 @elem{将句中单词首字母大写化其余小写化} ;􏺒
>>> string-foldcase 􏺓* @elem{将句中单词做CaseFolding处理} ;
