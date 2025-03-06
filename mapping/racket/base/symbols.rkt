#lang at-exp s-exp "../../../private/mapping-lang.rkt"

>>> symbol? 􏷂?
>>> symbol-interned? 􏺏?
>>> symbol-unreadable? 􏺋?
>>> symbol->string 􏷂化句 (􏷂 化IFX 句)
>>> string->symbol 句化􏷂 (句 化IFX 􏷂)
>>> string->uninterned-symbol 句化􏺍 (句 化IFX 􏺍)
>>> string->unreadable-symbol 句化􏺋 (句 化IFX 􏺋)
>>> gensym 􏺌 (􏺍 米)
>>> symbol<? 􏷂<?
