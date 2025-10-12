#import "../../macros.typ": *

//setup basics
#import "@preview/rubber-article:0.4.1": *
#import "@preview/ergo:0.1.0": *
#import "@preview/fletcher:0.5.5" as fletcher: *

//basic template setup
#show: article.with(
  header-display: true,
  eq-numbering: "(1.1)",
  eq-chapterwise: true,
  margins: 1.0in,
)
#show: ergo-init.with(
    colors: "bootstrap",  
    headers: "classic", //"tab" for upper bar, classic for the one I used, sidebar for the emphasis on the left
    all-breakable: true,
    inline-qed: true
)

//start document
#maketitle(
  title: "Math 237A HW 3",
  authors: ("Zih-Yu Hsieh",),
  date: datetime.today().display("[month repr:long] [day], [year]"),
)

= D//1
#problem[
  Lazarsfeld Problem Set 2 (4):

  Let $X subset.eq AA^(n^2)$ be the locus 
  $ X={A in M_(n times n)|det(A)=0} $
  (so $X=M_(n times n)^(<=n-1)$). Prove that $X$ is birationally isomorphic to $AA^(n^2-1)$.
][
  
  Let $AA^(n^2) = M_(n times n)$, where the indeterminates are $(x_(i j))_(1<=i,j<=n)$. Similarly, characterize $AA^(n^2-1)$ as the space with indeterminates $(x_(i j))_(1<=i,j<=n)$ while $x_(1 1)$ is not allowed (i.e. every coordinate besides the top left one for $M_(n times n)$). 

  Define projection $pi:AA^(n^2) arrow.r AA^(n^2-1)$ by projection every coordinate $x_(i j)$ (where $(i,j)!=(1,1)$) onto $AA^(n^2-1)$ (this is guaranteed to be surjective). We'll first prove that this projection is bijective when restricting to some open subset of $M_(n times n)^(<=n-1)$ (under subspace topology) and some open subset in $AA^(n^2-1)$, and derive its rational inverse to show it's a birational equivalence.

  \ 

  First, let $X_(i j)$ denote the $(n-1) times (n-1)$minor of $X = (x_(i j))_(1<=i,j<=n)$ by deleting the $i^upright(t h)$ row and $j^upright(t h)$ column. Then, the determinant polynomial can be rewrite as follow:
  $ det(X) = sum_(j=1)^n (-1)^(j+1)x_(1 j)det(X_(1 j)) $
  Let $Y = {A in AA^(n^2-1) | det(A_(11))=0}$ (i.e. the set of matrices excluding $x_(11)$ entry, whose $(n-1) times (n-1)$ minor after deleting row and column $1$ has determinant $0$), and consider $U = AA^(n^2-1)\\Y$ as the open dense subset (which are every matrix excluding $x_(1 1)$ entry, with the bottom right$(n-1) times (n-1)$ minor being invertible).

  Which, for all $P in U$, since it gathers $n^2-1$ elements from $k$, except for the $x_(1 1)$ entry, then let $X_P$ denotes the $n times n$ matrix with $x_(1 1)$ as indeterminate (while the other entries corresponds to $P$), then $det(X_P) in k[x_(11)]$, and it's a degree $1$ polynomial (since $x_(11)$ has coefficient $(-1)^(j+1)det(P_(11))$ based on the above formula, where $P_(11)$ is the bottom right $(n-1) times (n-1)$ minor of $P in AA^(n^2-1)$, hence $det(P_(11))!=0$). Then, since $k$ is assume to be algebraically closed, $det(X_P)$ as a degree $1$ polynomial in $x_(11)$ has a unique solution, say $p_(11)$. Then, the matrix $P'$ that has $(1,1)$ entry being $p_(11)$ and other entries corresponding to $P$, satisfies $det(P')=0$, hence $P' in M_(n times n)^(<=n-1)$, while $det(P'_(11))=det(P_(11))!=0$. This shows that $P in im(pi)$, or $AA^(n^2-1) = im(pi)$, which $pi$ is surjective.

  In particular, if we let $U' = {A in AA^(n^2)|det(A_(11))!=0}$ be the corresponding open subset, then $M_(n times n)^(<=n-1) sect U'$ as an open subset under subspace topology of $M_(n times n)^(<=n)$, the restriction of the projection $pi:U' sect M_(n times n)^(<=n-1) arrow.r U$ forms a one-to-one correspondance (since if $det(X_(11))!=0$, then $x_(11)$ is uniquely determined by other entries, while $pi$ is surjective).

  \ 

  Based on the determinant function in (1.2), if $det(X_(11))!=0$ for a matrix $X$ (satisfying $det(X)=0$, or $X in M_(n times n)^(<=n-1)$), then $x_(11)$ is determined as follow:
  $ 0 = x_(11) det(X_(11)) +sum_(j=2)^n (-1)^(j+1)x_(1j)det(X_(1j)) ==> x_(11)=1/det(X_(11))sum_(j=2)^n (-1)^j x_(1j) det(X_(1j)) $
  Now, let $phi:AA^(n^2-1)arrow.r.dashed X$ be defined on $U$, as $phi(P) = overline(P)$, where $overline(P)$ has entries $p_(i j)$ (where $(i,j)!=(1,1)$) provided by $P$, and $p_(11) = 1/(det(P_(11)))sum_(j=2)^n (-1)^j p_(1 j)det(P_(1 j))$. Then, for all $A in M_(n times n)^(<=n-1) sect U'$, one has $phi compose pi(P')=P'$ for all $P'$ in the intersection (since $p_(11)$ is purely determined the same way), while $pi compose phi(P) = P$ for all $P in U$. Hence, this forms a birational equivalence (on the restricted open dense subsets of $M_(n times n)^(<=n-1)$ and $U subset.eq AA^(n^2-1)$).
]

= ND//2
#problem[
  Lazarsfeld Problem Set 3 (2):

  Consider the curve 
  $ {Y^2Z-X^3-X^2Z=0} subset.eq PP^2 $
  Draw the (restriction of) this curve in each of the affine planes $U_X={X!=0}$, $U_Y={Y!=0}$ and $U_Z={Z!=0}$. Indicate how the pictures fit together, i.e. how asymptotes in one view are reflected in another.
][
  Let $f(X,Y,Z) = Y^2Z-X^3-X^2Z in k[X,Y,Z]$.

  Fit $U_X$, with $X!=0$, then define variable $y:=Y/X$ and $z:= Z/X$, take $f_x(y,z) := f(1,y,z)$ in $k[y,z]$, $f_x(y,z)=y^2z-1-z$. Which, given its slice in $RR^2 subset.eq CC^2$, with horizontal and vertical axis being $y$ and $z$ respectively, we have the following graph:

  #text(weight: "bold")[insert graph for y,z]

  Similarly, fit $U_Y$, with $Y!=0$, define variable $x:=X/Y$ and $z:=Z/Y$, take $f_y(x,z) = f(x,1,z)$ in $k[x,z]$, $f_y(x,z)=z-x^3-x^2z$. Then, the slice in $RR^2$ with horizontal and vertical axis being $x$ and $z$ respectively, we have the following graph:

  #text(weight: "bold")[insert graph for x,z]

  Then, fit $U_Z$, with $Z!=0$, define variable $x:=X/Z$ and $y:=Y/Z$, take $f_z(x,y):= f(x,y,1)$ in $k[x,y]$, $f_z(x,y)=y^2-x^3-x^2$. Then, the slice in $RR^2$ with horizontal and vertical axis being $x$ and $y$ respectively, we have the following graph:

  #text(weight: "bold")[insert graph for x,y]

  To interpret the asymptotic behavior, first as $Z$ diverges, 
]

