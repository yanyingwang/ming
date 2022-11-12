#lang s-exp "../../../private/mapping-lang.rkt"


>>> string? 诗?
>>> string 诗 "创建一个内容可变的字符串数据结构。" ;; TODO: create all the procedures started with 易 to 坚
>>> make-string 复诗 "创建一个内容可变的字符串数据结构，其内容为N个重复相同的字。"
>>> string->immutable-string 诗->坚诗 "把诗转变为坚诗。"
>>> string-length 𬤏
>>> string-ref 诗提
>>> string-set! 诗修! "将诗的第N处字（从0算起）修改为某字。"
>>> substring 诗段 "索引摘录诗的N（包含）到Q（不包含）之间的字，并生成一个易诗。" ;; 摘
>>> string-copy 诗->易诗 "把诗转变为易诗。"
>>> string-copy! 诗改!/以它段 (elem "从本诗的第N处字（从0算起）开始做覆盖（以另一个诗中取出的" (racket 诗段) "为内容）")
>>> string-fill! 诗覆! "把诗的内容全部变成某一个重复的一个字。"
>>> string-append 连诗 "把很多诗连接在一块，组成易诗。"
>>> string-append-immutable 坚连诗 "把很多诗连接在一块，组成坚诗。"

>>> string->list 诗->􏿴
>>> list->string 􏿴->诗
>>> build-string 序诗 "生成一个诗，诗中的每个字都是按照一定的顺序排列的。"
>>> string=? 诗=?
>>> string<? 诗<?
>>> string<=? 诗<=?
>>> string>? 诗>?
>>> string>=? 诗>=?

>>> string-ci=? 诗ci=?
>>> string-ci<? 诗ci<?
>>> string-ci<=? 诗ci<=?
>>> string-ci>? 诗ci>?
>>> string-ci>=? 诗ci>=?

>>> string-upcase upcase诗
>>> string-downcase downcase诗
>>> string-titlecase titlecase诗
>>> string-foldcase foldcase诗
