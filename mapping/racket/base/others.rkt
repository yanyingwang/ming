#lang s-exp "../../../private/mapping-lang.rkt"


>>> equal? 同? ;;; 同 同齐 同等 俤
>>> equal-always? 􏾬? ;; 􏾱?
>>> eqv? 粡? ;; 􏾰? ;; ???? ;; #f <= (eqv? (make-string 3 #\z) (make-string 3 #\z))
>>> eq? 侗? ;; 􏾯? ;; 􏾯 #f <= (eq? (make-string 3 #\z) (make-string 3 #\z)) (eq? (expt 2 100) (expt 2 100))
;; 相当 (两方面差不多；配得上或能够相抵。)
;; 等同 (看作相同；当做同样的事物看待)
;; 相等 ([数目、数、量或尺寸的] 相同)
;; 相同 (指彼此无差异)

>>> format 格 ; 化
>>> write 写
>>> writeln  行写
>>> print 示
>>> println 行示
>>> display 陈 ;; 陈 显 现 呈 示
>>> displayln 行陈

>>> values 殖 "复值的意思" ;;  値 􏾴 􏾴 𡖻 殖
>>> call-with-values 入􏾴参予 "用continuation生成复值，并作为参数给予某例程"

>>> for 遍 ;; 每 为 历、遍历 对于
>>> for/list 遍/􏿴
>>> apply 用 ;; 应 使
>>> procedure? 程? "例程简称程"
>>> eval 求
>>> void? 无?

>>> immutable? 坚? @elem{“不可变的”的意思。另常用有“易”和其意思相对，意思是“可变的”，即@code{(非 坚?)}}
>>> raise-argument-error 报参错