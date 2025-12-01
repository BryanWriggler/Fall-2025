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

= D//2
#problem[
  Etingof Problem Set 5.2:

  Show taht for $frak(g)=sl(n,CC)$, the Killing form si given by $K(x,y) = 2n tr(x y)$.
][
  First, recall that $sl(n,CC)$ is simple, hence by #text(weight: "bold")[Problem 6] of this problem set (which will be proven), any invariant bilinear form is up to a scalar factor.

  Given any $x,y,z in sl(n,CC)$, notice that $tr(x,y)$ satisfies the following:
  $ tr([x,z] y) = tr(x z y-z x y) = tr(x z y - x y z) = tr(x [z,y]) $
  Hence, $tr$ is an invariant bilinear form, so its relation with the Killing form is up to a scalar factor.

  \ 

  Now, consider the element $E_(11)-E_(22) in sl(n,CC)$: First, we have the following:
  $ tr((E_(11)-E_(22))^2) = tr(E_(11)+E_(22)) = 2 $
  Now, if compute $K(E_(11)-E_(22), E_(11)-E_(22))$, we first need to compute the adjoint action of it on the basis elements: Since $sl(n,CC)$ has basis being all $E_(k l)$ (where $k!=l$) and $E_(k k)-E_(k+1,k+1)$ for integer $1<=k<n$, then we have the following relations:
  $ ad(E_(11)-E_(22))(E_(k l)) = cases(
    2E_(12) "  " quad k=1\,l=2,
    -2E_(2 1) " " quad k=2\, l=1,
    E_(1 l) "    " quad k=1\, l!=1\,2,
    -E_(k 1) "  " quad l=1\, k!=1\,2,
    E_(2 l) "     " quad k=2\, l!=1\,2,
    -E_(k 2) "  " quad l=2\, k!=1\,2,
    0 quad quad "   " quad "otherwise"
  ), quad ad(E_(11)-E_(22))(E_(k k)-E_(k+1,k+1)) = 0 $
  Which, we have the following for square:
  $ ad(E_(11)-E_(22))^2(E_(k l)) = cases(
    4E_(12) " " quad k=1\,l=2,
    4E_(2 1) " " quad k=2\, l=1,
    E_(1 l) "  " quad k=1\, l!=1\,2,
    E_(k 1) "  " quad l=1\, k!=1\,2,
    E_(2 l) "  " quad k=2\, l!=1\,2,
    E_(k 2) "  " quad l=2\, k!=1\,2,
    0 quad quad quad "otherwise"
  ), quad ad(E_(11)-E_(22))^2(E_(k k)-E_(k+1,k+1)) = 0 $
  Hence, for $ad(E_(11)-E_(22))^2$, there are two basis elements being eigenvectors with eigenvalue 4 (namely $E_(12), E_(21)$), and there are $4(n-2)$ basis elements being eigenvectors with eigenvalue 1 (namely all $E_(k l)$, where $k=1$ or $k=2$ while $l!=1,2$, or $l=1$ or $l=2$ while $k!=1,2$), and the rest are eigenvectors with eigenvalue $0$ (total of $(n^2-1) - 4(n-2) - 2 = n^2-4n+5$ being eigenvector of $0$).

  Therefore, under this basis, we have $tr(ad(E_(11)-E_(22))^2) = 2 dot 4 + 4(n-2) dot 1 + (n^2-4n+5) dot 0 = 4n$. So, this shows the following: 
  $ K(E_(11)-E_(22),E_(11)-E_(22)) = tr(ad(E_(11)-E_(22))^2) = 4n = 2n dot tr((E_(11)-E_(22))^2) $
  Since $K(x,y)$ is a scalar of $tr(x y)$ (or vice versa), this indicates that $K(x,y) = 2n dot tr(x y)$.

]

#pagebreak()

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

#pagebreak()

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

#pagebreak()

