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
  title: "Math 231A HW 8",
  authors: ("Zih-Yu Hsieh",),
  date: datetime.today().display("[month repr:long] [day], [year]"),
)

#set enum(numbering: "(1)")
= D//1
#problem[
  Etingof Problem Set 5.1:

  + Let $V$ be a representation of $frak(g)$ and $W subset V$ be a subrepresentation. Then $B_V = B_W + B_(V\/W)$, where $B_(V)(x,y)=tr(rho_(V)(x)rho_(V)(y))$.
  + Let $I subset frak(g)$ be an ideal. Then the restriction of the Killing form of $frak(g)$ to $I$ coincides with the Killing form of $I$.
][
  + First, fix a basis $w_1,...,w_k in W$ (say $dim W=k$), and extend it to an ordered basis of $V$, say $w_1,...,w_k, v_1,...,v_n in V$ (say $dim V=k+n$). Then, for all $x in frak(g)$, $rho_(V)(x)$ under this basis can be written as follow:
    $ cal(M)(rho_(V)(x)) = mat(A_x, B_x;0, C_x) $
    Where $A_x$ is a $k times k$ matrix (with entries $(a_(i j))_(1<=i,j<=k)$), $C_x$ is an $n times n$ matrix (with entries $(c_(i j'))_(1 <=i,j' <= n)$), and $B_x$ is a $k times n$ matrix (with entries $(b_(i' j'))_(1<=i'<=k\ 1<=j'<=n)$). The reason is simply because $rho_(V)(x)(W) subset.eq W$ by the definition of subrepresentation.

    Then, notice that $A_x = rho_(W)(x)$ under the basis $w_1,...,w_k in W$ by definition (since each $j in {1,...,k}$ satisfies $rho_(W)(x) = rho_(V)(x)(w_j) = sum_(i=1)^k a_(i j)w_j$).

    Also, $C_x = rho_(V\/W)(x)$ under the basis $overline(v)_1,...,overline(v)_n in V\/W$ (where $overline(v)_j$ denotes the image of $v_j$ under the quotient $V ->> V\/W$), since for all $j' in {1,...,n}$, the matrix representation satisfies the following:
    $ rho_(V)(x)(v_j') = sum_(i'=1)^k b_(i' j')w_(i') + sum_(i=1)^n c_(i j')v_i $ 
    Which, under the quotient $sum_(i'=1)^k b_(i' j')w_(i') tilde 0$, so we get $rho_(V\/W)(overline(v)_(j')) = overline(sum_(i=1)^n c_(i j')v_i) = sum_(i=1)^n c_(i j')v_i$, showing under basis $overline(v_1),...,overline(v_n) in V\/W$, matrix of $rho_(V\/W)(x)$ is given by $C_x = (c_(i j'))_(1<=i,j'<=n)$.

    So, as a result, one has the following:
    $ forall x,y in frak(g), cal(M)(rho_(V)(x) rho_(V)(y)) &= cal(M)(rho(V)(x)) dot cal(M)(rho_(V)(y))\ 
    &= mat(A_x, B_x; 0,C_x) mat(A_y, B_y;0,C_y)\ 
    &= mat(A_x A_y, *; 0, C_x C_y) $
    Hence, $B_(V)(x,y) = tr(rho_(V)(x)rho_(V)(y)) = tr mat(A_x A_y, *; 0, C_x C_y) = tr(A_x A_y) + tr(C_x C_y)$. However, since $A_x = cal(M)(rho_(W)(x))$ and $C_x = cal(M)(rho_(V\/W)(x))$ (under the chosen basis), we have $tr mat(A_x A_y) = B_(W)(x,y)$, and $tr mat(C_x C_y) = B_(V\/W)(x,y)$. So, $B_(V)(x,y) = B_(W)(x,y) + B_(V\/W)(x,y)$, or $B_V = B_W + B_(V\/W)$.

    \ 

  + First, given any $a in I$, any $x in frak(g)$ satisfies $ad a(x) = [a,x] in I$ (by definition of ideal). Hence, $ad a: frak(g) -> frak(g)$ has $im(ad a) subset.eq I$. Which, if composing with the projection $pi:frak(g) ->> frak(g)\/I$, $pi compose ad a: frak(g) ->> frak(g)\/I$ is a zero map, which factors through $frak(g)\/I$ (say denotes as $overline(ad a): frak(g)\/I -> frak(g)\/I$, this is a zero map). 
  
    So, similar to the previous section, let $W:= I$, $V:= frak(g)$, and $rho := ad:frak(g) -> gl(frak(g))$, for any $a,b in I$, one has the killing form on $frak(g), frak(g)\/I$ satisfies $K_(frak(g))(a,b) = K_(I)(a,b) + K_(frak(g)\/I)(a,b)$. However, we've shown that ay $a in I$ has its action on $frak(g)\/I$ being a zero map, hence $K_(frak(g)\/I)(a,b) = 0$ (since it's trace of products of zero maps). So, $K_(frak(g))(a,b) = K_(I)(a,b)$, showing the Killing form of $I$ coincides with the Killing form of $frak(g)$ restricting to $I$. 
]

\ 

= ND//2
#problem[
  Etingof Problem Set 5.2:

  Show taht for $frak(g)=sl(n,CC)$, the Killing form si given by $K(x,y) = 2n tr(x y)$.
][]

\ 

