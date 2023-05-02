#lang at-exp s-exp "../../../private/mapping-lang.rkt"

>>> box? 矢?
>>> box 矢
>>> box-immutable  固矢 ; 矢/坚
>>> unbox 􏾢
>>> set-box! 𥎪! ;𥎪! ;矢攸! ; 𥎪
>>> unbox* 􏾢*
>>> set-box*! 𥎪*!
>>> box-cas! 𥎪替!


>>> make-weak-box 䒨
>>> weak-box-value 􏾡
>>> weak-box? 䒨?

>>> make-ephemeron 􏾧
>>> ephemeron-value 􏾠
>>> ephemeron? 􏾧?
