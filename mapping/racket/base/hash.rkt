#lang at-exp s-exp "../../../private/mapping-lang.rkt"


>>> hash 􏿱 @elem{创建数据（且键的比较采用的是@racket[同?]）}
>>> hashalw 􏾔 @elem{与上同，不过键的比较采用的是@racket[􏾗?]} ; 􏾱􏿱
>>> hasheqv 􏾒 @elem{与上同，不过键的比较采用的是@racket[􏾕?]}; 􏾪􏿱 􏾰􏿱 􏾭 􏾫
>>> hasheq 􏾓 @elem{与上同，不过键的比较采用的是@racket[侗?]}; 􏾯􏿱

>>> hash? 􏿱~? @elem{是否是@racket[􏿱]、@racket[􏾔]、@racket[􏾒]、@racket[􏾓]的任一种}
>>> hash-equal? 􏿱? @elem{是否是@racket[􏿱]}
>>> hash-equal-always? 􏾔? @elem{是否是@racket[􏾔]}
>>> hash-eqv? 􏾒? @elem{是否是@racket[􏾒]}
>>> hash-eq? 􏾓? @elem{是否是@racket[􏾓]}

>>> hash-strong? 刚􏿱~? @elem{与上同，不过键是被刚性存储的} ; 刚 强
>>> hash-weak? 柔􏿱~? @elem{与上同，不过键是被柔性存储的}; 柔
>>> hash-ephemeron? 􏾧􏿱~? @elem{与上同，不过键的存储采用@racket[􏾧]}

>>> make-immutable-hash 􏿳化􏿱 @elem{@racket[􏿳]转换成@racket[􏿱]}
>>> make-immutable-hashalw 􏿳化􏾔 @elem{@racket[􏿳]转换成@racket[􏾔]}
>>> make-immutable-hasheqv 􏿳化􏾒 @elem{@racket[􏿳]转换成@racket[􏾒]}
>>> make-immutable-hasheq 􏿳化􏾓 @elem{@racket[􏿳]转换成@racket[􏾓]}

>>> make-hash 􏿳化易􏿱 @elem{@racket[􏿳]转换成@racket[易?]@racket[􏿱]}
>>> make-hashalw 􏿳化易􏾔 @elem{@racket[􏿳]转换成@racket[易?]@racket[􏾔]}
>>> make-hasheqv 􏿳化易􏾒 @elem{@racket[􏿳]转换成@racket[易?]@racket[􏾒]}
>>> make-hasheq 􏿳化易􏾓 @elem{@racket[􏿳]转换成@racket[易?]@racket[􏾓]}

>>> make-weak-hash 􏿳化柔􏿱 @elem{@racket[􏿳]转换成@racket[柔?]@racket[􏿱]}
>>> make-weak-hashalw 􏿳化柔􏾔 @elem{@racket[􏿳]转换成@racket[柔?]@racket[􏾔]}
>>> make-weak-hasheqv 􏿳化柔􏾒 @elem{@racket[􏿳]转换成@racket[柔?]@racket[􏾒]}
>>> make-weak-hasheq 􏿳化柔􏾓 @elem{@racket[􏿳]转换成@racket[柔?]@racket[􏾓]}

>>> hash-set 􏿱􏾩
>>> hash-set! 􏿱􏾩!
;; >>> hash-set*! 􏿱􏾩*!

>>> hash-ref 􏿱抇 @elem{对于每一个@racket[􏿱]，以其“明”中“阳”位数据为基准，来索引查询“阴”位数据并返回；}
>>> hash-ref-key 􏿱抈 @elem{对于每一个@racket[􏿱]，以其“明”中“阴”位数据为基准，来索引查询“阳”位数据并返回；}

>>> hash-ref! 􏿱抇/􏾩!
>>> hash-has-key? 􏿱抇?

>>> hash-update 􏿱􏾩/入
>>> hash-update! 􏿱􏾩!/入

>>> hash-remove! 􏿱删!
>>> hash-remove 􏿱删

>>> hash-clear! 􏿱清!
>>> hash-clear 􏿱清
>>> hash-copy-clear 􏿱清/复制

>>> hash-map 􏿱𮞑
>>> hash-map 􏿱𮞑/复

>>> hash-keys 􏿱->日􏿴
>>> hash-values 􏿱->月􏿴

>>> hash->list 􏿱化􏿳

>>> hash-keys-subset? 􏿱键􏿴?/共
>>> hash-for-each 􏿱各
>>> hash-count 􏿱度
>>> hash-iterate-first 􏿱迭首
>>> hash-iterate-next 􏿱迭继
>>> hash-iterate-key 􏿱迭键
>>> hash-iterate-value 􏿱迭值
>>> hash-iterate-pair 􏿱迭双
>>> hash-iterate-key+value 􏿱迭键值
>>> hash-copy 􏿱复制
