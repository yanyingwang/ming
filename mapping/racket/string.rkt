#lang s-exp "../../private/mapping-lang.rkt"


>>> string-append* 􏼰 @elem{类@racket[􏼱]，不过最后一个句是@racket[􏿴]}

>>> string-join 􏼪 "把一个􏿴内的各个元素聚集在一块组成句" ; 􏼻
>>> string-split 􏼩 "把句分割并组成􏿴" ;􏼼 􏼼 􏼼

>>> string-normalize-spaces 􏼚 "内容中的空格回车等字符都简化成一个空格" ; 㲁 椌 𤗇 𤗇 瞾 箜 𭄲 句􏼺 􏼮 􏼛
>>> string-replace 􏼥 "将数据内容的一部分更换成另一部分" ;敂

>>> string-trim 􏼙 @elem{修剪句} ; 􏼡
>>> non-empty-string? 􏼠? @elem{非空句?}; 䆜

>>> string-contains? 􏼢? @elem{某句是否是某句中间的一部分} ;; create a procedure named: 诗含字 􏼴
>>> string-prefix? 􏼤? @elem{某句是否是某句起头的一部分} ;; 诗起于字 􏼶
>>> string-suffix? 􏼣? @elem{某句是否是某句末尾的一部分} ;; 诗终于字 􏼵
;; 玽 欨 劬 眗 竘 𭇕 𮍘 𭴔 𫲢 䪷 𡱈 坸 佝 𠛎 𤖵 𠣪 軥 胊 㽛 玽 岣 驹 夠