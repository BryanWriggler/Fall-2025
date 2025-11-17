#import "../../macros.typ": *

//setup basics
#import "@preview/rubber-article:0.4.1": *
#import "@preview/ergo:0.2.0": *
#import "@preview/fletcher:0.5.5" as fletcher: *

//basic template setup
#show: article.with(
  header-display: true,
  eq-numbering: "(1.1)",
  eq-chapterwise: true,
  margins: 1.0in,
)
#show: ergo-init.with(
    colors: ergo-colors.penumbra-light,  
    styles: ergo-styles.classic, 
    breakable: true,
    inline-qed: true
)

//start document
#maketitle(
  title: "Math 237A HW 6",
  authors: ("Zih-Yu Hsieh",),
  date: datetime.today().display("[month repr:long] [day], [year]"),
)

= D//1
#problem[
  Lazarsfeld Problem Set 5 (2):

  Let $f:X arrow.r Y$ be a dominant morphism of irreducible (quasi-projective) varieties. Prove that $dim Y<= dim X$.
][
  Given that $f:X arrow.r Y$ is a dominant morphism, then the induced ring homomorphism $f^*:k[Y] arrow.r k[X]$ is injective. Which, such ring homomorphism can be extended to the field homomorphism between their fraction fields, say $overline(f^*):k(Y) arrow.r k(X)$ (or between their field of rational functions).

  Now, suppose $dim Y=n$, then there exists an algebraically independent subset over $k$ with length $n$, say $g_1,...,g_n in k(Y)$. So, the field homomorphism $overline(f^*)$ must have $overline(f^*)(g_1),...,overline(f^*)(g_n) in k(X)$ be algebraically independent also:
  
  Suppose the contrary that they're algebraically dependent, then there exists $p(x_1,...,x_n) in k[x_1,...,x_n]$, such that $p(overline(f^*)(g_1),...,overline(f^*)(g_n))=0$. Then, since $overline(f^*)$ is a field homomorphism, one has $0=p(overline(f^*)(g_1),...,overline(f^*)(g_n)) = overline(f^*)(p(g_1,...,g_n))$, showing $p(g_1,...,g_n)=0$ by the injectivity of field homomorphism. So, $g_1,...,g_n$ is no longer algebraically independent over $k$, which is a contradiction.

  So, $overline(f^*)(g_1),...,overline(f^*)(g_n) in k(X)$ is algebraically independent over $k$, showing $n <= "trdeg"_k k(x)=: dim X$. Hence, $dim Y<=dim X$.
]

#set enum(numbering: "(a)")
= ND//2
#problem[
  Lazarsfeld Problem Set 5 (3):

  Given $d>=2$, denote by $PP^(N(d))$ the projective space parametrizing all plane curves of degree $d$. (So $N(d)=mat(d+2;2)-1$).
  + Show that if $d=2$, then there is a dense open subset $U subset PP^5$ such that all conics corresponding to points in $U$ are projectively equivalent, i.e. differ by a linear change of coordinates.
  + On the other hand, prove that the analogous statement fails when $d>=3$.

  Note: You may grant that $SL(n+1)$ is irreducible. You will want to observe that it has dimensoin $= (n+1)^2-1$.
][]

= ND//3
#problem[
  Lazarsfeld Problem Set 5 (4):
  
  Find the dimension of the space $M_(n times m)^(<=r)$ of all $n times m$ matrices of rank $<=r$.
][]

= ND//4
#problem[
  Hartshorne 1.1.10:

  + If $Y$ is any subset of a topological space $X$, then $dim Y<= dim X$.
  + If $X$ is a topological space which is covered by a family of open subsets ${U_i}$, then $dim X=sup dim U_i$.
  + Give an example of a topological space $X$ and a dense open subset $U$ with $dim U< dim X$.
  + If $Y$ is a closed subset of an irreducible finite-dimensional topological space $X$, and if $dim Y=dim X$, then $Y=X$.
  + Give an example of a Noetherian topological space of infinite dimension.
][]