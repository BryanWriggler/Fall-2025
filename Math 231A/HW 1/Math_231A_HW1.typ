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
  title: "Math 231A HW 1",
  authors: ("Zih-Yu Hsieh",),
  date: datetime.today().display("[month repr:long] [day], [year]"),
)

= D//1
#problem[
  Show that $GL_n (RR)$ has a smooth manifold structure.
][
  First, we'll view $GL_n (RR) subset.eq M_n (RR) = RR^(n^2)$ (as $RR$-vector space). Then, if consider the determinant function $det:M_n (RR)arrow.r RR$, it is precisely a polynomial function in terms of the $n^2$ entries of the $n times n$ matrices in $M_n (RR)$. Which, since polynomial functions are smooth, then the preimage of any open set under $det$ function is guaranteed to be open also. 

  Since for all $A in M_n (RR)$, we have $A in GL_n (RR) <==> det(A) != 0$, then $GL_n   (RR) = det^(-1)(RR\\{0})$, which since $RR\\{0}$ is an open set in $RR$, so is $GL_n (RR) subset.eq M_n (RR)$ under the standard topology of $M_n (RR)$ (as $RR^(n^2)$).

  \ 

  Now, since $M_n (RR)=RR^(n^2)$ is a finite dimensional $RR$-vector space, then $GL_n (RR)$ as an open subset of it, then for every $A in GL_n (RR)$ there exists radius $r>0$, such that $B_r (A) subset.eq GL_n (RR)$ (where the open ball $B_r (A)$ uses Euclidean Norm), then the identity function $id:B_r (A) arrow.r.tilde B_r (A)$ is precisely the homeomorphism of an open neighborhood of $A$ in $GL_n (RR)$, to an open neighborhood in $M_n (RR) = RR^(n^2)$, and all transition maps are simply the composition of restrictions of identity function, hence is smooth. This shows that $GL_n (RR)$ has a smooth manifold structure, and with dimension $n^2$. 
]

#pagebreak()

