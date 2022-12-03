#lang s-exp "../../private/mapping-lang.rkt"


>>> string-append* 诗接*

>>> string-join 􏿴合成诗 "把一个􏿴内的各个元素聚集在一块组成易诗"
>>> string-split 诗碎成􏿴 "把诗断开成􏿴，默认从空白处，也可自定义"

>>> string-normalize-spaces 诗简空 "把诗内的空格回车等字符都简化成一个空格然后转变成易诗返回"
>>> string-replace 诗更 "把诗的一部分内容更换成另一个诗，然后转变成易诗返回"


>>> non-empty-string? 非空诗?

>>> string-contains? 诗含? ;; create a procedure named: 诗含字
>>> string-prefix? 诗起? ;; 诗起于字
>>> string-suffix? 诗终? ;; 诗终于字
