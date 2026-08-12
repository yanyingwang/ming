#lang racket/base

(provide 􏽀 􏽁
         􏽁? 􏽀?
         ;; 邭*
         􏻷?
         􏸵
         􏴾
         ;; 􏶊*
         )
(require "racket/base.rkt" "racket/string.rkt" "racket/function.rkt" "bool.rkt")

;; (名 空􏿲 (􏿲))

(名 (􏽀 . E-LST)
    (㞢 句 E-LST))
(名 (􏽁 . E-LST)
    (􏽁化 (㞢 句 E-LST)))

(名 (􏽁? STR)
    (并 (山? STR) (句? STR)))
(名 (􏽀? STR)
    (并 (水? STR) (句? STR)))


;; (名 (邭* STR N1 [N2 空])
;;     (若 (空? N2)
;;         (邭 STR N1)
;;         (邭 STR N1 (􏽊 N2))))

(名 (􏻷? V)
    ((􏵃 􏼟?) V))

(名 (􏸵 S)
    (􏶐 S " " ""))

(名 (􏴾 LST)
    (㞢 􏼃 LST))


;; (名 (􏶊* S . RST)
;;     (􏶊 #:repeat? #t S RST))
