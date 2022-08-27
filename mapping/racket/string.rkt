#lang s-exp "../../private/mapping-lang.rkt"

[string-append* 连诗* ]
[string-join 链拢成诗 "把一个链内的各个元素聚拢在一块组成易诗。"]
[string-normalize-spaces 诗简空诗 "把诗内的空格回车等字符都简化成一个空格然后转变成易诗返回。"]
(string-replace 诗部替诗 "把诗的一部分内容替换成另一部分然后转变成易诗返回。")
(string-split 诗碎成链 "把诗断开成链，默认从空白处，也可自定义。")
(non-empty-string? 非空诗?)
(string-contains? 诗含子诗?) ;; create a procedure named: 诗含字
(string-prefix? 诗起子诗?) ;; 诗起于字
(string-suffix? 诗终子诗?) ;; 诗终于字
