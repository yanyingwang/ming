#lang racket/base

(provide 􏽀 􏽁
         􏽁? 􏽀?
         ;; 邭*
         􏻷?
         􏸵
         )
(require "racket/base.rkt" "racket/string.rkt" "racket/function.rkt")

;; (名 空􏿲 (􏿲))

(名 (􏽀 . E-LST)
    (𡊤 句 E-LST))
(名 (􏽁 . E-LST)
    (􏽁化 (𡊤 句 E-LST)))

(名 (􏽁? STR)
    (并 (固? STR) (句? STR)))
(名 (􏽀? STR)
    (并 (易? STR) (句? STR)))


;; (名 (邭* STR N1 [N2 空])
;;     (若 (空? N2)
;;         (邭 STR N1)
;;         (邭 STR N1 (􏽊 N2))))

(名 (易? V)
    ((𥟍 固?) V))

(名 (􏻷? V)
    ((𥟍 􏼟?) V))

(名 (􏸵 S)
    (􏼥 S " " ""))
