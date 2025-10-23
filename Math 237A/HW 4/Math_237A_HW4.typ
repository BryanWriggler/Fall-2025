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
  title: "Math 237A HW 4",
  authors: ("Zih-Yu Hsieh",),
  date: datetime.today().display("[month repr:long] [day], [year]"),
)

#set  enum(numbering: "(a)")

= D//1
#problem[
  Lazarsfeld Problem Set 4 (1):

  Let $X subset.eq PP^n$ be a hypersurface of degree $d$ (i.e. $X={F_d=0}$ for some homogeneous polynomial of degree $d$). Show that $PP^n\\X$ is (isomorphic to) an affine variety.
][
  Consider the Veronese Embedding $v_(n,d):PP^n arrow.r PP^N$ (where $N=mat(n+d;n)-1$), this is an isomorphism between $PP^n$ and the image. Now, notice that $F_d$ can be expressed as linear combinations of some degree $d$ monomials, hence this map again extends to a map $tilde(v)_(n,d):PP^n arrow.r PP^(N+1)$ by $tilde(v)_(n,d)([x]) = [F_d([x]), v_(n,d)[x]]$ (where the second term is the coordinates in $PP^N$). Notice that such map still forms an isomorphism from $PP^n$ to its image (since we can project $PP^(N+1)$ onto $PP^N$ by $[F_d([x]), v_(n,d)([x])] mapsto v_(n,d)([x])$, then use the inverse of Veronese Embedding), hence we naturally get that $PP^n tilde.equiv im(tilde(v)_(n,d)) subset.eq PP^(N+1)$, which is an algebraic set.

  \ 

  Now, let $H_0:= {[y] in PP^(N+1) | y_0=0}$ be the closed set, $PP^(N+1)\\H_0$ is an open subset of $PP^(N+1)$ that is isomorphic to $AA^(N+1)$. Notice that for any $[x] in PP^n$, we have $tilde(v)_(n,d)([x]) in PP^(N+1)\\H_0$ iff its first coordinate (which is given by $F_d([x])$) is nonzero, which is equivalent of saying that $F_d([x])!=0$, or $[x] in PP^n\\X$. Hence, we can conclude that $tilde(v)_(n,d)(PP^n\\X) = im(tilde(v)_(n,d)) sect (PP^(N+1)\\H_0)$. 

  Notice that $im(tilde(v)_(n,d)) subset.eq PP^(N+1)$ is an algebraic set (which is closed), hence $tilde(v)_(n,d)(PP^n\\X) = im(tilde(v)_(n,d)) sect (PP^(N+1)\\H_0)$ is closed under subspace topology of $PP^(N+1)\\H_0 tilde.equiv AA^(N+1)$, hence $PP^n\\X tilde.equiv tilde(v)_(n,d)(PP^n\\X)$ can be viewed as a closed set in $AA^(N+1)$, which is an affine algebraic set.

  \ 

  Lastly, recall that continuous functions send irreducible sets to irreducible sets, with $PP^n\\X subset.eq PP^n$ being open under Zariski Topology, it is irreducible. Hence, $tilde(v)_(n,d)(PP^n\\X) tilde.equiv PP^n\\X$ is also irreducible as an affine algebraic set, showing that $PP^n\\X$ is isomorphic to an affine variety. 
]

\ 

