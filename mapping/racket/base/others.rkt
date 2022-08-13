#lang racket/base

(provide mapping)
(require  "../../../private/mapping.rkt")

(define (mapping #:scribble? [scribble? #f])
  (gen-mapping-data data #:scribble? scribble?))
(define data
  '((equal? 同?) ;;; 同 同齐 同等
    (eqv? 齐?) ;; ???? ;; #f <= (eqv? (make-string 3 #\z) (make-string 3 #\z))
    (eq? 等?) ;; #f <= (eq? (make-string 3 #\z) (make-string 3 #\z)) (eq? (expt 2 100) (expt 2 100))
    ;; (equal-always? 总同?)
    ;; 相当 (两方面差不多；配得上或能够相抵。)
    ;; 等同 (看作相同；当做同样的事物看待)
    ;; 相等 ([数目、数、量或尺寸的] 相同)
    ;; 相同 (指彼此无差异)

    (format 格) ; 化
    (write 写)
    (writeln  行写)
    (print 示)
    (println 行示)
    (display 陈) ;; 陈 显 现 呈 示
    (displayln 行陈)
    (values 值)



    (for 遍) ;; 每 为 历、遍历 对于
    (for/list 遍/链)
    (apply 用) ;; 应 使
    (procedure? 程?)
    (syntax 式)
    (syntax? 式?)

    )
  )



