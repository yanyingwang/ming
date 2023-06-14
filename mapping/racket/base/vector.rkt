#lang at-exp s-exp "../../../private/mapping-lang.rkt"


>>> vector 􏻿 @elem{与@racket[􏻽]同}
>>> vector? 􏻿? @elem{是否是@racket[􏻿]}
>>> make-vector 􏻺 @elem{构造构造内容是若干而相同元素的@racket[􏻿]}
;; >>> make-vector 复􏻿 @elem{构造复@racket[􏻿]（数据内各个元素是相同的，类比（昆虫）“复眼”一词取名）}
>>> vector-immutable 􏻼 @elem{构造内容不能被修改的数组} ;; 贞􏻿 坚􏻿 定􏻿 固
>>> vector-length 􏻿巨 @elem{返回􏻿的长度} ;􏻿度
>>> vector-ref 􏻿弔 @elem{返回􏻿的某索引处的元素}
>>> vector-set! 􏻿􏾩 @elem{直接修改原数组中某索引处的元素为新值}
>>> vector*-length vector*-length
>>> vector*-ref vector*-ref
>>> vector*-set! vector*-set!
>>> vector-cas! vector-cas!
>>> vector->list 􏻿化􏿴 @elem{将@racket[􏻿]数据转化为@racket[􏻿]} ; 􏻿->􏿴
>>> list->vector 􏿴化􏻿 @elem{将@racket[􏻿]数据转化为@racket[􏻿]}
>>> vector->immutable-vector 􏻼化 @elem{将@racket[􏻽]数据转化为@racket[􏻼]数据} ;􏻿定化 􏻿坚化 坚化/􏻿  􏻿->定􏻿
>>> vector-fill! 􏻺𰅡 @elem{直接修改@racket[􏻿]数据使其转化成@racket[复􏻿]数据} ;􏻿㙏! 􏼊化!
>>> vector-copy! 􏻿􏾩/以􏾝 @elem{从本􏻿的第N处索引的数值开始做修改（以另一个􏻿的@racket[􏻿􏾝]为内容）} ; 􏾝
>>> vector->values 􏻿􏾝化殖 @elem{将@racket[􏻿]数据转化为@racket[殖]数据}
>>> build-vector 􏻻 @elem{构造内容是一系列序数的@racket[􏻿]}
;; >>> build-vector 序􏻿 @elem{构造序@racket[􏻿]（数据内部的各个个元素是按照一定次序排列的）}