#pagebreak()

= ND//3
#problem[
  Lazarsfeld Problem Set 3 (4):

  Given an algebraic set $X subset.eq PP^n$, show that $X$ can be cut out by homogeneous polynomials all having the same degree, say $d$. (Note that we do not assert that these polynomials actually generate the full homogeneous ideal of $X$).
][

]

= D//4
#problem[
  Hartshorne 2.1:

  Prove the "homogeneous Nullstellensatz", which says if $frak(a) subset.eq S$ is a homogeneous ideal, and if $f in S$ is a homogeneous polynomial with $deg(f)>0$, such that $f(P)=0$ for all $P in Z(frak(a))$ in $PP^n$, then $f^q in frak(a)$ for some $q>0$. 

  (Hint: Interpret the problem in terms of the affine $(n+1)$-space whose affine coordinate ring is $S$, and use the usual Nullstellensatz).
][
  Let $Z_(PP^n)(frak(a))$ denotes all the zeros in $PP^n$, of homogeneous polynomials in $frak(a)$. Since there is a projection $pi:AA^(n+1)\\{0} arrow.r.twohead PP^n$, let $C(X):= pi^(-1)(X) union {0}$ be the #emph[Cone] of $X$. We'll verify that $C(X) = Z_(AA^(n+1))(frak(a))$ in $AA^(n+1)$.

  \ 

  To address this problem, we'll assume that $X!=emptyset$, then it implies $C(X)$ contains some nonzero element (since $pi^(-1)(X) subset.eq AA^(n+1)\\{0}$ is nonempty). Since $frak(a)$ is a homogeneous ideal, it is generated by some nonzero homogeneous polynomials, say $f_1,...,f_k in S$. Which, since there exists nonzero $p in C(X)$ such that $pi(p)=[p] in X$ serves as solution for all $f_i$, then each $f_i$ has degree $d_i>0$ (since if it's a constant polynomial, the only way it has solution is $f_i=0$, yet we already eliminated such possibility by assuming $f_i!=0$). Hence, with each $f_i$ being homogeneous, $0$ is a solution for all $f_i$, or $0 in Z_(AA^(n+1))(frak(a))$.

  For other nonzero points $p$, suppose $p in C(X)$, then since $pi(p)=[p] in X$ serves as a solution to all $f_i$, $p$ in particular is a solution to all $f_i$, hence all polynomials in $frak(a)$. This shows that $p in Z_(AA^(n+1))(frak(a))$.
  Else, if $p in Z_(AA^(n+1))(frak(a))$, it's clear that $p$ is a solution for all homogeneous polynomials in $frak(a)$, so is all $lambda p$ for any $lambda !=0$, hence $pi(p) = [p]$ serves as a solution for all homogeneous polynomials in $frak(a)$, showing that $[p] in Z_(PP^n)(frak(a)) = X$. Hence, $p in pi^(-1)(X) subset.eq C(X)$.

  So, since $0$ is in both $C(X)$ and $Z_(AA^(n+1))(frak(a))$, while all nonzero point $p$ satisfies $p in C(X) <==> p in Z_(AA^(n+1))(frak(a))$, then $C(X) = Z_(AA^(n+1))(frak(a))$.

  \ 

  Under this statement, given any homogeneous polynomial $f$ with $deg(f)>0$ (indicating that $0$ is a solution of $f$), if for all $P in X$ one has $f(P)=0$, then every nonzero $p in C(X)$ satisfies $f(pi(p))=f([p])=0$ (since $[p] in X$), showing that $f(p)=0$. Hence, every point in $C(X) = Z_(AA^(n+1))(frak(a))$ is a solution for $f$, using Hilbert's Nullstellensatz, $f in I(C(X)) = I(Z_(AA^(n+1))(frak(a))) = sqrt(frak(a))$, hence there exists positive $q in NN$, such that $f^q in frak(a)$.
]

