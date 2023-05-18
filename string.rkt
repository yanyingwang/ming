#lang racket/base

(provide 􏽀 􏽁
         􏽁? 􏽀?
         句􏾝*
         )
(require "racket/base.rkt" "racket/string.rkt" racket/function)

;; (名 空􏿲 (􏿲))

(名 (􏽀 . E-LST)
    (apply 句 E-LST))
(名 (􏽁 . E-LST)
    (􏽁化 (apply 句 E-LST)))

(名 (􏽁? STR)
    (且 (固? STR) (句? STR)))
(名 (􏽀? STR)
    (且 (易? STR) (句? STR)))


(名 (句􏾝* STR N1 [N2 空])
    (若 (空? N2)
        (句􏾝 STR N1)
        (句􏾝 STR N1 (􏽊 N2))))

(名 (易? V)
    ((negate 固?) V))