= D//2
#problem[
  Lazarsfeld Problem Set 4 (3):

  Let 
  $ f(x)=a_0x^d+...+a_d, quad g(x)=b_0x^e+...+b_e $
  be polynomials of degree $d$ and $e$ over an algebraically closed field (with $a_0!=0$, $b_0!=0$). Write $P_i$ for the vector space of polynomials of degree $<=i$ in $x$.
  + Prove that $f$ and $g$ have a common root if and only if the mapping 
    $ mu:P_(e-1) plus.circle P_(d-1) arrow.r P_(d+e-1) $
    defined by 
    $ mu(p,q)=p(x)f(x)+q(x)g(x) $
    has a non-trivial kernel.

  + The #emph[resultant] $Res(f,g)$ of $f$ and $g$ is defined to be the determinant:
    #figure(
      image("Screenshot 2025-10-20 at 10.03.28 AM.png", width: 20%)
    )
    Prove that $f$ and $g$ have a common root if and only if $Res(f,g)=0$.

  + Consider the algebraic set $Z subset.eq AA^1 times PP^1$ defined by the two equations 
    $ a_0(t)X^d+...+a_d (t)Y^d, quad b_0(t)X^e+...+b_e (t)Y^e $
    Find an equation for $"pr"_2(Z) subset.eq AA^1$.
  
][
  + $==>:$ First, suppose $f,g$ has common roots, then there exists $alpha in k$ and $f_1(x),g_1(x) in k[x]$, such that $f(x)=(x-alpha)f_1(x)$ and $g(x)=(x-alpha)g_1(x)$, where $deg(f_1)=d-1$ and $deg(g_1)=e-1$, and both $f_1,g_1!=0$ (since $f,g!=0$). Then, consider the nonzero pair $(g_1,-f_1) in P_(e-1) plus.circle P_(d-1)$, we get the following:
    $ mu(g_1,f_1)=g_1(x)f(x)-f_1(x)g(x)=g_1(x)(x-alpha)f_1(x)-f_1(x)(x-alpha)g_1(x) = 0 $
    So, $mu$ has non-trivial kernel.

    \ 

    $<==:$ Suppose $mu$ has a nontrivial kernel, then there exists $p(x) in P_(e-1)$ and $q(x) in P_(d-1)$ such that $mu(p,-q)=p(x)f(x)-q(x)g(x)=0$, so $p(x)f(x)=q(x)g(x)$. Now we claim that $f(x), g(x)$ must have common linear factor, which implies they have common roots: 
    
    By the fact that the field $k$ is algebraically closed, $f,g,p,q in k[x]$ can all be factored into linear terms (unique up to unit mulitiplication, or up to a nonzero constant), say $f(x)=a_0(x-f_1)...(x-f_d),$ and $ g(x)=b_0(x-g_1)...(x-g_e)$.

    Suppose the contrary that $f,g$ has no common roots, then the $(x-f_i)!=(x-g_j)$ for all $1<=i<=d$ and $1<=j<=e$. Then, since each $(x-f_i)$ is irreducible, and is a factor of $p(x)f(x)=q(x)g(x)$, then $(x-f_i)$ must be a factor of $q(x)$ or $g(x)$; yet, by the assumption $(x-f_i)$ is not a factor of $g(x)$, hence $(x-f_i)$ must be a factor of $q(x)$. Because this is true for each $1<=i<=d$, then we conclude that $q(x)$ has its factorization containing $(x-f_1)...(x-f_d)=1/a_0 f(x)$, implying that $f(x)$ is a factor of $q(x)$. Hence, $deg(f)<= deg(q)$. Yet, with $deg(f)=d > d-1 = deg(q)$, it generates a contradiction.

    So, the assumption is false, $f,g$ must have common roots.

    \ 

  + Given the $k$-linear map $mu:P_(e-1) plus.circle P_(d-1) arrow.r P_(d+e-1)$ in part (a), choose the standard basis ${1,x,...,x^(e-1)}$ for $P_(e-1)$, and ${1,x,...,x^(d-1)}$ for $P_(d-1)$, the standard basis for $P_(e-1) plus.circle P_(d-1)$ is given by ${(1,0),(x,0),...,(x^(e-1),0),(0,1),(0,x),...,(0,x^(d-1))}$. 

    Similarly, choose the standard basis ${1,x,...,x^(d+e-1)}$ for $P_(d+e-1)$. Then, if consider the matrix of $mu$, $cal(M)(mu)$ in terms of ${(1,0),(x,0),...,(x^(e-1),0),(0,1),(0,x),...,(0,x^(d-1))}$ as ordered basis of $P_(e-1) plus.circle P_(d-1)$, and ${1,x,...,x^(d+e-1)}$ as ordered basis of $P_(d+e-1)$, we precisely recover the matrix in the following determinant:
    #figure(
      image("Screenshot 2025-10-20 at 10.03.28 AM.png", width: 40%)
    )
    Hence, by statement in part (a), $f,g$ have common roots $<==>$ $mu$ has non-trivial kernel, which the latter statement is equivalent to the above determinant being $0$. Hence, $f,g$ have common roots, iff $Res(f,g)=0$ (the above determinant being $0$).

    \ 

  + First, consider $AA^1 := PP^1\\H_1$ (the open set with the second coordinate being nonzero, namely $Y!=0$), then define $x:=X/Y$, the two given polynomial can be reduced to:
    $ f_t(x)=a_0(t) x^d + ... + a_d(t), quad g_t(x)=b_0(t) x^e + ... + b_e(t) $
    Then, if fixing a $t in AA^1$, to say that there exists $[X,Y] in PP^1\\H_1$ that serves as a common zero of both polynomials (or $x:=X/Y$ is a solution to the polynomials), then based on the previous parts, it's equivalent to say that $Res(f_t,g_t)=0$, where here $Res(f_t,g_t)$ defined as determinant of a matrix (with entries $a_i (t), b_j (t)$ for $0<= i<= d$, $0<= j<= e$). Hence, since now $Res(f_t,g_t)$ is a polynomial in terms of $t$, then there are only finite points such that $Res(f_t,g_t)=0$, say $t_1,...,t_k in AA^1$.

    Then, for each $t_i in AA^1$ (where $1<= i<= k$), with $Res(f_(t_i), g_(t_i))=0$, the polynomials $f_(t_i)(x)=a_0(t_i)x^d + ... + a_d (t_i)$ and $g_(t_i)(x)=b_0(t_i)x^e+...+b_e (t_i)$ only has finitely many common solutions, say $x_(i,1),...,x_(i,l_i) in AA^1$. Then, the collection ${[x_(i,j),1]}_(1<=i<=k\ 1<=j<=l_i) subset PP^1\\H_1 tilde.equiv AA^1$ are precisely the points, such that there exists $t in AA^1$ to let $(t, [x_(i,j),1]) in AA^1 times PP^1$ be a solution of the given two polynomials, which such collection is precisely $"pr"_2(Z)$ (projection onto the second coordinate, and contained in $AA^1 = PP^1\\H_1$).

    (Note: If redo the similar process for $PP^1\\H_0$, where the first coordinate is nonzero, then we get another collection of solutions for another copy of $AA^1 subset PP^1$).
]