#pagebreak()

#set enum(numbering: "(i)")
= D//5
#problem[
  Hartshorne 2.2:

  For a homogeneous ideal $frak(a) subset.eq S$, show that the following conditions are equivalent:
  + $Z(frak(a))=emptyset$;
  + $sqrt(frak(a)) = $ either $S$ or the ideal $S_+ = plus.circle.big_(d>0)S_d$;
  + $frak(a) supset.eq S_d$ for some $d>0$.
][

  (i) $==>$ (iii): Suppose $Z_(PP^n)(frak(a))=emptyset$, using the tools mentioned in class (also in the previous problem), the cone $C(emptyset) = {0}=Z_{PP^n}(frak(a))$, hence we get $sqrt(frak(a)) = I({0}) = (x_0,x_1,...,x_n)$. As a consequence, all index $0<=i<=n$ has a $q_i in NN$, such that $x_i^(q_i) in frak(a)$.

  Now, let $d=sum_(i=0)^n q_i$, we claim that $S_d subset.eq frak(a)$: Recall that $S_d$ are all homogeneous polynomials of degree $d$, in particular as a $k$-vector space, it is generated by all monomials $product_(i=0)^n x_i^(d_i)$, where $sum_(i=0)^n d_i = d$. Hence, to prove $S_d subset.eq frak(a)$, it suffices to show each of the mentioned monomial belongs to $frak(a)$. And, notice that given such monomial, if for some index $i$ it satisfies $d_i >= q_i$, then $product_(i=0)^n x_i^(d_i)$ is an $S$-multiple of $x_i^(q_i) in frak(a)$, showing that monomial $product_(i=0)^n x_i^(d_i) in frak(a)$. So, it suffices to show that each monomial with desired property has at least one index $i$ satisfying $d_i >= q_i$.

  Suppose the contrary that for some monomial $product_(i=0)^n x_i^(d_i)$ with $sum_(i=0)^n d_i=d$, has $d_i<q_i$ for all index $i$, then as a consequence $sum_(i=0)^n d_i<sum_(i=0)^n q_i=d$, which directly contradicts the assumption. Hence, given any monomial $product_(i=0)^n x_i^(d_i)$ with $sum_(i=0)^n d_i=d$ (i.e. a generator of $S_d$), there must exist one index $i$ with $d_i>= q_i$, showing that $product_(i=0)^n x_i^(d_i) in frak(a)$.
  Hence, $S_d subset.eq frak(a)$.

  \ 

  (iii) $==>$ (ii): Suppose $frak(a)supset.eq S_d$ for some $d>0$, to show (ii), assume that $sqrt(frak(a))!=S$, our goal is to show $sqrt(frak(a))=S_+$.

  Since $S_1$ is generated by linear combinations of $x_0,x_1,...,x_n in S$, since each $x_i^d in S_d subset.eq frak(a)$, then $x_i in sqrt(frak(a))$. Hence, $S_1 subset.eq sqrt(frak(a))$, showing that all monomial with $deg>0$ is contained in $sqrt(frak(a))$ (since all $deg>0$ monomials are $S$-multiples of some $x_i$). As a consequence, all polynomials with constant term being $0$ (i.e. $k$-linear combinations of monomials with $deg>0$) must also be contained in $sqrt(frak(a))$, showing that $S_+ = plus.circle_(d>0)S_d subset.eq sqrt(a)$.

  Finally, since $sqrt(frak(a))!=S$, then $sqrt(frak(a))$ cannot contain any unit in $S$, which implies $sqrt(frak(a))$ contains no nonzero constant polynomials, hence $sqrt(frak(a)) sect S_0 = {0}$. With $frak(a)$ and $sqrt(frak(a))$ both being homogeneous ideal (radical of a homogeneous ideal is still homogeneous), we have $sqrt(frak(a))=plus.circle_(d>=0)sqrt(frak(a)) sect S_d = {0} plus.circle_(d>0) sqrt(frak(a)) sect S_d = plus.circle_(d>0) sqrt(frak(a)) sect S_d subset.eq S_+$. This shows that $sqrt(frak(a))=S_+$.

  Hence, if $frak(a)supset.eq S_d$ for some $d>0$, then either $sqrt(frak(a))=S$ (equivalent to $frak(a)=S$), or $sqrt(frak(a))=S_+$.

  \ 

  (ii) $==>$ (i): Suppose $sqrt(frak(a))=S$ or $sqrt(frak(a))=S_+$, notice that the degree $1$ monomials $x_0,...,x_n in sqrt(frak(a))$, hence for some $q_0,...,q_n in NN$, one has $x_i^(q_i) in frak(a)$.

  Which, for all $[p] in PP^n$, since $p = (p_0,...,p_n) in AA^(n+1)$ has at least one entry being nonzero, say $p_j$ for some $j in {0,...,n}$, then since $p_j^(q_j)!=0$, we have $p in AA^(n+1)$ (or $[p] in PP^n$) not being a solution to $x_j^(q_j) in frak(a)$, showing that $[p]$ is not a solution for some homogeneous polynomial (in particular, monomial) in $frak(a)$, hence $[p] in.not Z_(PP^n)(frak(a))$. As a consequence, $Z_(PP^n)(frak(a))=emptyset$. 
]