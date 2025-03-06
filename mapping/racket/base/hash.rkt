#lang at-exp s-exp "../../../private/mapping-lang.rkt"


>>> hash 􏿰
>>> hashalw 􏾋 ; 􏾱􏿰
>>> hasheqv 􏾊
>>> hasheq 􏾉

>>> hash? 􏿰?
>>> hash-equal? 􏾌?
>>> hash-equal-always? 􏾋?
>>> hash-eqv? 􏾊?
>>> hash-eq? 􏾉?

>>> hash-strong? 􏾎? ; 刚 强
>>> hash-weak? 􏾏?
>>> hash-ephemeron? 􏾈?

>>> make-hash 􏿰^
>>> make-hashalw 􏾋^
>>> make-hasheqv 􏾊^
>>> make-hasheq 􏾉^

>>> make-immutable-hash 􏾐^
>>> make-immutable-hashalw 􏾆^
>>> make-immutable-hasheqv 􏾅^
>>> make-immutable-hasheq 􏾄^

>>> make-weak-hash 􏾏^
>>> make-weak-hashalw 􏾁^
>>> make-weak-hasheqv 􏾀^
>>> make-weak-hasheq 􏽿^

>>> make-ephemeron-hash 􏾈^
>>> make-ephemeron-hashalw 􏽽^
>>> make-ephemeron-hasheqv 􏽼^
>>> make-ephemeron-hasheq 􏽻^

>>> hash-set 􏿰攸
>>> hash-set* 􏿰𰁦 ;(􏿰攸 +)
>>> hash-update 􏿰攸/入
>>> hash-set! 􏿰􏾩
>>> hash-set*! 􏿰𢪛 ;(􏿰􏾩 +)
>>> hash-update! 􏿰􏾩/入

>>> hash-ref 􏿰弔 ;􏽚; make new char from merging 􏿰弔 as one
>>> hash-ref-key 􏿰􏽙 ;𦙨 􏽙 􏿰弔日
;; >>> hash-ref-key 􏿰弔日 @elem{以“键值对”中“阴”位数据为基准，来索引查询“阳”位数据并返回；} ;𦙨

>>> hash-ref! 􏿰𫼛 ;􏿰𫼛 􏿰弔!
>>> hash-has-key? 􏿰日? ;􏿰日? 􏿰􏺉? 􏿰有?

>>> hash-remove 􏿰􏾘
>>> hash-remove! 􏿰􏽘 ; ; 􏿰􏽘 􏿰􏾘!

>>> hash-clear 􏿰𠛮
>>> hash-clear! 􏿰􏽗 ;􏽗 􏿰𠛮!

>>> hash-copy-clear 𠛮􏿰

>>> hash-map 􏿰􏷑化􏿴 (􏿰􏷑 化IFX 􏿴)
>>> hash-map/copy 􏿰􏷑

>>> hash-keys 􏿰􏺈 ;􏿰阳
>>> hash-values 􏿰􏺇 ;􏿰阴

>>> hash->list 􏿰化􏿳 ( 􏿰 化IFX 􏿳)

;; >>> hash-keys-subset? 􏿰􏺈?^
>>> hash-for-each 􏿰􏷒
>>> hash-count 􏿰巨
>>> hash-empty? 􏻵?

;; >>> hash-iterate-first ?􏿰引
;; >>> hash-iterate-next ?􏿰继引
;; >>> hash-iterate-key ?􏿰引日
;; >>> hash-iterate-value ?􏿰引月
;; >>> hash-iterate-pair ?􏿰引明
;; >>> hash-iterate-key+value ?􏿰引日月
>>> hash-copy 􏾑化 (􏾑 化SFX); 袭 抄 仿 摹 模 拟 似 抄 􏿰􏽕
