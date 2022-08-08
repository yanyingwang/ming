#lang racket/base

(provide mapping)

(require "../private/mapping.rkt"
         (rename-in "racket/base.rkt" [mapping mapping1])
         (rename-in "racket/list.rkt" [mapping mapping2])) ;; TODO: should be enh to racket/*.rkt

(define (mapping #:scribble? [scribble? #f])
  (append (mapping1 #:scribble? scribble?)
          (mapping2 #:scribble? scribble?)))






#;(define translation
  (hash
   'if '若
   'case '例
   'cond '倘
   'for '于
   'for* '于甚

   'when '当
   'unless '挡
   'match '像  ;/似/

   'define '名
   'let '让 ;/令/予
   'let* '让甚

   'list '表
   'array '组 ;排串
   'hash '集
   'dict '典
   'class '类
   'struct '构
   'equal '同

   ;; 'character '符
   ;; 'symbol '字
   ;; 'keyword '词
   ;; 'byte '言
   ;; 'string '文
   ;; 'text '书
   'display '显
   'displayln '显行
   'write '作
   'format '释 ;/夫/凡 ( 句首语气词，夫六国与秦皆诸侯，其势弱于 秦; 夫战，勇气也)
   'car '阳
   'cdr '阴)
  )

;;;;;;;;; to be done:
;;; procedure == ???? 步骤 过程 程序，应找一个文言文单字
