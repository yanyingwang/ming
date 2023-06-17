#lang at-exp s-exp "../../../private/mapping-lang.rkt"

>>> symbol? 勺?
>>> symbol-interned? 􏺏?
>>> symbol-unreadable? 􏺎?
>>> symbol->string 勺化句
>>> string->symbol 句化勺
>>> string->uninterned-symbol 句化􏺍
>>> string->unreadable-symbol 句化􏺎
>>> gensym 􏺌 ;􏺍
>> symbol<? 勺<?