= D //5
#problem[
  Etingof Problem Set 5.5:

  Let $frak(g)$ be a real Lie algebra with positive definite Killing form. Show that then $frak(g)=0$. 

  (Hint: $frak(g) subset so(frak(g))$).
][
  Suppose the contrary that as a reall Lie algebra $frak(g)!=0$, and it has a positive definite Killing form. Let $K:frak(g) times frak(g) -> RR$ denotes the Killing form of $frak(g)$. Since the Killing form is positive definite (and is a real bilinear form), it satisfies all the properties of a real inner product, so one can choose $x_1,...,x_n in frak(g)$ to form an orthonormal basis with respect to the Killing form as inner product, then for any $x in frak(g)$, one has $x = sum_(i=1)^n K(x,x_i) x_i$. 

  \ 

  Now, for all $x in frak(g)$, consider $ad x in gl(frak(g))$ with its matrix form with respect to the chosen orthonormal basis $x_1,...,x_n$, denote as $cal(M)(ad x) = (a_(i j))_(1<=i,j<=n)$. Using the invariance of Killing form, for any $x_i, x_j$, one has the following:
  $ -K(ad x(x_i),x_j) = K([x_i,x], x_j)=K(x_i,[x,x_j]) = K(x_i, ad x(x_j)) = K(ad x(x_j),x_i) $
  Where, since $sum_(k=1)^n a_(k i)x_k =  ad x(x_i) = sum_(k=1)^n K(ad x(x_i), x_k) x_k$ (left side given by matrix entries, right side given by inner product), then $a_(j i) = K(ad x(x_i),x_j)$; similarly, one also has $a_(i j) = K(ad x(x_j),x_i)$. Then, based on the above equality, one has $a_(i j) = K(ad x(x_j),x_i) = -K(ad x(x_i),x_j)=-a_(j i)$, showing that matrix of $ad x$ is skew-symmetric, hence $ad x in so(frak(g))$.

  \ 

  Then, notice that any operator $A in so(frak(g))$ must have $tr(A^2) <= 0$: If represent $A$ under the chosen basis as above, since $A$ is skew-symmetric, if let $c_1,...,c_n$ denote the ordered column vectors of $A$, and $r_1,...,r_n$ denote the ordered row vectors of $A$, it satisfies $r_i = -c_i^T$ (as matrices), hence one has the following:
  $ tr(A^2) = sum_(i=1)^n r_i c_i = sum_(i=1)^n - c_i^T c_i = sum_(i=1)^n -(c_i dot c_i) <= 0 $
  Where, the last part is interpreting $c_i^T c_i$ (multiplication of row and column vector) as $c_i dot c_i$  (regular dot product on $RR^n$). Hence, for any $x in frak(g)$, one also has $K(x,x) = tr((ad x)^2) <= 0$ (since $ad x in so(frak(g))$).

  \ 

  However, by positive definiteness, we must have $K(x,x)>=0$, together with the previous statement, this enforces $K(x,x)=0$, which happens iff $x=0$ (by positive definiteness). Hence, $frak(g)=0$, which contradicts the assumption.

  As a result, one must have $frak(g)=0$.
]

#pagebreak()

