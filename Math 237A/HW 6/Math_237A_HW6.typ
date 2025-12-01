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

#pagebreak()

#set enum(numbering: "(a)")
= part (a) ND//2
#problem[
  Lazarsfeld Problem Set 5 (3):

  Given $d>=2$, denote by $PP^(N(d))$ the projective space parametrizing all plane curves of degree $d$. (So $N(d)=mat(d+2;2)-1$).
  + Show that if $d=2$, then there is a dense open subset $U subset PP^5$ such that all conics corresponding to points in $U$ are projectively equivalent, i.e. differ by a linear change of coordinates.
  + On the other hand, prove that the analogous statement fails when $d>=3$.

  Note: You may grant that $SL(n+1)$ is irreducible. You will want to observe that it has dimensoin $= (n+1)^2-1$.
][
  + D

    \ 

  + Given $d>=3$, notice that $mat(d+2;2) = ((d+2)(d+1))/2 >= (5 dot 4)/2 = 10$, $PP^(N(d))$ (the space of all plane curves of degree $d$) has dimension $>=10$. But, if using the same method as in part (a), since $dim SL(3) = 8$, there is no dense subset in $PP^(N(d))$ so that $SL(3)$ can map surjectively onto through a morphism like in part (a), simply because the dimension of the image must be $<=8$, which has closure at most dimension $9$ (hence cannot cover the whole space, since the space has dimension $>=10$). Therefore, the image cannot be dense, showing such claim fails.
]

= ND//3
#problem[
  Lazarsfeld Problem Set 5 (4):
  
  Find the dimension of the space $M_(n times m)^(<=r)$ of all $n times m$ matrices of rank $<=r$.
][]

#pagebreak()

