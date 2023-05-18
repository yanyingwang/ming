#lang at-exp s-exp "../../../private/mapping-lang.rkt"

>>> char? 字?
>>> char->integer 字化数
>>> integer->char 数化字

>>> char-utf-8-length 字度/utf-8
>>> char=? 字=?
>>> char<? 字<?
>>> char<=? 字<=?
>>> char>? 字>?
>>> char>=? 字>=?
>>> char-ci=? 字=?/ci
>>> char-ci<? 字<?/ci
>>> char-ci<=? 字<=?/ci
>>> char-ci>? 字>?/ci
>>> char-ci>=? 字>=?/ci
>>> char-alphabetic? 字?/英
>>> char-lower-case? 字?/小写
>>> char-upper-case? 字?/大写
>>> char-title-case? 字?/标题
>>> char-numeric? 数字?
>>> char-symbolic? 字?/符号
>>> char-punctuation? 字?/标点
>>> char-graphic? 字?/象形
>>> char-whitespace? 字?/whitespace
>>> char-blank? 字?/blank
>>> char-iso-control? 字?/iso-control
>>> char-extended-pictographic? 汉字?
>>> char-general-category 字类
>>> char-grapheme-break-property 字属
>>> make-known-char-range-list ake-known-char-range-list
>>> char-upcase 字大写化
>>> char-downcase 字小写化
>>> char-titlecase 字标题化
>>> char-foldcase 字标题化*
>>> char-grapheme-step har-grapheme-step