= D//6
#problem[
  Etingof Problem Set 5.6:

  Let $frak(g)$ be a simple Lie algebra.
  + Show that the invariant bilinear form is unique up to a factor.
  + Show that $frak(g) tilde.equiv frak(g)^*$ as representations of $frak(g)$.
][
  (Here, assume $Char(k)=0$, and $k=overline(k)$).1 In this case (2) is in fact easier to prove (while (1) follows from it), so we'll first show (2).

  \ 

  2. To prove the statement that $frak(g) tilde.equiv frak(g)^*$ as representations of $frak(g)$ (where the first one is the adjoint representation, the second is the dual representation of that), it relies on two statements: First, the Killing form $K$ is non-degenerate (since $frak(g)$ is simple, hence semisimple, showing $ker(K) = 0$ by Cartan's semisimplicity criterion); also, $K$ is invariant under adjoint action.

    \

    First, $K$ is non-degenerate, meaning for all nonzero $x in frak(g)$, one has $K(x,\_):frak(g) -> k$ being a nonzero linear functional, hence, the linear map $f: frak(g) -> frak(g)^*$ by $f(x) = K(x,\_)$ is injective, while $dim frak(g) = dim frak(g)^*$, showing that such map $f$ is indeed an isomorphism as vector spaces.

    Now, to show it's a morphism of representations, consider the following: For any $x,y,z in frak(g)$, one has $K(ad z(x),y) = K([z,x],y) = -K([x,z],y) = K(x, -[z,y]) = K(x, -ad z(y)) = K(x,\_) compose(- ad z)(y)$. Hence, one has $f(z dot x) = f(ad z (x)) = K( ad z(x),\_) = K(x,\_) compose (- ad z) = f(x) compose (- ad z) = z dot f(x)$, so $f$ is a morphism of representation. 
    
    (Note: recall that if $rho:frak(g) -> gl(V)$ is a Lie-algebra representation, then the dual representation $rho^*: frak(g) -> gl(V^*)$ by $rho^*(z) dot phi := phi compose (- rho(z))$).

    So, $f:frak(g)-> frak(g)^*$ as both an isomorphism of vector spaces and a morphism of representation of $frak(g)$, then $frak(g) tilde.equiv frak(g)^*$ as representation of $frak(g)$.

    \ 

    \ 

  1. The goal for this part is to prove that $frak(g)$ as a representation of $frak(g)$, is irreducible (hence by Schur's Lemma $Hom_(Lie)(frak(g), frak(g)^*) tilde.equiv k$, based on the assumption $k=overline(k)$).

    \ 

    Suppose a subspace $frak(h) subset.eq frak(g)$ is a nontrivial subrepresentation of $frak(g)$, then for all $a in frak(h)$ and $z in frak(g)$, one has $z dot a = ad z(a) = [z,a] in frak(h)$, showing that $[frak(g),frak(h)] subset.eq frak(h)$, or $frak(h)$ is an ideal. But, based on the assumption of $frak(g)$'s simplicity, this enforces $frak(h)=frak(g)$. Hence, $frak(g)$ has no nontrivial proper subrepresentation, which is irreducible. Hence Schur's Lemma holds here.

    \

    Finally, notice that if $B:frak(g) times frak(g) -> k$ is an invariant bilinear form, the linear map $g:frak(g) -> frak(g)^*$ by $g(x) = B(x,\_)$ is also a morphism of Lie-algebra representation, since every $x,y,z in frak(g)$ again satisfy the following:
    $ B(ad z(x),y) &= B([z,x],y) = -B([x,z],y) = -B(x,[z,y]) \ 
    &= B(x, - ad z(y))= B(x,\_) compose (-ad z)(y) $
    Hence, as linear maps, $g(z dot x)=g(ad z(x)) = B(ad z(x),\_) = B(x,\_) compose (- ad z) = g(x) compose (-ad z) = z dot g(x) $, showing $g$ is a morphsism of representation. 

    Hence, $g in Hom_(Lie)(frak(g),frak(g)^*) tilde.equiv k$, showing that $g = lambda dot f$ for some $lambda in k$. Hence, for all $x,y in frak(g)$, one has $B(x,y) = g(x)(y) = lambda dot f(x)(y) = lambda dot K(x,y)$, showing $B = lambda dot K$, which is a scalar multiple of the Killing form of $frak(g)$. 

    So, all invariant bilinear form on $frak(g)$ is unique up to a factor in $k$.
]

#pagebreak()

= D//7
#problem[
  Let $V$ be a finite-dimensional complex vector space and let $A:V -> V$ be an upper-triangular operator. Let $F^k subset End(V)$, $-n<= k<= n$ be the subspace spanned by matrix units $E_(i j)$ with $i-j<=k$. Show that then $ad A dot F^k subset F^(k-1)$ and thus, $ad A:End(V) -> End(V)$ is nilpotent.
][

  #text(weight: "bold")[1. The statement is false in general:]

  For instance, choose $V = CC^2$, let $A = mat(1,2;0,3)$, then $E_(2 1)=mat(0,0;1,0) in F^1$ in this case. However, if consider $ad A(E_(2 1))$, we get:
  $ ad A(E_(2 1)) = A E_(2 1)-E_(2 1)A = mat(2,0;3,0) - mat(0,0;1,2) = mat(2,0;2,-2) in.not F^0 $
  Actually, a more precise requirement is $A$ needs to be an upper-triangular operator with only one eigenvalue, i.e. under upper-triangular matrix form, the diagonal entries $A_(i i)=A_(j j)$ for all $i,j in {1,...,n}$. We'll prove the statement for this assumption.

  \ 

  #text(weight: "bold")[2. The statement is true, if Diagonal Entries of $A$ are the same:]

  Let $A = (a_(i j))_(1<=i,j <=n)$ be an upper-triangular operator, with all the diagonal entries being the same (so, $a_(i i)=a_(j j)$ for all $i,j$, while $a_(i j)=0$ for $i>j$). To prove $ad A dot F^k subset F^(k-1)$ for integer $-n <= k<= n$, it suffices to show that for all $E_(i j)$ satisfying $i-j = k$, one has $ad A(E_(i j)) in F^(k-1)$ (since each $F^k = F^(k-1) plus.circle (plus.circle.big_(i-j = k) CC dot E_(i j))$, so inductively if $ad A dot F^(k-1) subset F^(k-2) subset F^(k-1)$, then for each $E_(i j)$ with $i-j=k$, $Ad A(E_(i j)) in F^(k-1)$ guarantees $Ad A dot F^k subset F^(k-1)$, since each direct summand is mapped into $F^(k-1)$).

  Now, fix an integer $-n<=k<=n$, for each $E_(i j)$ satisfying $i-j=k$, one has the following:
  $ ad A(E_(i j))=A E_(i j)-E_(i j)A = mat(0,0, a_(1 i),0,0;0,0,dots.v,0,0;0,0,a_(i i),0,0; 0,0,0,0,0;0,0,0,0,0) - mat(0,0,0,0,0;0,0,0,0,0;0,0,a_(j j),dots,a_(j n);0,0,0,0,0;0,0,0,0,0) = mat(0,0,a_(1 i),0,0;0,0,dots.v,0,0;0,0,0,dots, a_(j n);0,0,0,0,0;0,0,0,0,0) $
  Which, the column with $dots.v$ is the $j^upright(t h)$ column, and the row with $dots$ is the $i^upright(t h)$ row (and the $0$ in between could be different sizes of zero matrices, depending on the amount of entries given). As a result, since $ad A(E_(i j))$ contains no entries of $E_(i' j')$ (where $i'-j' >= k$, since everything on these diagonals are all $0$), then $ad A(E_(i j)) in F^(k-1)$, and this proves the claim, showing $ad A dot F^k subset F^(k-1)$.

  \ 

  As a result, since $F^(-n) = 0$ (since no entries satisfy this relation), so $(ad A)^(2n) = 0$ (since for $F^n = End(V)$, one has $(ad A)^(2n)dot F^n subset  F^(n - 2n) = F^(-n)=0$ by induction). So, $ad A$ is nilpotent operator on $End(V)$.
]