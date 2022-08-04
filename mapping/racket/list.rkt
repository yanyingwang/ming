#lang racket/base

(provide mapping)

(define (mapping)
  '( ;;; (empty 空) not need as one defined same in base (null 空)
    (first 甲)
    (second 乙)
    (third 丙)
    (fourth 丁)
    (fifth 戊)
    (sixth 己)
    (seventh 庚)
    (eighth 辛)
    (ninth 壬)
    (tenth 癸)
    (last 末)
    (last-pair 末对)
    (take 取)
    (drop 弃) ; 舍 is taken by list-tail in the racket/base
    (rest 余)
    (make-list 复链))
  )

