#lang at-exp s-exp "../../../private/mapping-lang.rkt"


>>> hash 􏿰 @elem{创建@racket[􏾌]}
>>> hashalw 􏾋 @elem{类上，不过键的唯一性是通过@racket[􏾗?]确立的} ; 􏾱􏿱
>>> hasheqv 􏾊 @elem{类上，不过键的唯一性是通过@racket[􏾃?]确立的}; 􏾪􏿱 􏾰􏿱 􏾭 􏾫
>>> hasheq 􏾉 @elem{类上，不过键的唯一性是通过@racket[侗?]确立的}; 􏾯􏿱

>>> hash? 􏿰? @elem{是否是@racket[􏾌]、@racket[􏾋]、@racket[􏾊]、@racket[􏾉]的任一种}
>>> hash-equal? 􏾌? @elem{是否是@racket[􏾌]}
>>> hash-equal-always? 􏾋? @elem{是否是@racket[􏾋]}
>>> hash-eqv? 􏾊? @elem{是否是@racket[􏾊]}
>>> hash-eq? 􏾉? @elem{是否是@racket[􏾉]}

>>> hash-strong? 􏾎? @elem{类上，键是否是被刚性存储的} ; 刚 强
>>> hash-weak? 􏾏? @elem{类上，键是否是被柔性存储的}; 柔
>>> hash-ephemeron? 􏾈? @elem{类上，键的存储是否是采用@racket[􏾧]}

>>> make-hash 􏿰^ @elem{@racket[􏿳]转换成@racket[􏾑]}
>>> make-hashalw 􏾋^ @elem{@racket[􏿳]转换成@racket[􏾑]}
>>> make-hasheqv 􏾊^ @elem{@racket[􏿳]转换成@racket[􏾑]}
>>> make-hasheq 􏾉^ @elem{@racket[􏿳]转换成@racket[􏾑]}

>>> make-immutable-hash 􏾐^ @elem{如上类推}
>>> make-immutable-hashalw 􏾆^ @elem{如上类推}
>>> make-immutable-hasheqv 􏾅^ @elem{如上类推}
>>> make-immutable-hasheq 􏾄^ @elem{如上类推}

>>> make-weak-hash 􏾏^ @elem{如上类推}
>>> make-weak-hashalw 􏾁^ @elem{如上类推}
>>> make-weak-hasheqv 􏾀^ @elem{如上类推}
>>> make-weak-hasheq 􏽿^ @elem{如上类推}

>>> make-ephemeron-hash 􏾈^ @elem{如上类推}
>>> make-ephemeron-hashalw 􏽽^ @elem{如上类推}
>>> make-ephemeron-hasheqv 􏽼^ @elem{如上类推}
>>> make-ephemeron-hasheq 􏽻^ @elem{如上类推}


>>> hash-set 􏿰攸
>>> hash-set! 􏿰攸!
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

>>> hash-map 􏿰佫

>>> hash-keys 􏿱->日􏿴
>>> hash-values 􏿱->月􏿴

>>> hash->list 􏿰化􏿳

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
