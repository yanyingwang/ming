#lang racket/base


(provide
 (rename-out
  [lambda 道] ;; 入
  [define 名]
  [let 令]

  [require 入] ;; 入 出 拿 给
  [provide 出] ;;


  ;;;;;; conditaionals
  ;; 如 若 倘 况
  [if 若] ;; 若是
  [case 倘] ;; 倘如
  [cond 当] ;; 在……时候
  [else 否则]

  [and 且] ;; 也 还 又 且
  [or 或] ;; 不


  ))
