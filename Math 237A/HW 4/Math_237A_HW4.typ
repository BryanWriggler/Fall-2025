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
  title: "Math 237A HW 4",
  authors: ("Zih-Yu Hsieh",),
  date: datetime.today().display("[month repr:long] [day], [year]"),
)

#set  enum(numbering: "(a)")

= ND//1
#problem[
  Lazarsfeld Problem Set 4 (1):

  Let $X subset.eq PP^n$ be a hypersurface of degree $d$ (i.e. $X={F_d=0}$ for some homogeneous polynomial of degree $d$). Show that $PP^n\\X$ is (isomorphic to) an affine variety.
][
  
]

#pagebreak()

= ND (c)//2
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

  + Rough: Consider $X!=0$ and $Y!=0$ separately, then we form either equations in $x=X/Y$ or equations in $x=Y/X$. Having point $s$ such that there are common zeros for both equations, it reduces to the statements above.
]

#pagebreak()

= ND (b)//3
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

  + Recall from #text(weight: "bold")[Homework 1], the twisted cubic curve $Y = {(t,t^2,^3) in AA^3|t in k} subset.eq AA^3$ is an affine variety with $I_(AA^3)(Y) = (y-x^2, z-x^3)$ (given that the polynomial ring of $AA^3$ is in terms of $k[x,y,z]$).
    
]

#pagebreak()

= ND//4
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

  + Based on part (a), there are two casees one can consider:
    - First, if consider the open set $U_0={x!=0}$ (where $U_0 tilde.equiv AA^3$), then WLOG one can identify $U_0 sect Q$ as the points $[1,y,z,w]$ (after normalizing with $x$) that satisfies $y-z w=0$. Now, let $t:=z$ be arbitrary, then each $t$ identifies a linear variety $y - t w=0$. So, let $L_t:={y-t w=0} subset.eq U_0 tilde.equiv AA^3$ be the linear variety corresponding to $t$, we get that $U_0 sect Q = union.big_(t in k)L_t$. And, given $t,u in k$ satisfying $t!=u$, we have $L_t sect L_u=emptyset$ (since if $y,w in k$ satisfies $y-t w = 0 = y-u w$, )
]

= ND//5
#problem[
  Hartshorne 2.16:

  + The intersection of two varieties need not be a variety. For example, let $Q_1$ and $Q_2$ be the quadric surfaces in $PP^3$ GIVEN BY THE EQUATIONS $X^2-Y W=0$ AND $X Y-Z W=0$, respectively. Show that $Q_1 sect Q_2$ is the union of a twisted cubic curve and a line.
  + Even if the intersection of two varieties is a variety, the ideal of the intersection may not be the sum of the ideals. For exxample, let $C$ be the conic in $PP^2$ given by the equation $X^2-Y Z=0$. Let $L$ be the line givenn by $Y=0$. Show that $C sect L$ consists of one point $P$, but that $I(C)+I(L)!= I(P)$.
][
  
]

= ND//6
#problem[
  Hartshorne 3.8:

  Let $H_i$ and $H_j$ be the hyperplanes in $PP^n$ defined by $x_i=0$ and $x_j=0$, with $i!=j$. Show that any regular function on $PP^n\\(H_i sect H_j)$ is constant. ()
][
  
]