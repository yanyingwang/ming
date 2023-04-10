#lang at-exp s-exp "../../../private/mapping-lang.rkt"


>>> vector 􏿲 @elem{构造数组类型的数据}
>>> vector? 􏿲? @elem{是否是@racket[􏿲]}
>>> make-vector 复􏿲 @elem{构造复@racket[􏿲]（数据内各个元素是相同的，类比（昆虫）“复眼”一词取名）}
>>> vector-immutable 贞􏿲 @elem{构造@racket[贞?]􏿲} ;; 贞􏿲 坚􏿲
>>> vector-length 􏿲度 @elem{返回􏿲的长度}
>>> vector-ref 􏿲弔 @elem{返回􏿲的某索引处的元素}
>>> vector-set! 􏿲攸! @elem{修改􏿲某索引处的元素为新值}
>>> vector*-length vector*-length
>>> vector*-ref vector*-ref
>>> vector*-set! vector*-set!
>>> vector-cas! vector-cas!
>>> vector->list 􏿲化􏿴 @elem{将@racket[􏿲]数据转化为@racket[􏿲]} ; 􏿲->􏿴
>>> list->vector 􏿴化􏿲 @elem{将@racket[􏿲]数据转化为@racket[􏿲]}
>>> vector->immutable-vector  􏿲贞化 @elem{将@racket[􏿲]数据转化为@racket[贞􏿲]数据} ;􏿲坚化 坚化/􏿲  􏿲->贞􏿲
>>> vector-fill! 􏿲复化! @elem{将@racket[􏿲]数据转化为@racket[复􏿲]数据}
>>> vector-copy! 􏿲攸!/以􏾝 @elem{从本􏿲的第N处索引的数值开始做修改（以另一个􏿲的@racket[􏿲􏾝]为内容）} ; 􏾝
>>> vector->values 􏿲􏾝化殖 @elem{将@racket[􏿲]数据转化为@racket[殖]数据}
>>> build-vector 序􏿲 @elem{构造序@racket[􏿲]（数据内部的各个个元素是按照一定次序排列的）}