= part (b) ND//4
#problem[
  Hartshorne 1.1.10:

  + If $Y$ is any subset of a topological space $X$, then $dim Y<= dim X$.
  + If $X$ is a topological space which is covered by a family of open subsets ${U_i}$, then $dim X=sup dim U_i$.
  + Give an example of a topological space $X$ and a dense open subset $U$ with $dim U< dim X$.
  + If $Y$ is a closed subset of an irreducible finite-dimensional topological space $X$, and if $dim Y=dim X$, then $Y=X$.
  + Give an example of a Noetherian topological space of infinite dimension.
][
  + Let $n= dim Y$, then there exists a maximal chain of irreducible closed subsets $Z_0 subset.neq Z_1 subset.neq... subset.neq Z_n subset.eq Y$ (under subspace topology). Now, for all index $i$, if consider $overline(Z_i) subset.eq X$ (under topology of $X$), one has $Z_i = overline(Z_i) sect Y$ (since closure in the original space then take the intersection, is the same as taking the intersection then take the closure under subspace topology). So, $Z_i subset.neq Z_(i+1) ==> overline(Z_i) subset.neq overline(Z_(i+1))$. Hence, we also have a chain of closed subsets $overline(Z_0) subset.neq overline(Z_1) subset.neq ... subset.neq overline(Z_n) subset.eq X$.

    Finally, notice that this chain is consist of irreducible closed subsets, since $Z_i$ is irreducible under subspace topology of $Y$ implies it's irreducible under topology of $X$ (since inclusion map $iota:Y arrow.hook X$ is continuous, one must have $Z_i$ irreducible getting sent to $iota(Z_i) = Z_i$, which is also irreducible). So, using the fact that closure of an irreducible subset is irreducible, each $overline(Z_i) subset.eq X$ is irreducible.

    Hence, $overline(Z_0) subset.neq overline(Z_1) subset.neq ... subset.neq overline(Z_n) subset.eq X$ is a chain of irreducible closed subsets with length $n$ in $X$, showing $dim Y = n<= dim X$.

    \ 

  + Using part (a), it's clear first that for any $i in I$ (the index set of ${U_i}$), one has $dim U_i <= dim X$, hence one must have $sup dim U_i <= dim X$ (since $dim X$ forms an upper bound of all $dim U_i$).

    \ 

  + Consider the following topology on the set ${1,2,3}$:
        #figure(
        image("q4_3.jpg", width: 70%),
        caption: [
          Provided Topology on the 3-point set
        ],
      )
    Where, the red circles represent all the open sets, and the blue rectangles represent all the closed sets. Notice that every nonempty closed set $C$ is irreducible, since the closed subsets for a proper chain of inclusion, so every proper closed subset of $C$ unions to be a proper subset of $C$, so $C$ cannot be written as unions of two proper closed subsets, hence irreducible.

    First, notice that $X={1,2,3}$ under this topology has $dim X=2$ (since counting nonempty irreducible closed subsets, there are total of 3 forming a proper chain of inclusions).

    Now, consider the open subset $U = {1,2}$ (the second largest red circle). It satisfies $overline(U) = X = {1,2,3}$, since the only closed subset containing both $1$ and $2$ is ${1,2,3}$ (the largest blue rectangle). Also, if consider the subspace topology of $U$, the only closed sets are $emptyset, {2},$ and ${1,2}=U$ (again, both nonempty closed subsets are irreducible using the same claim as before). As a result, $dim U = 1$ (since only two irreducible closed subsets exist, and form a proper chain of inclusion).

    So, $U$ is dense in $X$, while $dim U=1<2 = dim X$.

    \ 

  + If $Y$ is a closed subset of $X$, then any of its irreducible closed subset $Z subset.eq Y$ (under subspace topology of $Y$) is also an irreducible closed subset in $X$ (since under inclusion map $iota:Y arrow.hook X$, $iota(Z) = Z$ is irreducible in $X$; while there exists closed set $C subset.eq X$, such that $Z = C sect Y$, so $Z$ is also closed under topology of $X$ because $Y$ is closed).

    Then, suppose the contrary that $Y!= X$, with $X$ being irreducible, let $Z_0 subset.neq Z_1 subset.neq ... subset.neq Z_n subset.eq Y$ be a maximal chain of irreducible subsets with length $n$ (under subspace topology of $Y$), including into $X$, one has $Z_0 subset.neq Z_1 subset.neq ... subset.neq Z_n subset.neq X$ be a chain of irreducible subsets with length $n+1$ (since $X$ is irreducible, and $Y subset.neq X$ implies $Z_n subset.neq X$). So, it shows that $dim X >= n+1 > n=dim Y$, which contradicts the assumption that $dim X=dim Y$. Hence, $Y=X$ is enforced.

    \ 

  + Consider the natural number $NN$, and impose a topology so that the open sets are in the form $U_n := {n+1,n+2,...}$ and empty set $emptyset$ (which, including $-1$ so that $U_(-1) = NN$). Which, the closed sets are instead in the form $C_n := NN\\ U_n = {0,1,...,n-1,n}$.Pictorially, we have the following:

        #figure(
        image("q4_5.jpg", width: 70%),
        caption: [
          Provided Topology on $NN$
        ],
      )
    Notice that for any ascending chain of open sets, say $U^((1)) subset.eq U^((2)) subset.eq... subset.eq U^((n)) subset.eq ...$, since each $U^((n)) = U_(k_n)$ for some $k_n in NN$, with $U_(k_n) subset.eq U_(k_(n+1))$, it enforces $k_(n+1)<= k_n$. So, since the defining integers satisfy $k_1 >= k_2 >= ... >= k_n >= ...>=-1$, then it must stabilize at some $n in NN$, showing for integer $l>=n$, one has $k_l = k_n$, or $U^((l)) = U_(k_l) = U_(k_n) = U^((n))$. Hence, all ascending chain of open subsets eventually stabilize, such topology makes $NN$ into a Noetherian space.

    \ 

    Also, every nonempty closed set $C$ is irreducible, since the closed sets form a proper chain of inclusion, hence alll the proper closed subsets of $C$ (where there's only finitely many) must union to be a proper closed subset, showing $C$ can't be written as unions of proper closed subsets.

    \ 

    Finally, $NN$ under this topology has infinite dimension, simply because the irreducible closed subsets form an infinite strict ascending chain.
]