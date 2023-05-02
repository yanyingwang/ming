#lang racket/base

(provide 空􏿲 易? 易􏿲 易􏿲? 固􏿲?
         􏿲化殖 􏿲􏾝化殖*
         􏿲􏾝* 􏿲攸!/以􏾝*)
(require "racket/base.rkt" "racket/vector.rkt" racket/function)

(名 空􏿲 (􏿲))

(名 (易􏿲 . E-LST)
    (apply 􏿲 E-LST))

(名 (易􏿲? VEC)
    (且 (易? VEC) (􏿲? VEC)))

(名 (固􏿲? VEC)
    (且 (固? VEC) (􏿲? VEC)))


;; TODO: enh below funcs with let loop
(名 (􏿲化殖 VEC)
    (􏿲􏾝化殖 VEC))

(名 (􏿲􏾝化殖* VEC N1 N2)
    (􏿲􏾝化殖 VEC N1 (加一 N2)))

(名 (􏿲􏾝* VEC N1 N2)
    (􏿲􏾝 VEC N1 (加一 N2)))

(名 (􏿲攸!/以􏾝* VEC N VECC NN1 NN2)
    (􏿲攸!/以􏾝 VEC N VECC NN1 (加一 NN2)))



(名 (易? V)
    ((negate 固?) V))