#pagebreak()

= D//3
#problem[
  Hartshorne 2.9:

  #emph[Projective Closure of an Affine Variety]. If $Y subset.eq AA^n$ is an affine variety, we identify $AA^n$ with an open set $U_0 subset.eq PP^n$ by the homeomorphism $phi_0$. Then we can speak of $overline(Y)$, the closure of $Y$ in $PP^n$, which is called the #emph[projective closure] of $Y$.
  + Show that $I(overline(Y))$ is the ideal generated by $beta(I(Y))$, collection of polynomials homogenized from polynomials in $I(Y)$.
  + Let $Y subset.eq AA^3$ be the twisted cubic of (Hartshorne 1.2). Its projective closure $overline(Y) subset.eq PP^3$ is called the #emph[twisted cubic curve in $PP^3$]. Find generators for $I(Y)$ and $I(overline(Y))$, and use this example to show that if $f_1,...,f_r$ generates $I(Y)$, $beta(f_1),...,beta(f_r)$ do #emph[not] necessarily generate $I(overline(Y))$.
][
  + First, given any homogeneous polynomial $f(x_0,x_1,...,x_n) in I_(PP^n)(overline(Y))$, since we can identify $Y subset.eq AA^n$ as the set ${[1,y_1,...,y_n] in U_0 | (y_1,...,y_n) in Y}$ (where $U_0 tilde.equiv AA^n$), then we have the polynomial $alpha(f)(y_1,...,y_n) = f(1,y_1,...,y_n) = 0$, showing that $alpha(f) in I_(AA^n)(Y)$. Which, if consider the homogenization of $alpha(f)(x_1,...,x_n)$, which is given by $beta(alpha(f))=x_0^d alpha(f)(x_1/x_0,...,x_n/x_0)$ (where $d$ is the highest degree of monomials in $alpha(f)$), it coincides with the original polynomial $f(x_0,x_1,...,x_n)$.So, we get that $f in beta(I_(AA^n)(Y))$. Hence, $I_(PP^n)(overline(Y))$ as a homogeneous ideal, can be generated by homogeneous polynomials generated from elements in $I_(AA^n)(Y)$. This shows that $I_(PP^n)(overline(Y))$ is contained in the ideal generated by $beta(I_(AA^n)(Y))$. Hence, if taken its algebraic set, we have $overline(Y)=Z_(PP^n)(I_(PP^n)(overline(Y))) supset.eq Z_(PP^n)(beta(I_(AA^n)(Y)))$.

    Also, notice that given any $y = [1,y_1,...,y_n] in Y subset.eq U_0$, since $(y_1,...,y_n)$ satisfies the original polynomials $f in I_(AA^n)(Y)$, then the homognized polynomial $beta(f)(x_0,x_1,...,x_n) = x_0^d f(x_1/x_0,...,x_n/x_0)$ satisfies $beta(f)(1,y_1,...,y_n)= 1^d f(y_1/1,...,y_n/1)=0$. So, this shows that $y in Z_(PP^n)(beta(I_(AA^n)(Y)))$. Hence, $Y subset.eq  Z_(PP^n)(beta(I_(AA^n)(Y)))$, showing that $overline(Y) subset.eq  Z_(PP^n)(beta(I_(AA^n)(Y)))$.

    So, we conclude that $overline(Y)= Z_(PP^n)(beta(I_(AA^n)(Y)))$, showing that the homogenized polynomials in $I_(AA^n)(Y)$ indeed cut out $overline(Y) subset.eq PP^n$ (the projective closure of $Y$).

    \ 

  + Recall from #text(weight: "bold")[Homework 1], the twisted cubic curve $Y = {(t,t^2,t^3) in AA^3|t in k} subset.eq AA^3$ is an affine variety with $I_(AA^3)(Y) = (y-x^2, z-x^3)$ (given that the polynomial ring of $AA^3$ is in terms of $k[x,y,z]$). Which, based on part (a) we knwo $I_(PP^n)(overline(Y))$ is generated by $beta(I_(AA^n)(Y))$ (the homogenized version of all polynomials in $I_(AA^n)(Y)$). Here, notice that the equation $z^2-y^3$ evaluates to be $0$ for all $(x,y,z) = (t,t^2,t^3) in Y$, hence $z^2-y^3 in I_(AA^3)(Y)$.

    If we homogenize the generators of $I_(AA^3)(Y)$, say $y-x^2$ and $z-x^3$, it corresponds to $Y W-X^2, Z W^2-X^3 in k[X,Y,Z,W]$. Also, given that $z^2-y^3 in I_(AA^3)(Y)$ has homogenized version being $Z^2 W-Y^3 in I_(PP^n)(overline(Y))$. 
    
    Yet, we claim that the homogeneous polynomials $Y W-X^2, Z W^2-X^3$ does not generate $I_(PP^n)(overline(Y))$: Suppose the contrary that they generate the ideal, then $Z^2W-Y^3 = f dot (Y W-X^2)+g dot (Z W^2-X^3)$ for some $f,g in k[X,Y,Z,W]$. Yet, if plugin $[0,1,0,0]$, we have $Z^2W-Y^3 = -1$, but $Y W-X^2 = Z W^2-X^3=0$, which is a contradiction. Hence, $Z^2W-Y^3 in.not (Y W-X^2, Z W^2-X^3)$, showing that even though $y-x^2,z-x^3$ generates $I_(AA^2)(Y)$, the homogenized version $Y W-X^2, Z W^2-X^3$ don't generate $I_(PP^2)(overline(Y))$.
    
]

