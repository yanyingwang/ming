#lang at-exp s-exp "../../../private/mapping-lang.rkt"

>>> symbol? 勺?
>>> symbol-interned? 勺?/interned
>>> symbol-unreadable? 勺?/unreadable
>>> symbol->string 勺化句
>>> string->symbol 句化勺
>>> string->uninterned-symbol 句化uninterned勺
>>> string->unreadable-symbol 句化unreadable勺
>>> gensym 造勺
>> symbol<? 勺<?
;; >>> symbol->immutable-string 勺固化
