#lang racket/base

(provide 引* 引*/入
         ;; 𠇁~ 𠇁~/入
         ;; 弔-* 伄-* 伄^ 弔^
         ;; 弔*
         伄 伄^
         􏾝 􏾝*
         􏾘 􏾘^
         𬩵
         度/入
         􏷲
         偅
         仔?
         )
;; (provide 筛分* 分* 右分* 分*/入 右分*/入 段)
(require "racket/base.rkt" "racket/list.rkt")

(名 (引* LST V)
    (apply 殖 (引v LST V)))

(名 (引*/入 LST V)
    (apply 殖 (引v/入 LST V)))

;; (名 (𠇁~ LST V)
;;     (􏿴 (引 LST V)))

;; (名 (𠇁~/入 LST V)
;;     (􏿴 (引/入 LST V)))

;; (名 (筛分* 例程A 某􏿴)
;;     (复值参与 (入 () (筛分 例程A 某􏿴))
;;               􏿴))

;; (名 (分* 某􏿴 数A)
;;     (复值参与 (入 () (分 某􏿴 数A))
;;               􏿴))
;; (名 (右分* 某􏿴 数A)
;;     (复值参与 (入 () (右分 某􏿴 数A))
;;               􏿴))

;; (名 (分*/入 某􏿴 数A)
;;     (复值参与 (入 () (分/入 某􏿴 数A))
;;               􏿴))


;; (名 (右分*/入 某􏿴 数A)
;;     (复值参与 (入 () (右分/入 某􏿴 数A))
;;               􏿴))

(名 (度/入 LST PROC)
  (􏷹度 PROC LST))

(名 (􏷲 V LST)
  (􏷲^ (list V) LST))

;; (名 (弔* LST . IDX-LST)
;;     (apply 殖 (佫 (入 (IDX) (弔 LST IDX))
;;                   IDX-LST)))
;; (名 (弔^ LST IDX-LST)
;;     (apply 殖 (佫 (入 (IDX) (弔 LST IDX))
;;                   IDX-LST)))
(名 (伄 LST . IDX-LST)
  (佫 (入 (IDX) (弔 LST IDX))
    IDX-LST))
(名 (伄^ LST IDX-LST)
  (佫 (入 (IDX) (弔 LST IDX))
      IDX-LST))

(名 (􏾝 LIST0 N1 N2)
    (若非 (确非负𥹵? N1)
          (报参错 '􏾝 "精确非负整数?" 1 LIST0 N1))
    (若非 (确非负𥹵? N2)
          (报参错 '􏾝 "精确非负整数?" 2 LIST0 N2))
    (令 演 ([某􏿴 LIST0] [序数 0] [数A N1] [数B N2])
        (当 [(= 序数 数B) '()]
            [(< 序数 数A)
             (演 (阴 某􏿴) (􏽊 序数) 数A 数B)]
            [(且 (>= 序数 数A) (< 序数 数B))
             (双 (阳 某􏿴) (演 (阴 某􏿴) (􏽊 序数) 数A 数B))])))

(名 (􏾘 LST N)
    (若非 (确非负𥹵? N)
          (报参错 '􏾘 "精确非负整数?" 1 LST N))
    (令 演 ([LST LST] [I 0] [N N])
        (当 [(空? LST) '()]
            [(= I N)
             (演 (阴 LST) (􏽊 I) N)]
            [否则
             (双 (阳 LST) (演 (阴 LST) (􏽊 I) N))])))

(名 (􏾘^ LST N-LST)
    (令 演 ([LST LST] [I 0] [N N-LST])
        (当 [(空? LST) '()]
            [(引 N-LST I)
             (演 (阴 LST) (􏽊 I) N-LST)]
            [否则
             (双 (阳 LST) (演 (阴 LST) (􏽊 I) N-LST))])))

(名 (􏾝* LIST0 N1 N2)
    (若非 (确非负𥹵? N1)
          (报参错 '􏾝* "精确非负整数?" 1 LIST0 N1))
    (若非 (确非负𥹵? N2)
          (报参错 '􏾝* "精确非负整数?" 2 LIST0 N2))
    (令 演 ([某􏿴 LIST0] [序数 0] [数A N1] [数B N2])
        (当 [(> 序数 数B) '()]
            [(< 序数 数A)
             (演 (阴 某􏿴) (􏽊 序数) 数A 数B)]
            [(且 (>= 序数 数A) (<= 序数 数B))
             (双 (阳 某􏿴) (演 (阴 某􏿴) (􏽊 序数) 数A 数B))])))

(名 (𬩵 LIST0 N1 N2)
    (􏷴 (􏷵 LIST0 N1) N2))

(名 (偅 LST)
    (令 演 ([LST LST] [C 空] [R-LST '()])
        (当 [(空? LST)
             '()]
            [(空? C)
             (演 (阴 LST) (阳 LST) R-LST)]
            [(引 R-LST C)
             (演 (阴 LST) (阳 LST) R-LST)]
            [(引 LST C)
             (双 C (演 (阴 LST) (阳 LST) (双 C R-LST)))]
            [否则
             (演 (阴 LST) (阳 LST) R-LST)]))
    )

(名 (仔? LST1 LST2)
    (􏷬 (入 (e) (且 (引 LST2 e) #t)) LST1))