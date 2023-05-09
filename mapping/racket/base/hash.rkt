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

>>> hash-set 􏿰攸 @elem{以新造数据的方式来修改某“键”对应的“值”}
>>> hash-set* 􏿰攸^- @elem{以新造数据的方式来修改某些“键”所对应的“值”}
>>> hash-update 􏿰攸/入 "类上，区别是入参不同"
>>> hash-set! 􏿰􏾩 @elem{直接修改某“键”对应的“值”}
>>> hash-set*! 􏿰􏾩^- @elem{直接修改某些“键”所对应的“值”}
>>> hash-update! 􏿰􏾩/入 "类上，区别是入参不同"

>>> hash-ref 􏿰弔 @elem{以“键值对”中“阳”位数据为基准，来索引查询“键值对”并返回“阴”位数据（未找到数据则返回默认设置值）；} ;􏽚
>>> hash-ref-key 􏿰􏽙 @elem{以“键值对”中“阳”位数据为基准，来索引查询“键值对”并返回“阳”位数据；} ;𦙨
;; >>> hash-ref-key 􏿰弔日 @elem{以“键值对”中“阴”位数据为基准，来索引查询“阳”位数据并返回；} ;𦙨

>>> hash-ref! 􏿰𫼛 @elem{以“键值对”中“阳”位数据为基准，来索引查询“键值对”并返回“阴”位数据（未找到数据则直接修改原数据增加新“键值对”）；}
>>> hash-has-key? 􏿰日? @elem{是否存在某“键”}

>>> hash-remove 􏿰􏾘 @elem{以新造数据的方式来删除某“键”和其对应的“值”}
>>> hash-remove! 􏿰􏽘 @elem{直接删除某“键”和其对应的“值”}

>>> hash-clear 􏿰𠛮 @elem{以新造数据的方式来删除全部“键”和其对应的“值”}
>>> hash-clear! 􏿰􏽗 @elem{直接删除全部“键”和其对应的“值”}

>>> hash-copy-clear 𠛮空􏿰 @elem{以删除全部“键”和其对应的“值”的方式新造空数据}

>>> hash-map 􏿰佫

>>> hash-keys 􏿰阳 @elem{返回􏿰中所有键值对的“键”组成的@elem{􏿴}}
>>> hash-values 􏿰阴 @elem{返回􏿰中所有键值对的“值”组成的@elem{􏿴}}

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