#pagebreak()

= D//4
#problem[
  Hartshorne 2.15:

  The #emph[Quadric Surface in ] $PP^3$. Consider the surface $Q$ (a #emph[surface] is a variety of dimension $2$) in $PP^3$ defined by the equation $x y-z w=0$.
  + Show that $Q$ is equal to the segre embedding of $PP^1 times PP^1$ in $PP^3$, for suitable choice of coordinates.
  + Show that $Q$ contains two families of lines (a #emph[line] is a linear variety of dimension $1$) ${L_t},{M_t}$, each parametrized by $t in PP^1$, with the properties that if $L_t!=L_u$, then $L_t sect L_u=emptyset$; if $M_t != M_u$, $M_t sect M_u=emptyset$, and for all $t,u$, $L_t sect M_u=$ one point.
  + Show that $Q$ contains other curves besides these lines, and deduce that the Zariski topology on $Q$ is not homeomorphic via $psi$ to the product topolgy on $PP^1 times PP^1$ (where each $PP^1$ has its Zariski topology).
][
  + Let $([a_0,a_1], [b_0,b_1])$ be the coordinates of $PP^1 times PP^1$, and $[x,y,z,w]$ be the coordinates of $PP^3$. Consider the Segre Embedding $psi:PP^1 times PP^1 arrow.r PP^3$ given as the following order:
    $ psi([a_0,a_1],[b_0,b_1])=[a_0b_0, a_1b_1, a_0b_1, a_1b_0] $
    Then, given any $[x,y,z,w] in im(psi)$, since there exists $[a_0,a_1],[b_0,b_1] in PP^1$, such that $[x,y,z,w]=[a_0b_0,a_1b_1,a_0b_1,a_1b_0]$, then we have the following:
    $ x y-z w=a_0b_0a_1b_1-a_0b_1a_1b_0=0 $
    Hence, $[x,y,z,w] in Q$ (since it's a zero of the corresponding equation), hence $im(psi) subset.eq Q$.

    On the other hand, given any $[x,y,z,w] in Q$, there is at least one coordinate not being $0$ (by definition of $PP^3$). For definiteness, say $x!=0$, then after normalization we get $[1,y/x,z/x,w/x]$. Now, the goal is to find the pair $([1,a_1],[1,b_1])$ such that $[1 dot 1, a_1 b_1, 1 dot b_1, a_1 dot 1]=[1,y/x,z/x,w/x]$ (to show that it belongs to $im(psi)$).

    Which, choose $b_1:=z/x$ and $a_1:=w/x$, notice that it satisfies $a_1 b_1=(z w)/x$, where $x y-z w=0$, so $z w=x y$. Hence, $a_1 b_1=(x y)/x=y$. So, based on the Segre Embedding, we get:
    $ psi([1,w/x],[1,z/x]) &= [1 dot 1, w/x dot z/x, 1 dot z/x, w/x dot 1]=[1, (z w)/x^2, z/x, w/x]\ &= [1,(x y)/x^2,z/x,w/x] = [1,y/x,z/x,w/x]=[x,y,z,w] $
    Hence, this shows that $[x,y,z,w] in im(psi)$, hence $Q subset.eq im(psi)$.

    As a conclusion, $Q=im(psi)$, showing that $Q$ can be identified as a Segre Embedding.

    \ 

  + For any $t=[t_1,t_2] in PP^1$, consider the curve $L_t:= {psi([t_1,t_2],[x,y]) | [x,y] in PP^1}$, and $M_t:={psi([x,y],[t_1,t_2])|[x,y] in PP^1}$.

    \ 

    First, recall that Segre Embedding is injective: Given the pairs $([a_0,a_1],[b_0,b_1])$ and $([c_0,c_1],[d_0,d_1])$ that gets send to the same image through $psi$, we have $[a_0b_0,a_1b_1,a_0b_1,a_1b_0]=[c_0d_0,c_1d_1,c_0d_1,c_1d_0]$. Since one of the coordinate is nonzero (for definiteness, say $a_0b_0, c_0d_0!=0$), then $a_0,b_0,c_0,d_0!=0$. Hence, the image can be rewrite as follow:
    $ [1, a_1/a_0 b_1/b_0, b_1/b_0, a_1/a_0]=[1,c_1/c_0 d_1/d_0,d_1/d_0, c_1/c_0] $
    Hence, we must have $a_1/a_0=c_1/c_0$ and $b_1/b_0=d_1/d_0$. This shows that the pair $([a_0,a_1],[b_0,b_1])=([1,a_1/a_0],[1,b_1/b_0])=([1,c_1/c_0],[1,d_1/d_0])=([c_0,c_1],[d_0,d_1])$, so the Segre Embedding $psi$ is injective.

    \ 

    Such fact shows that each $L_t$ and $M_t$ are in fact set isomorphic to $PP^1$ (since $psi$ is injective, then fixing $t=[t_1,t_2]$ for one of the inputs, it becomes an injective function with domain $PP^1$). To prove that they're isomorphic to $PP^1$, let's consider an inverse: For definiteness we'll choose to demonstrate the case for $L_t$ (since for $M_t$ it follows the similar logic by swapping the coordinates). Each $[x,y] in PP^1$ is corresponding to $psi([t_1,t_2],[x,y])=[t_1x,t_2y, t_1y, t_2x] in L_t$, there are two cases to consider: If $t_1!=0$, then the "projection" $L_t arrow.r PP^1$ by $[t_1x,t_2y,t_1y,t_2x] mapsto [t_1x,t_1y] = [x,y]$ is a well-defined two-sided inverse. Else, if $t_1=0$, then since $t_2!=0$ by definition of $PP^1$, the other projection $L_t arrow.r PP^1$ by $[t_1x,t_2y,t_1y,t_2x] mapsto [t_2x,t_2y] = [x,y]$ is again a well-defined two-sided inverse. Hence in both case $L_t tilde.equiv PP^1$.

    \ 

    Now, because of the injectivity of Segre Embedding $psi$ it's obvious that given any $u=[u_1,u_2],t=[t_1,t_2] in PP^1$ with $u!=t$, we have $L_u sect L_t=emptyset$ and $M_u sect M_t=emptyset$ (since any point in $L_u$ is in the form $psi([u_1,u_2], [x,y])$, while any point in $L_t$ is of the form $psi([t_1,t_2],[x',y'])$. With first coordinate being different, $psi([u_1,u_2],[x,y])!=psi([t_1,t_2],[x',y'])$ in all case, showing that $L_u sect L_t=emptyset$. Same logic applies to $M_u$ and $M_t$, just swap it to the second coordinate).

    Also, given any $u,t in PP^1$, we have $L_u sect M_t$ being a single point, since if $P in L_u sect M_t$, we must have $P=psi([u_1,u_2],[x,y]) = psi([x',y'],[t_1,t_2])$ by the definition of $L_u$ and $M_t$. Which, by injectivity of $psi$, $[x,y]=[t_1,t_2]$ and $[x',y']=[u_1,u_2]$, showing that $P=psi([u_1,u_2],[t_1,t_2]) = psi(u,t)$.

    Hence, the family ${L_t}_(t in PP^1)$ and ${M_t}_(t in PP^1)$ satisfies $t!=u$ implies $L_t sect L_u, M_t sect M_u=emptyset$, and $L_u sect M_t = P$ a single point.

    \

  + Consider the "curve" given as $overline(psi):PP^1 arrow.r Q$, which is defined by $overline(psi)([x,y]) = psi([x,y],[x,y]) = [x^2,y^2, x y, y x]$. Given that $Delta = {([x,y],[x,y]) in PP^1 times PP^1}$ has $Delta tilde.equiv PP^1$, we can prove that $im(overline(psi)) tilde.equiv PP^1$: Since $psi$ is injective we have $psi(Delta) $ being set isomorphic to $im(overline(psi))$, and we can construct an inverse around any point: Because any $[x,y] in PP^1$ has either $x!=0$ or $y!=0$, then any $[x^2,y^2, x y,y x] in im(overline(psi))$ has either $x^2!=0$ or $y^2!=0$, so $im(overline(psi)) subset.eq U_x union U_y$ (where $U_i$ representes the open set $i!=0$ where $i in {x,y,z,w}$ for coordinate $[x,y,z,w] in PP^3$).

    Consider the function $f:im(overline(psi)) arrow.r PP^1$ by the following:
    $ f([x^2,y^2, x y, y x]) := cases(
      [x^2,x y] quad x^2!=0 \
      [y x, y^2] quad y^2!=0
    )  $
    This function is well-defined, since if both $x^2,y^2!=0$, one has $[x^2,x y] = [x, y] = [y x, y^2]$, which $f$ maps the same point to a unique point in $PP^1$. Also, given any $[x,y] in PP^1$, if $x!=0$ one has $f compose overline(psi)([x,y])=f([x^2,y^2,x y,y x])=[x^2,x y]=[x,y]$, and if $y!=0$ one has $f compose overline(psi)([x,y])=f([x^2,y^2,x y,y x])=[y x,y^2]=[x,y]$, while $overline(psi) compose f = id_(im(overline(psi)))$ by definition. So, $f$ is a two-sided inverse of $overline(psi)$, showing that $im(overline(psi)) tilde.equiv PP^1$, which $im(overline(psi)) subset.eq Q$ is a curve.

    \ 

    However, notice that $im(overline(psi))!= L_t, M_t$ for any $t in PP^1$ (given the definition in part (b) above). By injectivity of $psi$, since every point $P in im(overline(psi))$ is of the form $overline(psi)([x,y])=psi([x,y],[x,y])$, then any $P in im(overline(psi)) sect L_t$ must have $P=psi([x,y],[x,y])=psi([t_1,t_2],[x',y'])$, by injectivity we must have $[x,y]=[t_1,t_2]$, or $P=psi([t_1,t_2],[t_1,t_2])$, showing that $im(overline(psi))$ is intersecting $L_t$ at exactly one point (similarly, it also intersect $M_t$ at only one point). So, this is a curve that doesn't belong to the family of curves ${L_t}_(t in PP^1), {M_t}_(t in PP^1)$.

    \ 

    Finally, this shows that $Q$ under Zariski Topology is not homeomorphic to product topology of $PP^1 times PP^1$, since in $PP^1 times PP^1$ under product topology (each $PP^1$ equips with Zariski Topology), the only closed sets are finite union or arbitrary intersection of products of closed sets in $PP^1$. Then, since closed sets in $PP^1$ are $emptyset, PP^1$, and finite points, then the the closed set of the form ${P} times PP^1$ and $PP^1 times {Q}$ in fact generates all the closed sets in $PP^1 times PP^1$, showing that the closed sets (other than $PP^1$ and $emptyset$) must be either finite union of lines (each line is fixing one coordinate), or intersection of arbitrary amount of lines (which can only be finite points).

    However, if take the embedding $psi:PP^1 times PP^1 arrow.r Q$, the lines ${L_t}+(t in PP^1), {M_t}_(t in PP^1)$ constructed in part (b) represents all the proper nonempty closed sets that generate closed sets in $PP^1 times PP^1$. Since there are closed sets (specifically a curve which is infinite) that don't belong to any of these, meaning it cannot be created by finite unions of lines $L_t, M_u$, showing that it is not closed if $Q$ is the same as product topology on $PP^1 times PP^1$. So, $Q$ can't be homeomorphic to $PP^1 times PP^1$ under product topology.
]

\ 

= D//5
#problem[
  Hartshorne 2.16:

  + The intersection of two varieties need not be a variety. For example, let $Q_1$ and $Q_2$ be the quadric surfaces in $PP^3$ given by the equations $X^2-Y W=0$ and $X Y-Z W=0$, respectively. Show that $Q_1 sect Q_2$ is the union of a twisted cubic curve and a line.
  + Even if the intersection of two varieties is a variety, the ideal of the intersection may not be the sum of the ideals. For example, let $C$ be the conic in $PP^2$ given by the equation $X^2-Y Z=0$. Let $L$ be the line given by $Y=0$. Show that $C sect L$ consists of one point $P$, but that $I(C)+I(L)!= I(P)$.
][
  + Recall from #text(weight: "bold")[Problem 3] that the twisted cubic curve $overline(Y) subset.eq PP^3$ (instead of the affine case $Y in AA^3$ in #text(weight: "bold")[Problem 3], it's the closure here), we have homogeneous polynomials $Y W-X^2, Z W^2-X^3, Z^2W-Y^3 in I_(PP^3)(Y)$. Notice that given any $(t,t^2,t^3) in AA^3$ that's contained in the twisted cubic curve, the equations $x^2-y, x y-z$ are both satisfied, showing that $x^2-y, x y-z in I_(AA^3)(Y)$, hence their homogenized version $X^2- Y W, X Y -Z W in I_(PP^3)(overline(Y))$, which shows that $overline(Y)$ is contained in the projective algebraic set formed by $X^2-Y W, X Y-Z W$.

    Also, notice that if we consider the curve carved out by $X=0$ and $W=0$, then the equation turns into the line ${[0,Y,Z,0]} tilde.equiv PP^1$. This is also in the algebraic set produced by the equations $X^2-Y W$ and $X Y-Z W$ (since $X=W=0$ automatically satisfies both equations).

    Now, we claim that the algebraic set is precisely ${[0,Y,Z,0]} union overline(Y)$ (a line and the twisted cubic curve). Given any $[X,Y,Z,W]$ in the algebraic set, suppose first $W=0$, then the equation shows that $X^2-Y W=X^2=0$, hence $X=0$. So, $[X,Y,Z,W] in {[0,Y,Z,W]}$ which belongs to the line. Else, if $W!=0$, then one can rescale everything by $W$. Define $x:=X/W$, $y:=Y/W$ and $z:= Z/W$, we get that $X^2-Y W=0 ==> x^2-y=0$, so $y=x^2$; and $X Y-Z W=0 ==> x y-z = 0$, so $z = x y=x^3$. This shows that $[X,Y,Z,W]=[x,y,z,1] = [x,x^2,x^3,1]$. Hence, $[X,Y,Z,W]=[x,x^2,x^3,1] in Y$ the original twisted cubic curve (recall that $Y=overline(Y) sect (PP^3\\H_W)$, the part where $W!=0$).

    Hence, the lagebraic set carved out by $X^2-Y W$ and $X Y-Z W$ is precisely the union of the twisted cubic curve and the line given by $X=W=0$.

    \ 

  + Notice that both equations $X^2-Y Z, Y in k[X,Y,Z]$ are both with degree $1$ in variable $Y$, showing that they're both irreducible. Hence, since $C:= Z_(PP^2)(X^2-Y Z)$, we have $I_(PP^n)(C) = I_(PP^2)(Z_(PP^2)(X^2-Y Z)) = sqrt((X^2-Y Z))=(X^2-Y Z)$ (since the equation is irreducible, its ideal is prime). Similarly, since $L:= Z_(PP^2)(Y)$, we also have $I_(PP^2)(L)=I_(PP^2)(Z_(PP^2)(Y))=sqrt((Y))=(Y)$ by the same reasoning about irreducibility.

    Now, consider $C sect L$, since any $[X,Y,Z] in C sect L$ must satisfy $Y=0$, we're left with $[X,0,Z]$; also, it needs to satisfy $X^2-Y Z=0$, hence $X^2 = 0$ (since $Y=0$), showing that $X=0$. So, for $[X,Y,Z]=[0,0,Z] in PP^2$, we must have $Z!=0$, hence it is classfied as the point $[0,0,1] in PP^2$. So, $C sect L = {[0,0,1]}$ (denote $P:= [0,0,1]$).

    If consider $I_(PP^2)(P)$, notice that it is cut out by the equations $X=0$ and $Y=0$ (since $[X,Y,Z]$ satisfies $X=Y=0$ iff it is given by $[0,0,Z]$ for $Z!=0$, which is equivalent to $P=[0,0,1]$). So, we get that $I_(PP^2)(P) = sqrt((X,Y)) = (X,Y)$ (since given that $k[X,Y,Z]\/(X,Y) tilde.equiv k[Z]$, it is an integral domain, hence $(X,Y)$ is prime).

    However, notice that now $I_(PP^2)(C)+I_(PP^2)(L) != I_(PP^2)(P)$: Given $(X^2-Y Z)+(Y)$, to show that it's not the same as $(X,Y)$, we'll prove that the element $X in.not (X^2-Y Z)+(Y)$. Suppose the contrary that $X in (X^2-Y Z)+(Y)$, for some $f,g in k[X,Y,Z]$, one has $X = f dot (X^2-Y Z)+g dot Y$. However, notice that if plug in $Y=0$, we get that $X = f(X,0,Z) dot X^2$. Since the left hand side is nonzero, we must have $f(X,0,Z)!=0$; yet, if we classify the degree in terms of $X$, the left hand side has degree $1$, while the right hand side has degree $>=2$ (since there is a factor of $X^2$), which reaches a contradiction. Therefore, $X in.not (X^2-Y Z)+(Y)$, showing that $(X^2-Y Z)+(Y) subset.neq (X,Y)$.

    Hence, we concluded that $I(C)+I(L)!= I(P)$, even though $C sect L=P$.
]

