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
  title: "Math 231A HW 9 (Final)",
  authors: ("Zih-Yu Hsieh",),
  date: datetime.today().display("[month repr:long] [day], [year]"),
)

=  ==> ND//1
#problem[
  Etingof Problem Sets 6.2:

  Show that for $frak(g)=gl(n,CC)$, the definition of a semisimple element (an element $x$ such that $ad x$ is a semisimple operator) coincides to the usual definition of a semisimple operator.
][
  The goal is to show that $x in frak(g)$ (as a matrix in $gl(n,CC):= M_(n times n)(CC)$) has $ad x in End(frak(g))$ being a semisimple operator $<==>$ $x in End(CC^n)$ is a semisimple operator. (Note: Here assume that $x in gl(n,CC)$ is a matrix under standard basis).

  \ 

  $==>:$

  \ 

  $<==:$ Suppose $x in End(CC^n)$ is a semisimple operator (wich over $CC$ it's equivalent to diagonalizability), then there exists basis $alpha = {v_1,...,v_n} subset CC^n$, such that the matrix of $x$ under this basis is diagonal, which denotes as $D_x := cal(M)(x, alpha) = mat(lambda_1,dots,0;dots.v,dots.down,dots.v;0,dots,lambda_n)$ (where $lambda_i$ are not necessarily distinct). Which, let the matrix $P:= mat(|,dots,|;v_1,dots,v_n;|,dots,|)$ be the matrix formed by $v_1,...,v_n$ (as column vectors under standard basis of $CC^n$), then as a matrix, one has $x = P D_x P^(-1)$ (since $P$ is a change of basis matrix from basis $alpha$ to standard basis).

  Now, observe that each elementary matrix $E_(i j)$ (with the $i^upright(t h)$ row $j^upright(t h)$ column entry being $1$, and the rest being $0$) satisfies the following:
  $ ad D_x (E_(i j)) = D_x E_(i j)-E_(i j)D_x = lambda_i E_(i j)-lambda_j E_(i j)=(lambda_i - lambda_j)E_(i j) $
  Hence, the basis ${E_(i j)}_(1<=i,j<=n) subset frak(g)$ are also eigenvectors of $ad D_x$. 

  Then, we claim that the collection ${P E_(i j)P^(-1)}_(1<=i,j<=n) subset frak(g)$ is a basis such that the elements are eigenvectors of $ad x$:
  - To show it's a basis, it suffices to show it's linearly independent (since $dim frak(g) = n^2$, and the list has length $n^2$): If $sum_(i,j)a_(i j)P E_(i j)P^(-1) = P(sum_(i,j)a_(i j)E_(i j))P^(-1) = 0$, one has $sum_(i,j)a_(i j)E_(i j)=0$, hence each $a_(i j)=0$ (by linear independenc of ${E_(i j)}_(1<=i,j<=n)$). So, the list is linearly independent, hence a basis.
  - Each of them is an eigenvector of $ad x$, because they satisfy the following:
    $ ad x(P E_(i j)P^(-1)) &= x (P E_(i j)P^(-1))-(P E(i j)P^(-1))x\ 
    &= (P D_x P^(-1))(P E_(i j)P^(-1)) -(P E_(i j)P^(-1))(P D_x P^(-1))\ 
    &= P(D_x E_(i j)-E_(i j)D_x)P^(-1)\ 
    &= P(ad D_x (E_(i j)))P^(-1)\ 
    &= (lambda_i - lambda_j)P E_(i j)P^(-1) $

  So, ${P E_(i j)P^(-1)}_(1<=i,j<=n) subset frak(g)$ is indeed a basis, consists of eigenvectors of $ad x$, showing $ad x in End(frak(g))$ is a semisimple operator, hence $x in frak(g)$ is a semisimple element.
]

\ 

= D//2
#problem[
  Etingof Problem Sets 6.3:

  Show that if $frak(h) subset frak(g)$ is a Cartan subalgebra in a complex semisimple Lie algebra, then $frak(h)$ is a nilpotent subalgebra which coincides with its normalizer $n(frak(h)) = {x in frak(g) | ad x dot frak(h) subset frak(h)}$. (This is the usual definition of a Cartan subalgebra which can be used for any Lie algebra, not necessarily a semisimple one).
][
  First, based on Etingof's Lecture Notes, Cartan Subalgebra is defined to be a Toral subalgebra $frak(h)$ (a subalgebra consists of semisimple elements) such that $frak(g)_0 = frak(h)$. So, since $frak(h)$ is a toral subalgebra (in particular, it's abelian), it is nilpotent (since $[frak(h),frak(h)]=0$).

  \ 

  It's clear that $frak(h) subset.eq n(frak(h))$, since for all $x,y in frak(h)$, one has $ad x(y) = [x,y] = 0 in frak(h)$, showing $ad x dot frak(h) subset frak(h)$, or $x in n(frak(h))$. 
  
  Now, given any $x in n(frak(h))$ and $y in frak(h)$, one has $ad x(y) = [x,y] in frak(h) = frak(g)_0$, so this implies that $ad y([x,y]) = -(ad y)^2(x) = 0$. But, since $y$ is semisimple / diagonalizable (since $frak(h)$ is a Toral subalgebra, and over $CC$ semisimple and diagonalizable are equivalent), $(ad y)^2(x)=0$ implies $ad y(x)=0$ (since any diagonalizable operator $T$ has a stabilized kernel, i.e. $ker(T) = ker(T^n)$ for all integer $n>0$), hence $x in frak(g)_0 = frak(h)$ (since $ad y(x)=0$ for all l$y in frak(h)$). So, one concludes that $n(frak(h)) subset.eq frak(h)$.

  \ 

  As a result, $n(frak(h)) = frak(h)$, showing a Cartan Subalgebra of a complex semisimple Lie algebra, is both Nilpotent, and being precisely its own normalizer.
]

