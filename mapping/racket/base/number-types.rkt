#lang at-exp s-exp "../../../private/mapping-lang.rkt"

>>> number? 米? "是否是数" ;米 数
>>> complex? 夈? @elem{复数?（各取偏旁得造，复数=实数+虚数；另@litchar{夂}是@litchar{冬}的简写，@litchar{冬}通@litchar{终}，故也有所有的数终归都是复数之意）} ; 夈 粭? 夈 􏻬
>>> real? 宩? "实数?（各取偏旁得造（与虚数相对）" ;宩 冞 􏽐 宩 􏻫 􏺵􏺹 宩 􏻟
>>> rational? 粊? @elem{有理数?（可以用两个整数之比表示的实数称为有理数（无理数用@litchar{䉾}表示（北是背的原形）））} ;粃? 􏻳 􏻮 粊 䉾 |  􏽍 􏻮 􏽍
>>> integer? 􏻴? "整数?（各取偏旁得造：束+米）"
>>> exact-integer? 􏺢? "准确整数? （各取偏旁得造）" ; 􏻲 􏻲
>>> exact-nonnegative-integer?  􏺡? "准确非负整数?（各取偏旁得造）" ; 􏻈 􏻰􏻲
>>> exact-positive-integer? 􏺣? "准确正整数?" ;正􏻲 􏺻 􏺺
>>> inexact-real? 􏺠? "非准确实数?" ; 𮀦宩 􏺳
>>> fixnum? 􏻥? @elem{固定数（@racket[􏻲]的一种具体实现）} ;􏻥 𠤻
>>> flonum? 釆? "浮点数（各取偏旁得造）" ;粰 釆 􏻪
>>> double-flonum? 􏻝? @elem{双倍精度浮点数（仿@litchar{􏻞}，且占用64位内存而得造）} ; 双釆 􏻝 􏻐
>>> single-flonum? 􏻞? @elem{单倍精度浮点数（@litchar{立}是@litchar{位}的简写，因其在实现上占用32位内存而得造）} ; 单釆?
>>> single-flonum-available? 可􏻞?
>>> zero?  𥥪? "是否是0（没有任何数（空数）既是0（各取偏旁得造））"; 𬖏 穴口 〇 一 二 三 四 五 六 七 八 九 十 / 零、壹、贰、叁、肆、伍、陆、柒、捌、玖、拾、佰、仟、万、亿
>>> positive? 􏽌? "正数（各取偏旁得造）" ;􏽌 􏻨 􏻛
>>> negative? 􏽋? "负数（各取偏旁得造）" ;􏽋 􏻩 􏻔 􏻚
>>> even? 􏺝? "偶数（各取偏旁得造）" ;𥻑 􏻣 􏻖 􏻘 􏺷 􏺷
>>> odd? 􏺞? "奇数（各取偏旁得造）" ; 􏻢 􏻕 𥺿 􏺶 􏺶
>>> exact? 􏺸? "准确数（各取偏旁得造；所有数字要么是准确数，要么不是）" ; 􏻗 􏻧
>>> inexact? 􏺟? "非准确数（各取偏旁得造；非准确数是用浮点数实现的）" ;非􏻧 􏻜
>>> inexact->exact 􏺸化 @elem{@racket[􏻜]转化为@racket[􏻧]} ;􏻧化
>>> exact->inexact 􏺟化 @elem{@racket[􏻧]转化为@racket[􏻜]} ;􏻜化
>>> real->single-flonum 􏻞化 @elem{@racket[宩]转化为@racket[􏻞]} ;单釆化
>>> real->double-flonum 􏻝化 @elem{@racket[宩]转化为@racket[􏻝]} ;双釆化