#pagebreak()

= D//6
#problem[
  Hartshorne 3.8:

  Let $H_i$ and $H_j$ be the hyperplanes in $PP^n$ defined by $x_i=0$ and $x_j=0$, with $i!=j$. Show that any regular function on $PP^n\\(H_i sect H_j)$ is constant.
][
  For definiteness, say $i,j=0,1$ respectively (for ease of demonstration, and the rest follows by swapping coordinates).Given any two points $[x]=[x_0,x_1,...,x_n], [y]=[y_0,y_1,...,y_n] in PP^n\\(H_i sect H_j)$, we claim that they can be connected using two lines isomorphic to $PP^1$.

  Since one of $x_0,x_1$ is nonzero (similarly, one of $y_0,y_1$ is nonzero by definition of $PP^n\\(H_0 sect H_1)$).  WLOG, say $y_1$ is nonzero (since we can swap the coordinates for every operation to get the case for $y_0!=0$). Then, there are two cases to consider:
  - First, suppose $x_1!=0$, take the line $PP^1 arrow.r PP^n$ by $[s,t] mapsto [s x_0+t y_0, x_1, s x_2+t y_2,...,s x_n+t y_n]$ (which the image is homeomorphic to $PP^1$ since it's essentially a quotient of a linear transformation that's injective from $AA^2 arrow.r AA^(n+1)$). Since $x_1!=0$, then the image of this line is lying in $PP^1\\(H_0 sect H_1)$. And, notice that for $[1,0], [0,1] in PP^1$ respectively, the corresponding points are $[x_0, x_1, x_2,...,x_n]$ and $[y_0, x_1, y_2,...,y_n]$.

    Then again, consider the line $PP^1 arrow.r PP^n$ by $[s',t'] mapsto [y_0, s x_1+y t_1, y_2,...,y_n]$, since $y_0!=0$ then the image of such curve is also lying in $PP^n \\ (H_0 sect H_1)$, while the points $[0,1],[1,0]$ corresponds to $[y_0, x_1, y_2,...,y_n]$ and $[y_0,y_1,y_2,...,y_n]$ respectively.

    So, these two lines in $PP^n \\ (H_0 sect H_1)$ in fact connects $[x_0,x_1,x_2,...,x_n]$ to $[y_0,y_1,y_2,...,y_n]$ (since they meet at a common point).

  - Else if $x_1=0$ (which implies $x_0!=0$ based on the definition of $PP^n\\(H_0 sect H_1)$), consider the line $PP^1 arrow.r PP^n$ by $[s,t] mapsto [s x_0+t y_0, t, s x_2+t y_2,...,s x_n+t y_n]$Then, notice that the image of the line is lying in $PP^n\\(H_0 sect H_1)$ (since if it's not, we must have $t=0$, but this enforces $s!=0$, which the first coordinate $s x_0+t y_0 = s x_0!=0$, so it still stays in $PP^n\\(H_0 sect H_1)$). At $[1,0],[0,1] in PP^1$, they have the point corresponding to $[x_0,0,x_2,...,x_n] = [x_0,x_1,x_2,...,x_n]$ and $[y_0,1,y_2,...,y_n]$ respectively.

    Then, consider the line $PP^1 arrow.r PP^n$ by $[s',t'] mapsto [y_0, s'+t' y_1, y_2,...,y_n]$. Since $y_0!=0$ by default, this line has image lying in $PP^n\\(H_0 sect H_1)$ also. At $[1,0],[0,1] in PP^1$ respectively, it correspond to the points $[y_0,1,y_2,...,y_n]$ and $[y_0,y_1,y_2,...,y_n]$ respectively.

  Hence, in both cases we can connect any two points in $PP^n\\(H_0 sect H_1)$ using two copies of $PP^1$ (as lines in $PP^n$).

  \ 

  Finally, recall that regular functions on any $PP^k$ is constant. So, given any regular function $f:PP^n\\(H_0 sect H_1) arrow.r k$, restricting to any lines isomorphic to $PP^1$ it must be constant. However, since any two points in $PP^n\\(H_0 sect H_1)$ can be conncted using two copies of $PP^1$ (that joins at some point), $f$ must be constant on these two copies of $PP^1$, showing that $f$ must evaluated to be the same value on both points. So, with the two points being arbitrary, $f$ must be constant on $PP^n\\(H_0 sect H_1)$.
]