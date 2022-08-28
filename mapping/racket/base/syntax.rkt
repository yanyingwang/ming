#lang s-exp "../../../private/mapping-lang.rkt"



>>> char? 字?
>>> symbol? 词?
>>> keyword? 词参? "因与词类似，但是却主要是定义例程使用参数时才使用的。" ;; 牌?
>>> keyword<? 词参<?

>>> symbol->string 词->诗
>>> string->symbol 诗->词

>>> string->keyword 诗->词参
>>> keyword->string 词参->诗

>>> syntax 文
>>> syntax? 文?
>>> identifier? 名?

>>> syntax->datum 文->料
>>> syntax->list 文->链
>>> datum->syntax 料->文