\ 

= ND//3
#problem[
  Etingof Problem Sets 6.4:

  Let $frak(g)$ be a complex Lie algebra which has a root decomposition:
  $ frak(g)=frak(h) plus.circle plus.circle.big_(alpha in R)frak(g)_alpha $
  where $R$ is a finite subset in $frak(h)^*\\{0}$, $frak(h)$ is commutative and for $h in frak(h)$, $x in frak(g)_alpha$, we have $[h,x] = langle h,alpha rangle x$. Show that then $frak(g)$ is semisimple, and $frak(h)$ is a Cartan subalgebra.
][]

\ 

= D//4
#problem[
  Etingof Problem Sets 6.5:

  Let $frak(h) subset so(4,CC)$ be the subalgebra consisting of matrices of the form 
  $ mat(0,a,0,0;-a,0,0,0;0,0,0,b;0,0,-b,0) $
  Show that then $frak(h)$ is a Cartan subalgebra and find the corresponding root decomposition.
][
  First, define the following elements as basis of $so(4,CC)$:
  $ &J_1:=mat(0,1,0,0;-1,0,0,0;0,0,0,0;0,0,0,0), quad J_2:=mat(0,0,1,0;0,0,0,0;-1,0,0,0;0,0,0,0), quad J_3:=mat(0,0,0,1;0,0,0,0;0,0,0,0;-1,0,0,0)\ 
  &J_4:=mat(0,0,0,0;0,0,1,0;0,-1,0,0;0,0,0,0), quad J_5:=mat(0,0,0,0;0,0,0,1;0,0,0,0;0,-1,0,0), quad J_6:=mat(0,0,0,0;0,0,0,0;0,0,0,1;0,0,-1,0) $
  Which, $frak(h):= span{J_1,J_6}$. 

  \ 

  #text(weight: "bold")[I. $frak(h)$ is Abelian:]

  First, $frak(h)$ is a subalgebra, in particular because it is abelian due to the following relation:
  $ [J_1,J_6] &= mat(0,1,0,0;-1,0,0,0;0,0,0,0;0,0,0,0)mat(0,0,0,0;0,0,0,0;0,0,0,1;0,0,-1,0)-mat(0,0,0,0;0,0,0,0;0,0,0,1;0,0,-1,0)mat(0,1,0,0;-1,0,0,0;0,0,0,0;0,0,0,0)= 0 - 0 = 0 $
  Hence, given any $a,b,c,d in CC$, one has $[a J_1+b J_6,c J_1+d J_6] = a c[J_1,J_1]+(a d-b c)[J_1,J_6] + b d[J_6,J_6] = 0$, showing $frak(h)$ is abelian.

  \ 

  #text(weight: "bold")[II. $frak(h)$ is Toral:]

  To show that $frak(h)$ is toral, we'll show all elements in here are semisimple, in particular we'll show that $J_1,J_6$ are semisimple by finding their eigenvalues / eigenvectors.

  Given any $a,b in CC$, consider the following commutation relations of $a J_1+b J_6$ with the remaining basis elements:
  $ &[a J_1+b J_6, J_2]=-b J_3-a J_4, quad [a J_1+b J_6,J_3]=b J_2-a J_5\ 
  &[a J_1+b J_6, J_4] = a J_2-b J_5, quad [a J_1 + b J_6,J_5] = a J_3+b J_4 $
  Which, given any $sum_(i=1)^6 c_i J_i$, one has the following:
  - Suppose it's an eigenvector of $ad J_1$ with eigenvalue $lambda$ (which $a=1,b=0$), then one has the following:
    $ sum_(i=1)^6 lambda dot c_i J_i &= [J_1, sum_(i=1)^6 c_i J_i] = c_2 dot (-J_4) + c_3 dot (-J_5) + c_4 dot J_2 + c_5 dot J_3 $
    Hence, one has $lambda dot c_1=lambda dot c_6=0$, $lambda dot c_2=c_4$, $lambda dot c_3=c_5$, $lambda dot c_4=-c_2$, and $lambda dot c_5 = -c_3$
    - The first relation $lambda dot c_1=lambda dot c_6=0$ has one possible solution $lambda=0$. Which, this enforces $c_2=c_3=c_4=c_5=0$, showing $sum_(i=1)^6 c_i J_i = c_1 J_1+c_6 J_6 in frak(h)$ (this is also an equivalent statement, where $lambda=0$ iff $sum_(i=1)^6 c_i J_i in frak(h)$, because of the coefficient).
    - Now, suppose $sum_(i=1)^6 c_i J_i in.not frak(h)$, which implies one of the $c_2,c_3,c_4,c_5 != 0$. For definiteness say $c_2!=0$, then one has $c_4=lambda c_2$ and $-c_2 = lambda c_4$, showing $-c_2 = lambda^2 c_2$, or $(lambda^2+1)c_2=0$, hence $lambda^2=-1$, showing $lambda = pm i$. Which, they provide the following relations:
  $ &"(a)" lambda = i " " ==> (c_2,c_3,c_4,c_5) = (c_2,c_3,i c_2,i c_3)\ 
    &"(b)" lambda = -i " " ==> (c_2,c_3,c_4,c_5) = (c_2,c_3,-i c_2,-i c_3) $

  - Suppose it's an eigenvector of $ad J_6$ with eigenvalue $mu$ (which $a=0,b=1$), then one has the following:
    $ sum_(i=1)^6 mu dot c_i J_i=[J_6, sum_(i=1)^6c_i J_i] = c_2 dot (-J_3) + c_3 dot J_2+c_4 dot (-J_5)+c_5 dot J_4 $
    Hence, one has $mu dot c_1=mu dot c_6=0$, $mu dot c_2=c_3$, $mu dot c_3=-c_2$, $mu dot c_4=c_5$, and $mu dot c_5=-c_4$.

    Again if $mu=0$ is equivalent to $sum_(i=1)^6 c_i J_i = c_1 J_1+c_6 J_6 in frak(h)$; else if $sum_(i=1)^6 c_i J_i in.not frak(h)$ (i.e. one of the $c_2,c_3,c_4,c_5$ is nonzero), one can prove again that $mu = pm i$. Which, they provide the following relations:
    $ &"(c)" mu=i " " ==> (c_2,c_3,c_4,c_5) = (c_2,i c_3, c_4, i c_5)\ 
    &"(d)" mu = -i " " ==> (c_2,c_3,c_4,c_5) = (c_2,-i c_3, c_4, -i c_5) $
  
  Which, combining the relations (a),(b),(c),(d), one gets:
  $ &(a),(c) ==> (c_2,c_3,c_4,c_5)=(c_2,i c_2, i c_2, -c_2)\ 
  &(a),(d) ==> (c_2,c_3,c_4,c_5)=(c_2,-i c_2, i c_2, c_2)\
  &(b),(c) ==> (c_2,c_3,c_4,c_5)=(c_2,i c_2, -i c_2, c_2)\ 
  &(b),(d) ==> (c_2,c_3,c_4,c_5)=(c_2,-i c_2, -i c_2, -c_2) $
  Which, these four collection of entries in fact form a linearly independent set in $CC^4$, which mapping over to $so(4,CC)$ by corresponding the entries to $J_2,J_3,J_4,J_5$ respectively, the above four elements each are eigenvectors of $ad J_1$ and $ad J_6$, hence are eigenvectors of $ad (a J_1+b J_6)$ for any $a J_1+b J_6 in frak(h)$; together with $ad x eval(#200%)_frak(h) = 0$ for any $x in frak(h)$, this shows that $ad x$ has eigenvectors that span the whole $so(4,CC)$ (for all $x in frak(h)$), showing all $x in frak(h)$ are semisimple elements, hence $frak(h)$ is toral.

  \ 

  #text(weight: "bold")[III. $frak(h)$ is a Cartan Subalgebra:]

  From #text(weight: "bold")[II], it's clear that if $sum_(i=1)^6 c_i J_i$ is a common zero eigenvector of elements in $frak(h)$, implies $sum_(i=1)^6 c_i J_i = c_1 J_1+c_6 J_6 in frak(h)$ (since any zero eigenvector of $ad J_1$ and $ad J_6$ has proven to be in $frak(h)$), so one has $frak(g)_0 subset.eq frak(h)$ (since for any $y in frak(g)_0$, any $x in frak(h)$ has $ad x(y) = 0$, choose $x=J_1, J_6$ implies $y in frak(h)$); also, since $frak(h)$ is abelian (proven in #text(weight: "bold")[I]), then any $x,y in frak(h)$ has $ad x(y) = 0$, showing $y in frak(g)_0$, or $frak(h) subset.eq frak(g)_0$.

  Hence, $frak(g)_0=frak(h)$, showing $frak(h)$ is a Cartan Subalgebra (based on the definition in Etingof's Lecture Notes).

  \ 

  #text(weight: "bold")[IV. Root Decomposition of $so(4,CC)$ by $frak(h)$:]

  Using the relations in #text(weight: "bold")[II], let $lambda = pm i$, $mu = pm i$ be the eigenvalues of $ad J_1, ad J_6$ respectively, then their common eigenvectors are of the following form:
  $ &(a),(c) ==> (c_2,c_3,c_4,c_5)=(c_2,i c_2, i c_2, -c_2), quad v_(i,i) = c_2(J_2+i J_3 + i J_4 - J_5)\ 
  &(a),(d) ==> (c_2,c_3,c_4,c_5)=(c_2,-i c_2, i c_2, c_2), quad v_(i,-i) = c_2(J_2-i J_3 + i J_4 + J_5)\
  &(b),(c) ==> (c_2,c_3,c_4,c_5)=(c_2,i c_2, -i c_2, c_2), quad v_(-i,i) = c_2(J_2+i J_3 - i J_4 + J_5)\ 
  &(b),(d) ==> (c_2,c_3,c_4,c_5)=(c_2,-i c_2, -i c_2, -c_2), quad v_(-i,-i) = c_2(J_2-i J_3 - i J_4 + J_5) $
  Where $v_(lambda, mu)$ denotes the eigenvector of $ad J_1, ad J_6$ with eigenvalue $lambda, mu$ respectively (where $lambda, mu=pm i$). Which, for any $a,b in CC$, this implies the following: 
  $ &ad (a J_1+b J_6) dot v_(lambda, mu) = a dot lambda v_(lambda, mu) + b dot mu v_(lambda, mu) = (a lambda + b mu)v_(lambda, mu) $
  Hence, each $v_(lambda, mu)$ is a common eigenvector for all $x = a J_1+b J_6 in frak(h)$, with eigenvalue $a lambda + b mu$.
  Then, define linear functionals $alpha_(lambda, mu) in frak(h)^*$ as follow for $lambda, mu=pm i$:
  $ alpha_(lambda, u)(a J_1+b J_6):= a lambda + b mu $
  Then, the above relations shows that $CC v_(lambda, mu) = frak(g)_(alpha_(lambda, mu))$. Hence, with each $v_(lambda, mu)$ being linearly independent (and together with $J_1, J_6 in frak(h)$, one can see $J_1,J_6, v_(i,i), v_(i,-i), v_(-i,i), v_(-i,-i)$ is a linearly independent list, hence a basis for $so(4,CC)$), then one has the following root decomposition of $so(4,CC)$:
  $ so(4,CC) = (CC J_1plus.circle CC J_6) plus.circle (plus.circle.big_(lambda, mu=pm i)CC v_(lambda, mu)) = frak(h) plus.circle (plus.circle.big_(lambda, mu=pm i)frak(g)_(alpha_(lambda, mu))) $
  Where, a root system for the above decomposition is $R = {alpha_(lambda, mu) | lambda, mu=pm i}$, and each $alpha_(lambda, mu) in frak(h)^*$ satisfies $alpha_(lambda,mu)(a J_1+b J_6) = a lambda + b mu$.
]

#pagebreak()

#set enum(numbering: "(1)")
= ND//5
#problem[
  + Define a bilinear form $B$ on $W = Lambda^2 CC^4$ by $w_1 and w_2 = B(w_1,w_2)e_1 and e_2 and e_3 and e_4$. Show that $B$ is a symmetric non-degenerate form and construct an orthonormal basis for $B$.
  + Let $frak(g)=so(W,B) = {x in gl(W) | B(x w_1,w_2) + B(w_1,x w_2)=0}$.Show that $frak(g) tilde.equiv so(6,CC)$.
  + Show that the form $B$ is invariant under the natural action of $sl(4,CC)$ on $Lambda^2CC^4$.
  + Using results of the previous parts, construct a homomrphism $sl(4,CC)-> so(6,CC)$ and prove that it is an isomorphism.
][
  + First, recall that $Lambda^2 CC^4$ has basis ${e_1 and e_2, e_1 and e_3, e_1 and e_4, e_2 and e_3, e_2 and e_4, e_3 and e_4}$. Which, given $w_1 = sum_(i<j)c_(i j)e_i and e_j, w_2 = sum_(k<l)d_(k l)e_k and e_l in Lambda^2 CC^4$, one has the following relation:
    $ w_1 and w_2 = (c_(12)d_(34)-c_(13)d_(24)+c_(14)d_(23)+c_(23)d_(14)-c_(24)d_(13)+c_(34)d_(12))e_1 and e_2 and e_3 and e_4 $
    So, one has $B(w_1,w_2) = (c_(12)d_(34)-c_(13)d_(24)+c_(14)d_(23)+c_(23)d_(14)-c_(24)d_(13)+c_(34)d_(12))$. Which, this form is symmetric, since $B(w_2,w_1)$ is done by swapping the coefficients $c$ and $d$, which provides the following:
    $ B(w_2,w_1)=(d_(1 2)c_(3 4)- d_(1 3)c_(24)+d_(14)c_(23)+d_(23)c_(14)-d_(24)c_(13)+d_(34)c_(12)) = B(w_1,w_2) $
    This shows that $B$ is symmetric.

    Then, to show it's non-degenerate, it suffices to check the non-degeneracy for the provided basis:
    $ &B(e_1 and e_2, e_3 and e_4) = 1, quad B(e_1 and e_3, e_2 and e_4) = -1, quad B(e_1 and e_4, e_2 and e_3) = 1 $
    Which, by symmetric property of $B$, the above shows the non-degeneracy on all the basis elements, showing $B$ is non-degenerate.

    Finally, notice that $B(e_i and e_j, e_k and e_l)=0$ if ${i,j} sect {k,l}!=emptyset$ (since if one of the basis elements appear more than once, the wedge product is $0$), then here is a proposed orthonormal basis based on such observation and the previous equations:
    $ {&f_1=1/sqrt(2)(e_1 and e_2+e_3 and e_4), f_2=i/sqrt(2)(e_1 and e_2 - e_3 and e_4),f_3=i/sqrt(2)(e_1 and e_3+e_2 and e_4),\ 
    &f_4=1/sqrt(2)(e_1 and e_3-e_2 and e_4), f_5=1/sqrt(2)(e_1 and e_4+e_2 and e_3), f_6=i/sqrt(2)(e_1 and e_4-e_2 and e_3)} $
    Which, they satisfied the following equations for normalizability (for simplicity, only the case involving $e_1 and e_2, e_3 and e_4$ will be demonstrated, since the rest is the same concept):
    $ &1/2 B(e_1 and e_2 + e_3 and e_4, e_1 and e_2 + e_3 and e_4) = 1/2 dot 2 B(e_1 and e_2, e_3 and e_4)=1\ 
    &-1/2 B(e_1 and e_2-e_3 and e_4, e_1 and e_2-e_3 and e_4) = -1/2  dot (-2) B(e_1 and e_2, e_3 and e_4) = 1 $
    Also, for orthogonality, it suffices to check the case between the two elements involving the same standard basis elements (for other ones, for instance between $x=1/sqrt(2)(e_1 and e_2+e_3 and e_4)$ and $y=1/sqrt(2)(e_1 and e_3-e_2 and e_4)$, notice that between any two standard basis elements involved in $x$ and $y$, the indices have nontrivial intersection, like in between $e_1 and e_2$ involved in $x$ and $e_1 and e_3$ involved in $y$, they shared $e_1$. So, one has $B(x,y)=0$). Which, for definiteness, using the ones involving $e_1 and e_2$ and $e_3 and e_4$, one has:
    $ i/2 B(e_1 and e_2+e_3 and e_4, e_1 and e_2-e_3 and e_4) &= i/2(B(e_3 and e_4, e_1 and e_2)-B(e_1 and e_2, e_3 and e_4))\ 
    &=0 $
    Which, the proposed list is indeed orthonormal under bilinear form $B$. Which, with the list having a length of $6= dim (Lambda^2 CC^4)$, it's an orthonormal basis under bilinear form $B$.

    \ 

    \ 

  + Using the orthonormal basis ${f_1,...,f_6}$ (with respect to $B$) proposed in (1), if consider $End(W)tilde.equiv M_(6 times 6)(CC) = gl(6,CC)$ under this basis, then for any operator $x in frak(g) subset.eq End(W)$, let $cal(M)(x) = (a_(i j))_(1<=i,j <=6)$ be the matrix, one has the following based on orthonormality:
    $ sum_(i=1)^6 a_(i j) f_i = x(f_j) = sum_(i=1)^6 B(x(f_j), f_i)f_i " " ==> a_(i j) = B(x(f_j),f_i) $
    Hence, with the characterization that $B(x w_1,w_2)+B(w_1, x w_2)=0$ (or $B(x w_1,w_2) = -B(x w_2, w_1)$), one has $a_(i j)=B(x f_j, f_i)=-B(x f_i, f_j) = -a_(j i)$.
    
    Hence, as a matrix one has $cal(M)(x) in so(6,CC)$. So, since the matrix representative under this basis one has $End(W) tilde.equiv M_(n times n)(CC) = gl(6,CC)$, with each $x in frak(g)$ corresponds to a matrix $cal(M)(x) = (a_(i j))$ such that $a_(i j)=-a_(j i)$ (which is a skew-symmetric matrix), one has $cal(M)(x) in so(6,CC)$, showing under the matrix map isomorphism $cal(M):End(W) arrow.tilde gl(n,CC)$, one has $cal(M)(frak(g)) subset.eq so(6,CC)$.

    Conversely, given any matrix $A = (a_(i j)) in so(6,CC)$, let $x := cal(M)^(-1)(A) in End(W)$, then its action on the basis element satisfies $a_(i j) = B(x(f_j), f_i)$ (which is true for general operators in $End(W)$), then by skew-symmetric property of $A$, $B(x(f_j), f_i) = a_(i j)=-a_(j i) = -B(x(f_i), f_j)$, or $B(x_(f_j),f_i) +B(f_j, x(f_i))=0$. With this action being true on all pairs of basis, element, one has $B(x w_1, w_2)+B(w_1, x w_2)=0$ for all $w_1,w_2 in W$. So, $x in frak(g)$. 
    
    This shows that $cal(M)^(-1)(so(6,CC)) subset.eq frak(g)$, or $so(6,CC) subset.eq cal(M)(frak(g))$, finally showing that $so(6,CC) = cal(M)(frak(g))$. With, $cal(M)$ being an isomorphism, $frak(g) tilde.equiv so(6,CC)$.

    \ 

    \ 

  + First, recall the fact that $B(w and x, y and z) = 0$, if ${w,x} sec {y,z}!=emptyset$; also, recall that for any $x in sl(4,CC)$ (where under the standard basis, let the matrix $x = (a_(i j))$, so $x(e_j) = sum_(i=1)^4a_(i j)e_i$), the action on the tensor product is given by $x dot (u tensor v):=(x dot u) tensor v+ + u tensor (x dot v)$. Which, given distinct indices $i,j,k,l$, one has the following result on the action of the bilinear form on the basis elements:
  $ B(x dot (e_i and e_j), e_i and e_j)+B(e_i and e_j, x dot (e_i and e_j))=& B((x dot e_i) and e_j, e_i and e_j) + B(e_i and (x dot e_j), e_i and e_j)\  
    &+ B(e_i and e_j, (x dot e_i) and e_j)+B(e_i and e_j, e_i and (x dot e_j))\ 
    &= 0 $
    (Note: this is due to the fact that either $e_i$ or $e_j$ occuring in both entries for every elements in the sum).
  $ B(x dot (e_i and e_j), e_i and e_l) + B(e_i and e_j, x dot (e_i and e_l)) =& B((x dot e_i) and e_j, e_i and e_l) + B(e_i and (x dot e_j), e_i and e_l)\ 
    &+ B(e_i and e_j, (x dot e_i) and e_l) + B(e_i and e_j, e_i and (x dot e_l))\ 
    =& B(sum_(r=1)^4 a_(r i) dot e_r and e_j, e_i and e_l)\ 
    &+ B(e_i and e_j, sum_(r=1)^4 a_(r i) dot e_r and e_l)\ 
    =& a_(k i) dot B(e_k and e_j, e_i and e_l) + a_(k i) dot B(e_i and e_j, e_k and e_l)\ 
    =& 0 $
    (Note: Since $(e_k and e_j) and (e_i and e_l) = -(e_i and e_j) and (e_k and e_l)$, this implies $B(e_k and e_j, e_i and e_l) = -B(e_i and e_j, e_k and e_l)$).
  $ B(x dot (e_i and e_j), e_k and e_l) + B(e_i and e_j, x dot (e_k and e_l)) =& B((x dot e_i) and e_j, e_k and e_l)+B(e_i and (x dot e_j), e_i and e_l)\ 
    &+ B(e_i and e_j, (x dot e_k) and e_l)+B(e_i and e_j, e_k and (x dot e_l))\ 
    =& B(sum_(r=1)^4 a_(r i) dot e_r and e_j, e_k and e_l)\ 
    &+ B(sum_(s=1)^4 a_(s j) dot e_i and e_s, e_k and e_l)\ 
    &+ B(e_i and e_j, sum_(m=1)^4 a_(m k) dot e_m and e_l)\ 
    &+ B(e_i and e_j, sum_(n=1)^4 a_(n l) dot e_k and e_n)\ 
    =& a_(i i) dot B(e_i and e_j, e_k and e_l) + a_(j j) dot B(e_i and e_j, e_k and e_l)\ 
    &+ a_(k k) dot B(e_i and e_j, e_k and e_l) + a_(l l) dot B(e_i and e_j, e_k and e_l)\ 
    =& pm 1 dot (a_(i i)+a_(j j)+a_(k k)+a_(l l)) = pm 1 dot tr(x) = 0 $
    (Note: This relies on the fact that $B(e_i and e_j, e_k and e_l) = pm 1$ depending on the orientation, and $x in sl(4,CC)$, so $tr(x)=0$).

    Then, the above three cases showed that $B$ is invariant under the action of any element $x in sl(4,CC)$ on $W$.

    \ 

    \ 

  4. Given the Lie-algebra representation $rho:sl(4,CC) -> gl(CC^4 tensor CC^4)$, this descends to a Lie-algebra representation $overline(rho):sl(4,CC) -> gl(Lambda^2 CC^4)$. Which, the result in part (3) shows that the bilinear form $B$ is invariant under the $sl(4,CC)$-action, hence any $x in sl(4,CC)$ satisfies $overline(rho)(x) in frak(g)$ (since $frak(g)$ collects all operators on $W$ such that the bilinear form $B$ is invariant under it). So, $overline(rho):sl(4,CC) -> frak(g) tilde.equiv so(6,CC)$ is a Lie-algebra homomorphism.

    Which, since $dim sl(4,CC) = 4^2-1 = 15 = (6 dot 5)/2= dim so(6,CC)$, it suffices to check if such morphism is injective or not.

    \ 

    Given 
]