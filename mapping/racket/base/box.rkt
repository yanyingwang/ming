#lang at-exp s-exp "../../../private/mapping-lang.rkt"

>>> box 矢
>>> box? 矢?
>>> box-immutable 㞺 ;;固矢 ; 矢/坚
>>> unbox 矢内
>>> set-box! 𪭨 ; 𥎪 𥎪! ;矢攸! ; 𥎪

>>> unbox* 􏽅*
>>> set-box*! 𪭨*  ;𥎪
>>> box-cas! 𪭨替 ;𥎪

>>> weak-box? 䒨?
>>> make-weak-box 䒨
>>> weak-box-value 䒨内

>>> ephemeron? 􏾧?
>>> make-ephemeron 􏾧
>>> ephemeron-value 􏾧内