#lang at-exp s-exp "../../../private/mapping-lang.rkt"


>>> hash? 􏿱? @elem{是否是@racket[􏿱]数据结构}
>>> hash-equal? 􏿱/同? @elem{是否是@racket[􏿱]数据结构（且键的比较采用的是@racket[同?]）}
>>> hash-equal-always? 􏿱/􏾬? @elem{与上同，不过键的比较采用的是@racket[􏾬?]}
>>> hash-eqv? 􏿱/粡? @elem{与上同，不过键的比较采用的是@racket[粡?]}
>>> hash-eq? 􏿱/侗? @elem{与上同，不过键的比较采用的是@racket[侗?]}
>>> hash-strong? 􏿱/刚? @elem{与上同，不过键是被刚性存储的} ; 刚 强
>>> hash-weak? 􏿱/柔? @elem{与上同，不过键是被柔性存储的}; 柔
>>> hash-ephemeron? 􏿱/􏾧? @elem{与上同，不过键的存储采用@racket[􏾧]}

>>> hash 􏿱 @elem{创建数据（且键的比较采用的是@racket[同?]）}
>>> hashalw 􏿱/􏾬 @elem{与上同，不过键的比较采用的是@racket[􏾬?]} ; 􏾱􏿱
>>> hasheqv 􏿱/粡 @elem{与上同，不过键的比较采用的是@racket[粡?]}; 􏾪􏿱 􏾰􏿱 􏾭 􏾫
>>> hasheq 􏿱/侗 @elem{与上同，不过键的比较采用的是@racket[侗?]}; 􏾯􏿱

>>> make-immutable-hash 􏿳->􏿱 @elem{转换生成@racket[􏿱]数据（且键的比较采用的是@racket[同?]）}
>>> make-immutable-hashalw 􏿳->􏿱/􏾬 @elem{与上同，不过键的比较采用的是@racket[􏾬?]}
>>> make-immutable-hasheqv 􏿳->􏿱/粡 @elem{与上同，不过键的比较采用的是@racket[粡?]}
>>> make-immutable-hasheq 􏿳->􏿱/侗 @elem{与上同，不过键的比较采用的是@racket[侗?]}

>>> make-hash 􏿳->􏿱/易 @elem{与@racket[􏿳->􏿱]同，不过生成的是“易”（可变的，即@code{(非 坚?)}）数据}
>>> make-hashalw 􏿳->􏿱/􏾬/易 @elem{与上同，不过键的比较采用的是@racket[􏾬?]}
>>> make-hasheqv 􏿳->􏿱/粡/易 @elem{与上同，不过键的比较采用的是@racket[粡?]}
>>> make-hasheq 􏿳->􏿱/侗/易 @elem{与上同，不过键的比较采用的是@racket[侗?]}

>>> make-weak-hash 􏿳->􏿱/柔 @elem{与@racket[􏿳->􏿱]同，不过另有特性@code{􏿱/柔?}}
>>> make-weak-hashalw 􏿳->􏿱/􏾬/柔 @elem{与上同，不过键的比较采用的是@racket[􏾬?]}
>>> make-weak-hasheqv 􏿳->􏿱/粡/柔 @elem{与上同，不过键的比较采用的是@racket[粡?]}
>>> make-weak-hasheq 􏿳->􏿱/侗/柔 @elem{与上同，不过键的比较采用的是@racket[侗?]}

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

>>> hash->list 􏿱->􏿳

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
