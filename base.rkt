#lang racket/base


(provide
 (rename-out
  [define 名]
  [let 令]

  [if 若] ;; 如 若 倘 况
  [case 倘]
  [cond 当]

  [equal? 同乎]

  [list 链]
  [length 长度]

  (car 首)
  (caar 首之首)
  (caaar 首之首首)
  (cadr 首之余)
  (caddr 首之余余)
  (cadar 首之余首)
  (cdr 余)
  (cadr 余之首)
  (caadr 余之首首)
  (cddr 余之余)
  (caddr 余之余首)

  [write 写]
  [print 示]
  [display 显] ;; 陈 显 现 呈 示
  [displayln 行显]

  (format 格)
  ))


;; (名 马 "马")
;; (名 白马 "白马")

;; (若 (同乎 马 白马)
;;     (陈 "白马是马")
;;     (陈 "白马非马"))

;; (若 (= 2
;;        (+ 1 1))
;;     (陈 "一一得二")
;;     (陈 "一一非二"))

;; (倘 (+ 1 1)
;;     [(1 2 3) (陈 "结果在1-3中")]
;;     [(4 5 6) (陈 "结果在1-3中")]
;;     [else (陈 "不再其列")])

;; (况
;;  [(positive? -5) (陈 "负五")]
;;  [(zero? -5) (陈 "为零")]
;;  [(positive? 5) (陈 "正五")])