= D//2
#problem[
  Show that $SL_n (RR)$ has a smooth manifold structure.
][
  Our general goal is to prove that the determinant function is a submersion on $GL_n (RR)$ (which contains $SL_n (RR)$), so one can utilize #text(weight: "bold")[Proposition 1.18] (also mentioned in #text(weight: "bold")[Problem 3]) to prove that $SL_n (RR) subset GL_n (RR)$ forms a smooth submanifold.

  \ 

  First, we can again view $M_n (RR) := RR^(n^2)$ as default, and view $det:M_n (RR) arrow.r RR$ as a smooth function (or polynomial) with variables being the $n^2$ entries $(x_(i j))_(1<=i,j<=n)$ of the $n times n$ matrix.

  Recall that $GL_n (RR) = det^(-1)(RR\\{0})$ (because a matrix $A in GL_n (RR) <==> det(A)!=0$).

  Since $det$ has codomain being $RR$, which the tangent space at any point has dimension $1$, hence to prove that $det$ is a submersion on $GL_n (RR)$, it suffices to prove that the differential of $det$ is nonzero at all $A in GL_n (RR)$.

  If consider the $n times n$ matrix $X$ of indeterminates as follow:
  $ X = mat(x_(11),x_(12),...,x_(1n); x_(21),x_(22),...,x_(2n); dots.v, dots.v, dots.down, dots.v; x_(n 1), x_(n 2),...,x_(n n)) $
  Then, for any index $i in {1,...,n}$, $det(X) = sum_(j=1)^n (-1)^(i+j) x_(i j) dot det(M_(i j))$, where $M_(i j)$ is the $(n-1) times (n-1)$ minor after deleting the $i^(t h)$ row and the $j^(t h)$ column of $X$. 
  
  (#text(weight: "bold")[Rmk:] $M_(i j)$ doesn't contain any $x_(i k)$ since these indeterminates are all on the $i^(t h)$ row, hence $det(M_(i j))$ is independent from all $x_(i k)$, or $partial/(partial x_(i k))det(M_(i j))=0$).

  Hence, if consider the partial derivative with respect to any $x_(i k)$ of $det$, we get:
  $ (partial det(X))/(partial x_(i k)) = sum_(j=1)^n (-1)^(i+j) partial/(partial x_(i k))(x_(i j) dot det(M_(i j))) $
  $ = sum_(j=1)^n (-1)^(i+j)( (partial x_(i j))/(partial x_(i k)) dot det(M_(i j)) + x_(i j) dot partial/(partial x_(i k))(det(M_(i j)))) $
  $ = sum_(k=1)^n (-1)^(i+j)delta_(j k) dot det(M_(i j)) = (-1)^(i+k)det(M_(i k)) $
  Where $delta_(j k)$ representes the Kronecker Delta. So, since differential of $det$ can be expressed as a $1 times n^2$ matrix (linear map from $RR^(n^2) arrow RR$) that has entries being all $(partial det(X))/(partial x_(i k))$, to show that differential of $det$ is nonzero for all $A in GL_n (RR)$, it suffices to show that one of the above partial derivative - which is determinant of an $(n-1) times (n-1)$ minor of $A$ - is nonzero. Equivalently, it suffices to find an invertible $(n-1) times (n-1)$ minor of $A$.

  \ 

  \ 

  For all $A in GL_n (RR)$, since it's invertible, the collection of any (nonempty) list of its column vectors is linearly independent. WLOG, if we pick $v_1,...,v_(n-1)$ (represents the $1^(s t)$ to $(n-1)^(t h)$ column vector of $A$ respectively), then the $n times (n-1)$ matrix $B$ formed by column vectors $v_1,...,v_(n-1) in RR^n$ has column rank $(n-1)$ (due to the linear independence of $v_1,...,v_(n-1)$). Since any matrix satisfies column rank $=$ row rank, it means $B$ has row rank $(n-1)$. 
  
  For the $n$ row vectors of $B$, say $w_1,...,w_n in RR^(n-1)$, with the row rank of $B$ being $(n-1)$, then $"span"{w_1,...,w_n}$ is an $(n-1)$-dimensional $RR$-subpsace of $RR^(n-1)$, or $"span"{w_1,...,w_n} = RR^(n-1)$. Hence, the list ${w_1,...,w_n}$ is a spanning set of $RR^(n-1)$, which can be reduced to a basis of $RR^(n-1)$ (a sublist of $(n-1)$ vectors from ${w_1,...,w_n}$ spanning $RR^(n-1)$). 
  
  Therefore, there exists $j in {1,...,n}$, such that the list of $(n-1)$ row vectors ${w_1,...,w_(j-1),w_(j+1),...,w_n}$ spans $RR^(n-1)$, or it is a basis. Hence, the $(n-1) times (n-1)$ minor of $B$ (denote as $C$) by removing the $j^(t h)$ row (removing $w_j$) is in fact invertible (since its rwo vectors form a basis of $RR^(n-1)$). The below is the matrix we choose:
  $ A=mat(|,|, ,|,|; v_1,v_2,...,v_(n-1), v_n;|,|, ,|,|), quad B=mat(|,|, ,|; v_1,v_2,...,v_(n-1);|,|, ,|) = mat(-,w_1,-; -,w_2,-; ,dots.v, ;-,w_n,-) $
  $ C = mat(-,w_1,-; , dots.v, ; -,w_(j-1),-; -,w_(j+1),-; ,dots.v, ;-,w_n,-) $
  However, since $C$ can be obtained by removing the $n^(t h)$ column of $A$ (to obtain $B$) then removing the $j^(t h)$ row of $B$, it's the same matrix we obtained by removing the $n^(t h)$ column and $j^(t h)$ row of $A$, so $C=M_(j n)$ (the $(n-1) times (n-1)$ minor of $A$ by removing the $j^(t h)$ row and $n^(t h)$ column). This shows that $A$ indeed has an invertible $(n-1) times (n-1)$ minor.

  \ 

  Finally, with the previous derivation, we've shown that the differential of $det$ function at any $A in GL_n (RR)$ has one of the entries being nonzero (since there is at least one invertible $(n-1) times (n-1)$ minor of $A$), hence the differential of $det$ at $A$ is nonzero, showing that $det$ is a submersion at $A$, or $det$ is a submersion on $GL_n (RR)$.

  Then, because $1 in det(GL_n (RR)) = RR\\{0}$ and $det$ is a submersion on $GL_n (RR)$, using #text(weight: "bold")[Proposition 1.18], $det^(-1)(1) = SL_n (RR)$ is a manifold with smooth structure, and $dim(SL_n (RR)) = dim(GL_n (RR)) - dim(RR\\{0}) = n^2-1$. 

  (The proof of #text(weight: "bold")[Proposition 1.18] will be provided in #text(weight: "bold")[Problem 3]).

]

#pagebreak()

= D//3
#problem[
Solve #text(weight: "bold")[Exercise 1.10] in the lecture notes for smooth manifolds, then prove #text(weight: "bold")[Proposition 1.18] (You don't need to do this for $C^k$ / analytic cases).

\ 

#text(weight: "bold")[Exercise 1.10 (Modified):]

Let $f_1,...,f_m$ be functions $RR^n arrow.r RR$ which are smooth. Let $X subset RR^2$ be the set of points $P$ such that $f_i (P)=0$ for all $i$, and $d f_i (P)$ are linearly independent. Use the implicit function theorem to show that $X$ is a topological manifold of dimension $n-m$ and equip it with a natural smooth structure.


\ 

#prop(1.18)[If $F$ is a submersion then for any $Q in Y$, $F^(-1)(Q)$ is a manifold of dimension $dim X - dim Y$.][]
][

  #text(weight: "bold")[1. Exercise 1.10:] 

  Since $f_1,...,f_m:RR^n arrow.r RR$ are all smooth functions, consider $F:RR^n arrow.r RR^m$ satisfying $F(overline(x)) = (f_1(overline(x)),...,f_m (overline(x)))$. Since each entry is a smooth function, $F$ itself is smooth. 

  If considering its differential, we yield the following:
  $ d F = mat((partial f_1)/(partial x_1),...,(partial f_1)/(partial x_n); dots.v, dots.down, dots.v; (partial f_m)/(partial x_1), ..., (partial f_m)/(partial x_n)) = mat(-,d f_1,-; , dots.v, ; -, d f_m, -) $
  Since for all points $P in X$ satisfies $f_i (P)=0$ for all $i$, we have $F(P) = (f_1(P),..., f_m (P))=overline(0)$, showing that $P$ is a solution for the smooth function $F$.
  
  On the other hand, if consider $d F(P)$, since by assumption the row vectors of the differential $d f_1(P),...,d f_m (P)$ are all linearly independent, it implies that the row rank of $d F(P)$ is $m$; and since row rank and column rank are equal, if consider the column vectors $v_1(P),...,v_n (P) subset.eq RR^m$ of $d F(P)$, $"span"{v_1(P),...,v_n (P)} subset.eq RR^m$ is a subspace of dimension = column rank = row rank = $m$, hence $"span"{v_1(P),..., v_n (P)} = RR^m$, showing that it can be reduced to a basis of $RR^m$ (Note: $n >= m$, since $d f_1(P),...,d f_m(P) in RR^n$ are linearly independent).

  WLOG, up to coordinate permutation we can assume that ${v_(n-m+1)(P),...,v_n (P)}$ forms a basis of $RR^m$, then the $m times m$ minor $A_y$ formed by these column vectors is in fact invertible. Together with the $m times (n-m)$ matrix $A_x$ formed by ${v_1(P),...,v_(n-m)(P)}$, we have the following:
  $ d F(P) = mat(|, ,|,|, ,|; v_1(P),...,v_(n-m)(P), v_(n-m+1)(P),...,v_n (P); |, ,|,|, ,|; augment: #3) = mat(A_x, A_y; augment: #1) $
  Since $A_y$ is invertible, one can apply Implicit Function Theorem. Given $P=(p_1,...,p_(n-m),p_(n-m+1),...,p_n) in RR^n$, there exists open neighborhood $U subset.eq RR^(n-m)$ containing $(p_1,...,p_(n-m))$, open neighborhood $W subset.eq RR^m$ containing $(p_(n-m+1),...,p_n)$, and a smooth function $g:U arrow.r W$, such that for all $(x_1,...,x_(n-m)) in U$, $g(x_1,...,x_(n-m)) in RR^m$ satisfies $F(x_1,...,x_(n-m), g(x_1,...,x_(n-m))) = 0$, and $g(p_1,...,p_(n-m)) = (p_(n-m+1),...,p_n)$. Furthermore, $d g(p_1,...,p_(n-m)) = -A_y^(-1) A_x$ in matrix form.

  Then, if we consider the smooth function $overline(g):U arrow.r RR^n$ by $overline(g)(x_1,...,x_(n-m)) = (x_1,...,x_(n-m),g(x_1,...,x_(n-m)))$, the image of $overline(g)$ is solely contained in $X$. If we consider the projection $pi:RR^n arrow.r RR^(n-m)$ by $pi(x_1,...,x_n) = (x_1,...,x_(n-m))$, if restrict the domain of $pi$ onto $overline(g)(U)$, it satisfies the following for all $(x_1,...,x_(n-m)) in U$:
  $ pi(overline(g)(x_1,...,x_(n-m))) = pi(x_1,...,x_(n-m), g(x_1,...,x_(n-m)) = (x_1,...,x_(n-m))) $
  Similarly, for all $(x_1,...,x_(n-m), x_(n-m+1),...,x_n) in overline(g)(U)$, it satisfies:
  $ overline(g)( pi(x_1,...,x_(n-m), x_(n-m+1),...,x_n)) = overline(g)(x_1,...,x_(n-m)) = (x_1,...,x_(n-m),x_(n-m+1),...,x_n) $
  The above equality holds, since Implicit Function Theorem guarantees every $(x_1,...,x_(n-m)) in U$ to pair up with a unique $(x_(n-m+1),...,x_n) in W$, such that $F(x_1,...,x_(n-m), x_(n-m+1),...,x_n)=0$, while $g$ is defined to satisfy $g(x_1,...,x_(n-m)) = (x_(n-m+1),...,x_n)$.

  Hence, the above two equality shows that the projection $pi$ (after restriction, which is still continuous) is an inverse of $overline(g):U arrow.r overline(g)(U)$, hence $overline(g)$ is a homeomorphism. This shows that $P in X$ has an open neighborhood $overline(g)(U) subset.eq X$, where $overline(g)(U) tilde.equiv U$ while $U subset.eq RR^(n-m)$, showing $X$ is a topological manifold with dimension $(n-m)$. Finally, $X$ has a natural smooth structure simply because the map $g$ and its extension $overline(g)$ can be chosen as smooth functions (while the inverse of $overline(g)$, projection $pi$ is also a smooth function on $RR^n$), hence any transition map would be composition of restrictions of $overline(g)$ and some other projection $pi$, which is still smooth.

  \ 

  #text(weight: "bold")[Proposition 1.18:]

  Given a smooth map $F:X arrow.r Y$ that is a submersion. Let $n:=dim(X)$ and $m:=dim(Y)$. For any $Q in (Y sect F(X))$ (can ignore the case $Q in.not F(X)$), since there exists open neighborhood $U subset.eq Y$ containing $Q$, with local chart $g:U arrow.r.tilde tilde(U)$, where $tilde(U) subset.eq RR^m$ is an open set. In particular, one can choose $g$ (up to some translation in $RR^m$) so that $g(Q) = 0$. 
  
  Then, for all $P in F^(-1)(Q)$, let $V subset.eq X$ be an open neighborhood of $P$, with local chart $h:V arrow.r.tilde tilde(V)$ where $tilde(V) subset.eq RR^n$ is open. Then, if consider $W=V sect F^(-1)(U)$ as an open neighborhood of $P$ (since $P in F^(-1)(Q) subset.eq F^(-1)(U)$), one has the restriction of $h$, $h:W arrow.r.tilde h(W)$ be a homeomorphism to $h(W) subset.eq RR^n$ that is open. Hence, if consider the map $g compose F compose h^(-1):h(W) arrow.r U$, for all $x in W$, we have $h(x) in h(W)$ satisfies the following:
  $ d (g compose F compose h^(-1))_(h(x)) = d g_(F compose h^(-1)(h(x))) compose d F_(h^(-1)(h(x))) compose d(h^(-1))_(h(x)) $
  Since $g:U arrow.r tilde(U)$ is a homeomorphism from open subsets of $Y$ (as smooth manifold) to open subsets of $RR^m$, it in fact can be viewed as a smooth function that has diffrential being isomorphism (smooth homeomorphism must have differential being isomorphism of tangent space, since $id= d(id_U)_y = d(g^(-1) compose g)_y = d(g^(-1))_(g(y)) compose d g_y$, and similar result when interchanging $g^(-1)$ and $g$, showing $d g_y$ must be an isomorphism at all $y in U$). 
  
  Similar logic can also be applied to $h^(-1)$ (where $d(h^(-1))_z$ is also an isomorphism for all $z in h(W)$), hence with $F$ being a submersion (or $d F_x$ is surjective for arbitrary $x in X$), the above $d(g compose F compose h^(-1))_(h(x))$ is also surjective, which $g compose F compose h^(-1):h(W) arrow.r tilde(U)$ is in fact a submersion from $h(W) subset.eq RR^n$ to $U subset.eq RR^m$, that satisfies $g compose F compose h^(-1)(h(P)) = g compose F(P) = g(Q) = 0$.

  Which, we get that $(g compose F compose h^(-1))^(-1)(0) = (F compose h^(-1))^(-1)(g^(-1)(0)) = (F compose h^(-1))^(-1)(Q) subset.eq h(W)$ is a topological manifold of dimension $dim(h(W))- dim(tilde(U)) = n-m$, and endows with a smooth manifold structure (since it reduces to the case of #text(weight: "bold")[Exercise 1.10]). So, $F^(-1)(Q) sect W = h((F compose h^(-1))^(-1)(Q))$ also has a smooth manifold structure and with dimension $n-m$.

  Since $F^(-1)(Q)$ can be realized as arbitrary union of the above subset $F^(-1)(Q) sect W$, and the overlapped open regions between two different subsets above still agrees with each other (by restiction of local charts of $X$ onto $F^(-1)(Q)$), hence $F^(-1)(Q)$ can be realized as a smooth manifold with dimension $n-m$, or dimension $dim(X) - dim(Y)$.
]



#pagebreak()

= D//4
/*
#problem[
  Let $X$ be ${(x,y,t) in RR^3 | x^3+y^3+3t x y +1=0}$, show that $X$ has a smooth manifold structure. Now let $Y$ be the real line with coordinate $t$, and let $F:X arrow.r Y$ be the map sending $(x,y,t)$ to $t$. Show that $F$ is not a submersion, but the restriction of $F$ to the open set $t!=1$ is a submersion. What does $F^(-1)(1)$ look like?
][

  #text(weight: "bold")[1. Smooth Manifold Structure of $X$:]

  If consider the function $f:RR^3 arrow.r RR$ defined by $f(x,y,t) = x^3+y^3-3t x y+1$, then $X = f^(-1)(0)$ by definition. Which, if consider the differential $d f = mat(3x^2-3t y, 3y^2 - 3 t x, -3x y)$, we'll prove that $d f != 0$ for all $p in X$.

  Suppose the contrary that $d f_p = 0$ for some $p=(x,y,t) in X$, then $-3x y = 0$, showing that $x=0$ or $y=0$; for definiteness, say $x=0$, then the second entry $0=3y^2-3t x= 3y^2$, showing $y=0$ (else if $y=0$, one can deduce $0=3x^2-3t y=3x^2$, or $x=0$ through the first entry instead). Hence, $x=y=0$. But, if plug in $p=(0,0,t)$ to the given polynomial, we get $x^3+y^3-3t x y+1 = 1!=0$, which $p=(0,0,t)$ is not a solution to the given polynomial, hence $p in.not X$, contradicting the assumption that $p in X$. Therefore, $d f_p !=0$ for all $p in X$, hence $d f_p$ (as a single vector) is linearly independent for all $p in X$. Apply #text(weight: "bold")[Exercose 1.10] mentioned in #text(weight: "bold")[Problem 3] (where $f_1 := f$), we conclude that $X = f^(-1)(0)$ (every point $p in RR^3$ satisfying $f_1(p)=f(p)=0$) endows a smooth manifold structure, with dimension $3-1=2$.

  (#text(weight: "bold")[Rmk:] The proof from #text(weight: "bold")[Problem 3] requires the fact that the differential is nonzero, since that is the condition for having an $m times m$ - in this case, $1 times 1$ - minor that's invertible. The local chart can be constructed from the other two entries based on Implicit Function Theorem).

  \ 

  #text(weight: "bold")[2. Non-Submersion Property of $F$:]

  Given $Y$ as the real line with coordinate $t$, and let $F:X arrow.r Y$ be defined by $F(x,y,t)=t$. Then, to prove that it is not a submersion, we'll consider the point $(x,y,t)=(1,1,1) in RR^3$:

  Notice that it satisfies the equation, since $1^3 + 1^3 - 3 dot 1 dot 1 dot 1+1 = 0$, so $(1,1,1) in X$. Now, here let's explicitly calculate the local charts: From previous part, $d f= mat(3x^2-3t y, 3y^2 - 3t x, -3x y)$, so $d f(1,1,1) = mat(0,0,-3)$. By Implicit Function Theorem (Smooth Version), since the $(partial f)/(partial t)$ column is an invertible $1 times 1$ minor in $d f(1,1,1)$, then there exists an open neighborhood $U subset.eq RR^2$ containing $(x,y)=(1,1)$, open neighborhood $W subset.eq RR$ containing $t=1$, and a smooth function $g:U arrow.r W$, such that for all $(x',y') in U$, $t'=g(x',y')$ satisfies $f(x',y',t')=0$ (or $(x',y',t') in X$). In prticular, $g(1,1) =1$ (since it's the basepoint we choose for using Implicit Function Theorem).
  
  Hence, if consider $tilde(g):U arrow.r X$ by $tilde(g)(x',y') = (x',y',g(x',y'))$. If restrict $tilde(g)$ onto its image, then it becomes a homeomorphism (since the inverse is given by the projection $pi:tilde(g)(U) arrow.r U$, $pi(x',y',t') = (x',y')$ due to the property of Implicit Function Theorem, where each $(x',y') in RR^2$ is paired with a unique $t' in W$ satisfying $f(x',y',t')=0$. hence, $pi$ here is the desired local chart, where $tilde(g)$ is the map we'll use for calculating differential.

  Then, recall that for Implicit Function Theorem, the constructed smooth function $g$ at point $(x,y)=(1,1)$ has differential $d g(1,1) = mat((partial f)/(partial t))^(-1) mat((partial f)/(partial x), (partial f)/(partial y)) = -1/3 mat(0,0) = mat(0,0)$. Which, it implies that $tilde(g)$ (where $tilde(g)(x',y')=(x',y',g(x',y'))$) has differential at $(1,1)$ given by:
  $ d tilde(g)(1,1) = mat(1,0;
                   0,1;
                   (partial g)/(partial x), (partial g)/(partial y)) = mat(1,0; 0,1; 0,0) $
  Then, consider $F(x,y,t)=t$ as a smooth function, $d F = mat((partial t)/(partial x), (partial t)/(partial y), (partial t)/(partial t)) = mat(0,0,1)$. Using Chain Rule, we get:
  $ d(F compose tilde(g))(1,1) = d F(tilde(g)(1,1)) compose d tilde(g)(1,1) = mat(0,0,1) mat(1,0;0,1;0,0) = mat(0,0) $
  Hence, this shows that the differential of $F$ (restricting the domain onto Smooth Manifold $X$) is $0$ (based on the explicit differential calculated using local chart containing $(1,1,1)$), hence $F$ is not a submersion at $(x,y,t)=(1,1,1)$.

  \ 

  To prove that it's a differential for open set $t!=1$ in $X$, there are several cases to consider:
  1. For $(x,y,t) in X$ $x,y !=0$, since the differential $d f = mat(3x^2-3t y, 3y^2-3 t x, -3x y)$ has the last column being nonzero, can apply Implicit Function Theorem as above, it guarantees a smooth function $g:U arrow W$ for some open sets $U subset.eq RR^2$ containing $(x,y)$
]
*/

#problem[
  Let $X$ be ${(x,y,t) in RR^3 | x^3+y^3-3t x y +1=0}$, show that $X$ has a smooth manifold structure. Now let $Y$ be the real line with coordinate $t$, and let $F:X arrow.r Y$ be the map sending $(x,y,t)$ to $t$. Show that $F$ is not a submersion, but the restriction of $F$ to the open set $t!=1$ is a submersion. What does $F^(-1)(1)$ look like?
][
  #text(weight: "bold")[1. Smooth Manifold Structure of $X$]
  
  First, consider the following function $f:RR^3 arrow.r RR$ by $f(x,y,t)=x^3+y^3-3t x y+1$, then $X = f^(-1)(0)$ (since $X$ collects precisely the zeros of $f$). If consider this function's differential, we get $d f=mat((partial f)/(partial x), (partial f)/(partial y), (partial f)/(partial z)) = mat(3x^2-3t y, 3y^2-3t x, -3x y)$. Which, for any point $(x,y,t) in X$, one can consider the case where $x,y!=0$, $x=0$, or $y=0$ for different usage of Implicit Function Theorem. 
  
  (#text(weight: "bold")[Note]: We need not consider the case $x,y=0$, since it yields $f(0,0,t) = 0^3+0^3-0+1 !=0$ when plugging in arbitrary $t in RR$).

  Here, we'll directly construct all the local charts with Implicit Function Theorem (instead of directly applying #text(weight: "bold")[Problem 3]) for the easier calculation of differentials on $X$ later on.
  
  \

  - If both $x,y!=0$, since $-3x y!=0$, then this $1 times 1$ minor of $d f(x,y,t)$ is invertible. Hence, one can apply Implicit Function Theorem (smooth version), where there exists open neighborhood $U subset.eq RR^2$ containing $(x,y)$, open neighborhood $W subset.eq RR$ containing $t$, and a smooth function $phi:U arrow W$ satisfying $f(x_1,y_1,phi(x_1,y_1))=0$ for all $(x_1,y_1) in U$ (or $(x_1,y_1,phi(x_1,y_1)) in X$), and $phi(x,y)=t$. Also, the differential at $(x,y) in U$, $d phi(x,y) = -((partial f)/(partial t))^(-1)mat((partial f)/(partial x), (partial f)/(partial y)) = 1/(3x y)mat(3x^2-3t y, 3y^2-3t x)$.
    
    Then, this extends to a smooth function $overline(phi):U arrow.r X$, satisfying $overline(phi)(x_1,y_1)=(x_1,y_1,phi(x_1,y_1))$.

  \

  - Else if $x=0$, then we have $y!=0$ (based on the #text(weight: "bold")[Note] given above). Hence, $(partial f)/(partial y)=3y^2-3t x = 3y^2!=0$, so apply Implicit Function Theorem, there exists open neighborhood $U' subset.eq RR^2$ containing $(x,t)$, open neighborhood $W' subset.eq RR$ containing $y$, and a smooth function $psi:U' arrow W'$ satisfying $f(x_2,psi(x_2,t_2),t_2) = 0$ (or $(x_2,psi(x_2,t_2),t_2) in X$), and $psi(x,t)=y$. Again, the differential at $(x,t) in U'$, $d psi(x,t) = -((partial f)/(partial y))^(-1)mat((partial f)/(partial x),(partial f)/(partial t)) = -1/(3y^2)mat(3x^2-3t y, -3x y) = mat(t/y, 0)$ (based on the condition $x=0,y!=0$).

    This again extends to a smooth function $overline(psi):U' arrow.r X$, satisfying $overline(psi)(x_2,t_2)=(x_2,psi(x_2,t_2),t_2)$.
  
  \ 

  - Else if $y=0$, we have $x!=0$ based on the #text(weight: "bold")[Note] again. So, $(partial f)/(partial x)=3x^2-3t y=3x^2!=0$, again apply Implicit Function Theorem, there exists open neighborhood $U'' subset.eq RR^2$ containing $(y,t)$, open neighborhood $W'' subset.eq RR$ containing $x$, and a smooth function $theta:U'' arrow W''$ satisfying $f(theta(y_3,t_3),y_3,t_3) = 0$ (or $(theta(y_3,t_3),y_3,t_3) in X$), and $theta(y,t)=x$. Similarly, the differential at $(y,t) in U''$ is provided by $d theta(y,t)=-((partial f)/(partial x))^(-1)mat((partial f)/(partial y),(partial f)/(partial t)) = -1/(3x^2)mat(3y^2-3t x, -3x y) = mat(t/x,0)$ (based on $x!=0, y=0$).
    
    This also extends to a smooth function $overline(theta):U'' arrow X$, satisfying $overline(theta)(y_3,t_3) = (theta(y_3,t_3),y_3,t_3)$.

  \ 

  Notice that for all cases above, $overline(phi), overline(psi), overline(theta)$ are all homeomorphism onto their own image: For definiteness, consider the first case with $overline(phi)$, the projection $pi:overline(phi)(U) arrow.r U$ by $pi(overline(phi)(x_1,y_1)) = pi(x_1,y_1,phi(x_1,y_1)) = (x_1,y_1)$ also satisfies $overline(phi)(pi(x_1,y_1,t_1)) = overline(phi)(x_1,y_1) = (x_1,y_1,phi(x_1,y_1)) = (x_1,y_1,t_1)$ (since Implicit Function Theorem guarantees every $(x_1,y_1) in U$ to pair up with a unique $t_1 in W$, so that $phi(x_1,y_1)=t_1$). Hence, the projection $pi$ back to the original coordinate is a continuous inverse of $overline(phi)$, showing it's indeed a homeomorphism to its image.

  Similar concept applies to the other two cases (where it projects onto different entries), which shows that all $(x,y,t)$ there exists a neighborhood in $X$ that is homeomorphic to an open subset in $RR^2$ (the explicit maps are provided by $overline(phi),overline(psi)$, or $overline(theta)$ depending on the case), showing that $X$ is a topological manifold with dimension $2$.

  And, the reason it has a smooth structure, is simply because every map mentioned above can be chosen as smooth functions, causing the transition map to also be smooth.

  \ 

  #text(weight: "bold")[2. Non-Submersion of $F$:]

  To show that $F:RR^3 arrow RR$ by $F(x,y,t)=t$ (after restricting to $X$) is not a submersion, we'll consider its behavior at $(1,1,1)$: It's clear that $f(1,1,1)=1^3+1^3-3 dot 1+1=0$, hence $(1,1,1) in X$. Since it satisfies $x,y!=0$, then apply the first case, one obtains $overline(phi):U arrow X$ (where $(1,1) in U subset.eq RR^2$) with $overline(phi)(x,y)=(x,y,phi(x,y))$ and $overline(phi)(1,1) = (1,1,1)$ as the chart. Since $d phi(1,1) = -1/3 mat(0,0)$ (by plugging in $(x,y,t)=(1,1,1)$ to the differential calculated beforehand), then $overline(phi)$ has differential at $(1,1)$ provided as: 
  $ d overline(phi)(1,1)= mat(1,0;0,1;(partial phi)/(partial x), (partial phi)/(partial y)) = mat(0,1;1,0;0,0) $
  Hence, if compose this with $F$ (where $d F = mat(0,0,1)$ by calculation), we get:
  $ d (F compose overline(phi))(1,1) = d F(overline(phi)(1,1)) compose d overline(phi)(1,1) = mat(0,0,1) mat(1,0;0,1;0,0) = mat(0,0) $
  This shows that the differential of $F$ at $(1,1,1)$ (when restricting onto $X$) in fact is not surjective (since the differential is $0$). Hence, $F$ is not a submersion.

  \ 

  #text(weight: "bold")[3. Submersion of $F$ on $t!=1$:]

  For any $(x,y,t) in X$ satisfying $t!=1$, we'll explicitly calculate the differential:

  \ 

  - For $x,y!=0$, the first local chart described by $overline(phi)$ can be used. Since $d phi(x,y) = 1/(3x y)mat(3x^2-3t y, 3y^2-3t x)$, for $t!=1$ we yield $d phi(x,y)!=0$: Suppose the contrary that $d phi(x,y)=0$, we have $3x^2-3t y= 3y^2-3t x=0$, showing that $t = x^2/y = y^2/x$, or $x^3=y^3$, which implies $x=y$. However, plug back to the given condition, we get $3x^2-3t y=3x^2-3t x=0$, or $x=t$, hence $x=y=t$. But then, we have $f(x,y,t) = x^3+y^3-3t x y+1 = t^3+t^3-3t^3+1 = 1-t^3 = 0$, or $t^3=1$, implying $t=1$, which contradicts the assumption that $t!=1$. This shows that $d phi(x,y) != 0$, hence one of the coordinate is nonzero.

    So, if consider $d overline(phi)(x,y)$ (where $overline(phi)(x,y) = (x,y,phi(x,y))$), it's provided as:
    $ d overline(phi)(x,y) = mat(1,0;0,1;(partial phi)/(partial x),(partial phi)/(partial y)) $
    Where one of the entries in the third row is nonzero. Hence: 
    $ d (F compose overline(phi))(x,y) = d F(overline(phi)(x,y)) compose d overline(phi)(x,y) = mat(0,0,1)mat(1,0;0,1;(partial phi)/(partial x),(partial phi)/(partial y)) = mat((partial phi)/(partial x),(partial phi)/(partial y)) !=0 $
    With $d(F compose overline(phi))(x,y)!=0$, and the fact that the target space of $F$ (namely $RR$) is a $1$-dimensional smooth manifold, then the differential being nonzero implies it's surjective.

  \ 

  - For the case $x=0$, we can use the local chart in the form of $overline(psi)$. Since $d psi(x,t) = mat(t/y,0)$, we have $overline(psi)(x_2,t_2)=(x_2,psi(x_2,t_2),t_2)$ having the following differential at $(x,t) in U'$:
    $ d overline(psi)(x,t) = mat(1,0; (d psi)/(d x), (d psi)/(d t); 0,1) = mat(1,0; -t/y,0; 0,1) $
    Hence, we get:
    $ d(F compose overline(psi))(x,t) = d F(overline(psi)(x,t)) compose d overline(psi)(x,t) = mat(0,0,1) mat(1,0;t/y,0;0,1) = mat(0,1) $
    Therefore $F$ has nonzero differential at $(x,y,t)$ when considering it as a smooth map on $X$ for $x=0$, showing the differential of $F$ at $(x,y,t)$ is surjective.

  \ 

  - Finally, for the case $y=0$, we se the local chart in the form of $overline(theta)$. Since $d theta(y,t)=mat(t/x,0)$, with $overline(theta)(y_3,t_3) = (theta(y_3,t_3),y_3,t_3)$, we have its differential at $(y,t)$ represented as:
    $ d overline(theta)(y,t) = mat((d theta)/(d y), (d theta)/(d t); 1,0; 0,1) = mat(t/x,0; 1,0; 0,1) $
    Hence, we get:
    $ d(F compose overline(theta))(y,t)=d F(overline(theta)(y,t)) compose d overline(theta)(y,t) = mat(0,0,1)mat(-t/x,0; 1,0; 0,1) = mat(0,1) $
    This again shows that $F$ has nonzero differential at $(x,y,t)$ when treating it as a smooth map on $X$ for $y=0$, showing the differential of $F$ at $(x,y,t)$ is again surjective.

  \ 

  Since in all possible cases of $t!=1$, $F$ has surjective differential at $(x,y,t) in X$, then $F$ is indeed a submersion on $t!=1$.

  \ 

  Finally, if consider $F^(-1)(1)$, for all $(x,y,1)!=(1,1,1)$, if $x=0$ or $y=0$, then the case of $overline(psi), overline(theta)$ from above (in part 3) still applies (since they don't rely on the assumption $t!=1$ to derive nontrivial differential for $F$), so close to $(x,y,1)$ one can still derive a $1$-dimensional manifold structure for $F^(-1)(1)$ (by applying Implicit Function Theorem like #text(weight: "bold")[Problem 3]). For the case $x,y!=0$, we have $d overline(phi)(x,y)!=0$ (since in the above case of part 3, we proved how the differential is $0$ implies $x=y=t$, but here one of the $x,y !=1$ by assumption, so $d overline(phi)(x,y)!=0$), showing if $(x,y,1) in F^(-1)(1)$ is different from $(1,1,1)$, it locally has a $1$-dimensional smooth manifold structure.

  And, since at $(1,1,1) in F^(-1)(1)$ has differential of $F$ being $0$ indicates that it must be an isolated point in $F^(-1)(1)$ (since if it's not isolated it should be included in one of the neighborhoods of some other points in $F^(-1)(1)$). Hence, $F^(-1)(1)$ is consists of lines ($1$-dimensional manifold), and the isolated point $(1,1,1)$.
] 

#pagebreak()

= D//5
#problem[
  Prove the chain rule stated at the beginning of page 17 of the lecture notes:

  Given $F:X arrow.r Y$ and $G:Y arrow.r Z$ that are regular maps between manifolds of same reglarity, then:
  $ d(G compose F)_P = d G_(F(P)) compose d F_P $
][
  By definition, $d(G compose F)_P:T_P X arrow.r T_(G compose F(P))Z$ is a linear map satisfying $(d(F compose G)_P dot v)(f) = v(f compose (G compose F))$ for all derivation $v in T_P X$, and all class of regular function $f in O_(G compose F(P))$.

  \ 

  Similarly, $d F_P:T_P X arrow.r T_(F(P))Y$ satisfies $(d F_P dot v)(g) = v(g compose F)$ for all derivation $v in T_P X$ and all class of regular function $g in O_(F(P))$; also, $d G_(F(P)):T_(F(P))Y arrow.r T_(G(F(P)))Z$ satisfies $(d G_(F(P)) dot u)(h) = u(h compose G)$ for all derivation $u in T_(F(P))Y$ and class of regular function $h in O_(G compose F(P))$.

  \ 

  By associativity of function composition, given $f in O_(G compose F(P))$ and $v in T_P X$, the first term $(d (G compose F)_P dot v)(f)=v(f compose (G compose F))$ can be rewritten as:
  $ v((f compose G) compose F) = (d F_P dot v)(f compose G) $
  This is due to the fact that $f compose G$ is a class of regular function in $O_(F(P))$. Then again, since $f$ is a class of regular function in $O_(G compose F(P))$, and $d F_P dot v in T_(F(P)) Y$, using the same argument, we have:
  $ (d F_P dot v)(f compose G) = (d G_(F(P)) dot (d F_P dot v))(f) = (d G_(F(P)) compose d F_P (v))(f) $
  Hence, we get $(d (G compose F)_P dot v)(f) = (d G_(F(P)) compose d F_P (v))(f)$, showing that $d(G compose F)_P = d G_(F(P)) compose d F_P$.
]