= part (2) ND //3
#problem[
  Etingof Problem Set 5.3:

  Let $frak(g) subset gl(n,CC)$ be the subspace consisting of block-triangular matrices:
  $ frak(g) = {mat(A,B;0,D)} $
  Where $A$ is a $k times k$ matrix, $B$ is a $k times (n-k)$ matrix, and $D$ is a $(n-k) times (n-k)$ matrix.
  + Show that $frak(g)$ is a Lie subalgebra (this is a special case of so-called #emph[parabolic subalgebras]).
  + Show that radical of $frak(g)$ consists of matrices of the form $mat(lambda dot I, B; 0, mu dot I)$, and describe $frak(g)\/rad(frak(g))$.
][
  + Given any $mat(A,B;0,D), mat(A',B';0,D') in frak(g)$, one has the following:
    $ [mat(A,B;0,D), mat(A',B';0,D')]&=mat(A,B;0,D)mat(A',B';0,D')-mat(A',B';0,D')mat(A,B;0,D)\ 
    &= mat(A A', *;0, D D') - mat(A' A, *'; 0, D' D) in frak(g) $
    Hence, $frak(g)$ is closed under Lie bracket, showing it's a Lie subalgebra.

    \ 

  + First, let $I:= {mat(lambda dot I, B'; 0, mu dot I)}$ be the given subspace of $frak(g)$, given any $mat(A,B;0,D) in frak(g)$, one has the following:
    $ [mat(lambda dot I, B'; 0, mu dot I), mat(A,B;0,D)] &= mat(lambda dot I, B'; 0, mu dot I)mat(A,B;0,D)-mat(A,B;0,D)mat(lambda dot I, B'; 0, mu dot I)\ 
    &= mat(lambda A, *;0, mu D) - mat(lambda A, *'; 0, mu D) = mat(0, * - *'; 0,0) in I $
    Hence, this shows that $I$ is an ideal of $frak(g)$.

    Also, notice that $I subset ut(n, CC)$ (where $ut(n,CC)$ denotes the Lie subalgebra of upper-triangular matrices), since $ut(n,CC)$ is solvable, then $I$ is solvable. So, one hsa $I subset.eq rad(frak(g))$ by definition.

    Now, to show that $I = rad(frak(g))$, 

]

\ 

= D//4
#problem[
  Etingof Problem Set 5.4:

  Show that the bilinear form $tr(x y)$ on $sp(n,KK)$ is non-degenerate.
][
  (Here, assume $Char(KK)!=2$). First, recall that $sp(n,KK)$ is the Lie algebra formed by all matrices $mat(A,B;C,D)$ (where $A,B,C,D in gl(n,KK)$), such that $D = -A^T$, $B=B^T$, and $C=C^T$. Which, it means the matrix $A$ can be generated by the standard basis matrices $(E_(i j))_(1<=i,j<=n) subset gl(n,KK)$, while $B,C$ must be generated by the pairs $(E_(i j)+E_(j i))_(i<=j)$ by the symmetric properties of $B,C$.

  Hence, the generators of $sp(n,KK)$ are of the following forms:
  $ cases(
    mat(E_(i j), 0;0, -E_(j i)) quad quad 1<=i\,j<=n,
    mat(0,0;E_(i j)+E_(j i),0) quad quad i<=j,
    mat(0,E_(i j)+E_(j i);0,0) quad quad i<=j
  ) $
  Which, to check that $tr(x y)$ is non-degenerate on $sp(n,KK)$, it suffices to check it for the generators. (And, as a side note, recalll that $E_(i j)E_(k l) = delta_(j k) E_(i l)$, with $delta_(j k)$ denotes the Kronecker Delta).

  - For the first one, we have the following:
  $ &mat(E_(i j),0;0,-E_(j i))mat(E_(j i), 0;0,-E_(i j))= mat(E_(i j)E_(j i),0;0,E_(j i)E_(i j)) = mat(E_(i i),0;0,E_(j j))\ 
  &==> tr(mat(E_(i j),0;0,-E_(j i))mat(E_(j i), 0;0,-E_(i j))) = tr(E_(i i))+tr(E_(j j)) = 2 $
  $ &mat(0,0;E_(i j)+E_(j i),0)mat(0,E_(i j)+E_(j i);0,0) = mat(0,0;0,(E_(i j)+E_(j i))^2) = mat(0,0;0,delta_(j i)E_(i j)+1E_(i i)+delta_(i j)E_(j i)+1E_(j j))\ 
  &==> tr(mat(0,0;E_(i j)+E_(j i),0)mat(0,E_(i j)+E_(j i);0,0)) = 2+delta(i j)+delta(j i)!=0 $
  (Note: since $delta_(i j)=delta_(j i)$, the second value is either $2$ or $4$; under the assumption $Char(KK)!=2$ such value is never $0$).

  So, since all the generators of $sp(n,KK)$ have a corresponding element also in $sp(n,KK)$, such that the form $tr(x,y)!=0$, then such form is non-degenerate.
]

\ 

= ND //5
#problem[
  Etingof Problem Set 5.5:

  Let $frak(g)$ be a real Lie algebra with positive definite Killing form. Show that then $frak(g)=0$. 

  (Hint: $frak(g) subset so(frak(g))$).
][]

\ 

= ND//6
#problem[
  Etingof Problem Set 5.6:

  Let $frak(g)$ be a simple Lie algebra.
  + Show that the invariant bilinear form is unique up to a factor.
  + Show that $frak(g) tilde.equiv frak(g)^*$ as representations of $frak(g)$.
][]

\ 

= ND//7
#problem[
  Let $V$ be a finite-dimensional complex vector space and let $A:V -> V$ be an upper-triangular operator. Let $F^k subset End(V)$, $-n<= k<= n$ be the subspace spanned by matrix units $E_(i j)$ with $i-j<=k$. Show that then $ad A dot F^k subset F^(k-1)$ and thus, $ad A:End(V) -> End(V)$ is nilpotent.
][]