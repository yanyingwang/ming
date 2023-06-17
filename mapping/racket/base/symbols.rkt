#lang at-exp s-exp "../../../private/mapping-lang.rkt"

>>> symbol? 勺? "是否是勺结构"
>>> symbol-interned? 􏺏? "是否是􏺏"
>>> symbol-unreadable? 􏺋? "是否是􏺋"
>>> symbol->string 勺化句 "将勺转化成句"
>>> string->symbol 句化勺 "将句转化成勺"
>>> string->uninterned-symbol 句化􏺍 "将句转化成􏺍"
>>> string->unreadable-symbol 句化􏺋 "将句转化成􏺋"
>>> gensym 􏺌 "生成􏺌" ;􏺍
>> symbol<? 勺<? "是否渐大排序"
