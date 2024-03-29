# ming-lang/名语言
1. 名语言的目的是为了探讨汉语的庞大性和汉语编程的可行性，以及在形式和语义上，能否把英语作为其一个子集而包含之。
2. 名语言不会采用通俗的计算机中文中已有的通用翻译作为编程语言关键字，而是在兼顾汉语的古今含义上做出折取选择。
3. 名的目的不是创造一个完全可用的编程语言（这需要足够多的人力翻译投入，非我一人之力可为），而是为汉语编程探索和指明道路。
4. 为什么选择Racket语言实现，是因为scheme语言的特殊性，其所有的高级抽象形态实现都可以回溯到最基本的几个函数定义上，这得以让汉语化编程可以一步一步的替换完成其所固有的内部英文定义。
5. 另外我认为，名语言的实现过程，除去代码上的东西外，会类似于一个汉语地方方言的实现。所谓方言，比如河南话更甚于说是吴语，即是选择了汉语中的部分字词，定义出了自己方言的特殊意义。而名语言的实现，我认为会类似于这样一个过程，只不过是在选择时，需要兼顾编程和相应的英文词汇而翻译。



# 以下为思索简录
## 我的一种关于lisp方言式的汉语编程语言的构思
日韩美欧都不会想要发明其语言的编程，是因为其语言的差异不如汉语和英文之间的差异明显。也就是说，汉语和英语之于其他各个语言和英文，在被用作编程的元语言的时候，有很大的比较优势。


## 语言学习
从单字、语法到固定句型的过程，编程是固定套路的记忆

假设梵语。语言本身是有类型的 不需要在编程语言中通过定义类型

汉语不区分词性  https://www.zhihu.com/question/284461424

我觉得这种回答有点狡辩的嫌疑，汉语大部分情况下确实是不区分词性的，最起码这种区分的程度是上升不到比如词性在英语这种语言中的地位的。
 
甚至于我有时候会认为，汉语有时候难以读懂，起码不像直观上大部分情况下英语那么的容易读懂，就在于汉语对词性的区分是不够深刻的，比如，汉语本人为表象的文字，在看这种文字的时候，你是无法根于字符的构造比如偏旁，就看出来某一个词的词性的，而英文对词性的区分是跟字符的组成形态有关系的，也就是说英语是有统一的规则的。
 
汉语特别是文言文中，常常是有名词动词活用的情况的，可以感受到，汉语很明显，不是明确区分词性的语言的：
 
例如，`蹄`这个字，大部分情况下为名词，当然，`蹄子`这个词组是名词，而：
 
`马不胜怒，蹄之`就是名词用作动词的方法。
 
又如，上面看到有人回复说：“兄台说得明白”。这里的明白，按照英文为 “副词”，是在修饰动词“说得”。
 
而明白又能用作：这件事情很明白了。这里的明白，为形容词，修饰名词“这件事情”。
 
而明白又能用作动词 --- 我明白你的意思了。




## 以racket为基础的汉语编程语言
racket翻译语言，写一个系统，有人定义关键字翻译，可以全局替换整个系统相关名。


中文域名到底有没有价值？ - Yanying的回答 - 知乎
https://www.zhihu.com/question/19851670/answer/1250914563

中文域名的价值因为当下英语环境的侵入和整个计算机的基础架构作用在英语元语言上的原因，并不能显示出其效果。
假设汉语化编程得以实现，并且因为汉语化编程这样的基础设施的实现，而使其上层建筑譬如http协议的诸多等等的汉语化得以实现，中文域名才能得以长远发展，其价值才能有所体现。


中文元语言的编程语言的未实现，致使以此为基础的上层建筑的汉语化都不能被构建。

更不能长远的促进汉语在计算机行业的应用以及学习上的成本。


英文中以大小写区分词性,比如ruby语言的实例小写下划线,类名contant全部大写,在中文编程因为中文的自由语素的原因,均可以用自由语素组合而成.


参数名-:   相结尾来表示,例如: 鱼相.
实例参数:  此/彼开头,例如:此鱼.  彼鱼,代表有上下文关系的变量.
实例:  某字开头:  某鱼.  代表无相关关系的初始变量


汉语的单字自由语素以及古诗词对仗等底蕴单元造就的多样性所能另单数复数等等变化规律对仗


## racket关键字翻译
已改变，详见 dictionary.rkt
- [ ] 一个翻译函数，指定参数名字，可以翻译定义racket已定义的函数。
https://www.zdic.net/
~~~lisp
If -> 若/如
Match -> 像/似/倘
Let -> 让/令/予
define -> 名

List -> 链 表
array -> 组/串
Hash -> 集
Dict ->  典
Class -> 类
Struct -> 构

equal -> 同

Character -> 符
Symbol -> 字
keyword -> 词
Byte -> 言
string -> 文
Text -> 书


display -> 显  displayln 显行/置
write -> 作/
Format -> 释/夫/凡 ( 句首语气词，夫六国与秦皆诸侯，其势弱于 秦; 夫战，勇气也)


car -> 阳
cdr -> 阴
~~~



https://zh.wikipedia.org/wiki/%E7%99%BD%E9%A9%AC%E9%9D%9E%E9%A9%AC
以中国古代春秋战国时期，名家提出的辩题“白马非马”，代码可以演示为：
~~~lisp

(名 马 "某马")
(名 白马 "某白马")

(若 (同 马 白马)
    (置 "白马是马")
    (置行 "白马非马"))

(令 ([马 "马"]
     [白马 "白马"])
    (若 (等于 白马 马)
        (置 "白马是马")
        (置 "白马非马")))
~~~


