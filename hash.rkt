#lang racket/base

(provide 􏿳 空􏿳
         􏾌 􏾐 􏾐? 􏾑 􏾑?
         )
(require racket/function "racket/base.rkt" "racket/hash.rkt")

(名 (􏿳 . V-LST)
    (令 演 ([LST V-LST] [I 0] [X 空])
        (当 [(空? LST) '()]
            [(偶数? I)
             (演 (阴 LST) (加一 I) (阳 LST))]
            [(奇数? I)
             (双 (双 X (阳 LST)) (演 (阴 LST) (加一 I) (阳 LST)))])))

(名 空􏿳 (􏿳))

(名 (􏾌 . V-LST)
    (apply 􏿰 V-LST))
(名 (􏾐 . V-LST)
    (apply 􏿰 V-LST))
(名 (􏾑 . V-LST)
    (􏿰^ (apply 􏿳 V-LST)))

(名 (􏾐? H)
    (且 (􏿰? H) (固? H)))
(名 (􏾑? H)
    (且 (􏿰? H) (易? H)))



;; (名 (􏾇 . V-LST)
;;     (apply 􏾌 V-LST))
;; (名 (􏾆 . V-LST)
;;     (apply 􏾋 V-LST))
;; (名 (􏾅 . V-LST)
;;     (apply 􏾊 V-LST))
;; (名 (􏾄 . V-LST)
;;     (apply 􏾉 V-LST))




(名 (易? V)
    ((negate 固?) V))