#lang racket/base

(provide ;; 空􏻿
         􏻽 􏻽? 􏻼?
         􏻿化並
         ;; 􏻿􏾝化􏸼*
         ;; 􏻿􏾝* 􏻿􏾩/以􏾝*
         )
(require "racket/base.rkt" "racket/vector.rkt" "racket/function.rkt" "bool.rkt")

;; (名 空􏻿 (􏻿))

(名 (􏻽 . E-LST)
    (用 􏻿 E-LST))

(名 (􏻽? VEC)
    (并 (水? VEC) (􏻿? VEC)))

(名 (􏻼? VEC)
    (并 (山? VEC) (􏻿? VEC)))


;; TODO: enh below funcs with let loop
(名 (􏻿化並 VEC)
    (􏻿􏾝化並 VEC))

;; (名 (􏻿􏾝化􏸼* VEC N1 N2)
;;     (􏻿􏾝化􏸼 VEC N1 (􏽊 N2)))

;; (名 (􏻿􏾝* VEC N1 N2)
;;     (􏻿􏾝 VEC N1 (􏽊 N2)))

;; (名 (􏻿􏾩/以􏾝* VEC N VECC NN1 NN2)
;;     (􏻿􏾩/以􏾝 VEC N VECC NN1 (􏽊 NN2)))


