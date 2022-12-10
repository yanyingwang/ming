#lang at-exp s-exp "../../../private/mapping-lang.rkt"


>>> hash? 􏿱*?

>>> hash-equal? 􏿱?
>>> hash-equal-always? 􏿱/􏾱?
>>> hash-eqv? 􏿱/􏾰?
>>> hash-eq? 􏿱/􏾯?
>>> hash-strong? 􏿱/强?
>>> hash-weak? 􏿱/弱?
;; hash-ephemeron?

>>> hash 􏿱
>>> hashalw 􏿱/􏾱
>>> hasheqv 􏿱/􏾰
>>> hasheq 􏿱/􏾯

>>> make-immutable-hash 􏿳->􏿱
>>> make-immutable-hashalw 􏿳->􏿱/􏾱
>>> make-immutable-hasheqv 􏿳->􏿱/􏾰
>>> make-immutable-hasheq 􏿳->􏿱/􏾯

>>> make-hash 􏿳->易􏿱
>>> make-hashalw 􏿳->易􏿱/􏾱
>>> make-hasheqv 􏿳->易􏿱/􏾰
>>> make-hasheq 􏿳->易􏿱/􏾯

>>> make-weak-hash 􏿳->弱􏿱
>>> make-weak-hashalw 􏿳->弱􏿱/􏾱
>>> make-weak-hasheqv 􏿳->弱􏿱/􏾰
>>> make-weak-hasheq 􏿳->弱􏿱/􏾯

>>> hash-set 􏿱攸
>>> hash-set! 􏿱攸!
>>> hash-set*! 􏿱攸*!

>>> hash-ref 􏿱值
>>> hash-ref-key 􏿱键

>>> hash-ref! 􏿱值!
>>> hash-has-key? 􏿱键?

>>> hash-update 􏿱攸/入
>>> hash-update! 􏿱攸!/入

>>> hash-remove! 􏿱删!
>>> hash-remove 􏿱删

>>> hash-clear! 􏿱清!
>>> hash-clear 􏿱清
>>> hash-copy-clear 􏿱清/复制

>>> hash-map 􏿱𮞑
>>> hash-map 􏿱𮞑/复

>>> hash-keys 􏿱键􏿴
>>> hash-values 􏿱值􏿴

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
