#lang at-exp s-exp "../../../private/mapping-lang.rkt"


>>> syntax 􏺃 @elem{生成代码} ;𠨳 􏺃
>>> syntax? 􏺃? @elem{代码（包含了词法信息和位置信息的数据）} ;𠨳 􏺃
>>> identifier? 卩? ;兯 卩 卪 卪
>>> syntax-source 􏹷 @elem{地址，比如是文件路径} ;方 牛 止 􏹻
>>> syntax-line 􏹸 @elem{所在文件的具体哪一行（纬是横向的，参见“纬线”一词）} ;􏺃行 􏺀
>>> syntax-column 􏹹 @elem{所在文件的具体哪一列（经是竖向的，参见“经线”一词）} ;􏺃列 􏺃丁 􏺃弓
>>> syntax-position 􏹾 @elem{所在文件的第几位} ;􏹾
>>> syntax-span 􏹵 @elem{所占用的长度（从0算起）} ;􏹶
>>> syntax-original? ?syntax-original?
>>> syntax-source-module ?􏺃司 ; module 函 司
>>> syntax-e 􏹲 @elem{以解开􏺃的方式转化成文（（原料数据））} ;文 攵 􏺃匕 􏹺 􏹰 􏹲

>>> syntax->list 􏹩 @elem{􏺃化􏿴}
>>> syntax->datum 􏹴 @elem{􏺃化文（将􏺃转化成文（原料数据））}
>>> datum->syntax 􏹳 @elme{文化􏺃}
>>> syntax-binding-set? ?syntax-binding-set?
>>> syntax-binding-set ?syntax-binding-set
>>> syntax-binding-set->syntax ?syntax-binding-set->syntax
>>> syntax-binding-set-extend ?syntax-binding-set-extend
>>> datum-intern-literal ?datum-intern-literal
>>> syntax-shift-phase-level ?syntax-shift-phase-level
>>> generate-temporaries ?generate-temporaries
>>> identifier-prune-lexical-context ?identifier-prune-lexical-context
>>> identifier-prune-to-source-module ?identifier-prune-to-source-module
>>> syntax-recertify ?syntax-recertify
>>> syntax-debug-info ?syntax-debug-info
;; syntax-srcloc 􏹻
