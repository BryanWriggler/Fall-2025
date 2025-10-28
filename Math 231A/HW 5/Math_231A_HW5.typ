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
  title: "Math 231A HW 4",
  authors: ("Zih-Yu Hsieh",),
  date: datetime.today().display("[month repr:long] [day], [year]"),
)

#set enum(numbering: "(1)")

= ND//1
#problem[
  Etingof Problem Set 3.13:

  + Let $frak(g)$ be a three-dimensional real Lie algebra with basis $x,y,z$ and commutation relation $[x,y]=z$, $[z,x]=[z,y]=0$ (this algebra is called #emph[Heienberg Algebra]). Without using Campbell-Hausdorff formula, show that in the correspondin Lie group, one has $exp(t x) exp(s y)=exp(t s z)exp(s y)exp(t x)$ and construct explicitly the connected, simply-connected Lie group corresponding to $frak(g)$.

  + Generalize the previous part to the Lie algebra $frak(g)=V plus.circle RR z$, where $V$ is a real vector space with non-degenerate skew-symmetric form $w$ and the commutation relations are given by $[v_1,v_2]=w(v_1,v_2)z, [z,v]=0$.
][
  Since both questions have nearly the same method, so we'll state and prove the generalized case in (2), then go back and prove (1).

  #lemma([Part (2)])[
    Given the Lie algebra $frak(g)=V plus.circle RR z$, where $V$ is a finite-dimensional real vector space with non-degenerate skew-symmetric form $w$.

    Define the Lie Bracket $[dot, dot]:frak(g) times frak(g) arrow.r frak(g)$ by commutation relation $[v_1,v_2]=w(v_1,v_2)z$ and $[z,v]=0$ for all $v,v_1,v_2 in V$. Let $G$ be the simply-connected Lie Group corresponding to $frak(g)$, then the following formula always holds:
    $ exp(v_1)exp(v_2) = exp(w(v_1,v_2)z) exp(v_2)exp(v_1) $
  ][]

  To prove the above statement, we'll approach using the following several statements:

  \ 

  #text(weight: "bold")[I. Center of $frak(g)$ is $RR z$:]

    Given that $frak(g)=V plus.circle RR z$, then every $v in frak(g)$ can be uniquely expressed as $v_1+k z$, where $v_1 in V$ and $k in RR$. Which, given that $u=v_2 + k' z$ (with $v_2 in V$ and $k' in RR$) with $u in frak(z):= $ center of $frak(g)$, then we must have $[u, v]=0$ for all $v in frak(g)$. Hence, the following is true:
    $ 0=[u,v]=[v_2+k' z, v_1+k z]=[v_2,v_1] + k [v_2,z]+k' [z,v_1]+k k'[z,z] = w(v_2,v_1)z $
    This implies that $w(v_2,v_1)=0$ for every $v_1 in V$. However, with $w$ being a non-degenerate bilinear form, if $v_2!=0$, one must have some corresponding $v_2' in V$ such that $w(v_2,v_2')!=0$. Hence, this enforces $v_2=0$, so $u=k' z in RR z$. This shows that $frak(z) subset.eq RR z$.

    Also, notice that given any $k in RR$, any $v=v_1+k' z in frak(g)$ (where $v_1 in V$ and $k' in RR$) satisfies the following:
    $ [k z, v_1+k'z]=k[z,v_1]+k k'[z,z]=0 $
    Hence, we also have $k z in frak(z)$, or $RR z subset.eq frak(z)$. Therefore, $frak(z)=RR z$, this is the center of the Lie algebra $frak(g)$.

    \ 

  #text(weight: "bold")[II. $RR z=frak(z)$ is the Derived Subalgebra $[frak(g),frak(g)]$:]

    Given any $v,w in frak(g)$, since $v=v_1+k z$ and $w=v_2+k' z$ for some $v_1,v_2 in V$ and $k,k' in RR$, then one has the following:
    $ [v,w]=[v_1+k z,v_2+k' z]=[v_1,v_2]+k'[v_1,z]+k[z,v_2]+k k'[z,z] = w(v_1,v_2)z $
    Hence, the generators of $[frak(g),frak(g)]$ is contained in $RR z$, showing that $[frak(g),frak(g)] subset.eq RR z$.

    Also, since $w$ is a non-degenerate bilinear form, every $v_1 in V$ has a corresponding $v_2 in V$ such that $w(v_1,v_2)!=0$ (WLOG by scaling with some scalar, one can say there $w(v_1,v_2)=1$). Hence, $z=w(v_1,v_2)z=[v_1,v_2] in [frak(g),frak(g)]$, showing that $RR z subset.eq [frak(g),frak(g)]$. Therefore, $RR z=[frak(g),frak(g)]$, showing that the derived subalgebra of $frak(g)$ is also the center of $frak(g)$.

    \ 

  #text(weight: "bold")[III. $[frak(g),frak(g)]$ is the Tangent Space of $[G,G]$, the Derived Subgroup of $G$:]

    First, given any $x,y in frak(g)$, any $s,t in RR$ satisfies $exp(t x)exp(s y)exp(-t x)exp(-s y) in [G,G]$ by definition. Which, for small enough $s,t in RR$, one can have the expression being in the domain of the $log$ map. Then, we get the following:
    $ [x,y]=lim_(s,t arrow.r 0)log(exp(t x)exp(s y)exp(-t x)exp(-s y))/(s t) in T_1([G,G]) $
    Hence, since all generators of $[frak(g),frak(g)]$ (i.e. every vector of the form $[x,y]$ for some $x,y in frak(g)$) are contained in $T_1([G,G])$, it implies $[frak(g),frak(g)] subset.eq T_1([G,G])$.

    On the other hand, let $U$ be the domain of the $log$ map, and consider $U sect [G,G]$ (which is an open neighborhood of $1 in [G,G]$, which generates $[G,G]$). 


    ...

    \ 

  Finally, recall that $[frak(g),frak(g)]=RR z=frak(z) = T_1(Z(G))$ (where $Z(G)$ denotes the center of the Lie group $G$), hence for any $v_1,v_2 in V$, with suitable scaling so that $exp(v_1)exp(v_2)exp(-v_1)exp(-v_2) in [G,G]$ being in the domain of the $log$ map, we have the following for some $c in RR$:
  $ log(exp(v_1)exp(v_2)exp(-v_1)exp(v_2))=c z in [frak(g),frak(g)] $
]

#pagebreak()

= D//2
#problem[
  Etingof Problem Set 3.18:

  Let 
  $ S=mat(0,-1;1,0) in SL(2,CC) $
  + Show that $S=exp(pi/2 (f-e))$, where $e,f in sl(2,CC)$ are standard basis elements.
  + Compute $Ad S$ in the basis $e,f,h$.
][
  + If consider the standard basis of $sl(2,CC)$ as ${h=mat(1,0;0,-1), e=mat(0,1;0,0), f=mat(0,0;1,0)}$, if consider $exp(t (f-e))$, we have the following (using the relation $mat(0,-1;1,0)^2= mat(-1,0;0,-1)$):
    $ exp(t(f-e)) &= sum_(n=0)^infinity t^n mat(0,-1;1,0)^n/n! = sum_(k=0)^infinity t^(2k)mat(0,-1;1,0)^(2k)/(2k)!+t^(2k+1)mat(0,-1;1,0)^(2k+1)/(2k+1)!\
    &= sum_(k=0)^infinity t^(2k)mat(-1,0;0,-1)^k/(2k)! + t^(2k+1)mat(-1,0;0,-1)^k mat(0,-1;1,0)/(2k+1)!\
    &= sum_(k=0)^infinity (-1)^k t^(2k)/(2k)!mat(1,0;0,1) + (-1)^k t^(2k+1)/(2k+1)! mat(0,-1;1,0)\ 
    &= mat(cos(t),0;0,cos(t))+mat(0,-sin(t);sin(t),0) $
    Hence, plugin $t=pi/2$, we get that $exp(pi/2(f-e)) = mat(cos(pi/2),-sin(pi/2);sin(pi/2),cos(pi/2)) = mat(0,-1;1,0)=S$.

    \ 

  + If consider the exponentiation curve of the basis elements $h,e,f$, we get the following for all $t in CC$ (recall that $e^2 = f^2 = 0$):
  $ exp(t h) = sum_(n=0)^infinity t^n mat(1,0;0,-1)^n/n! = sum_(n=0)^infinity mat(t^n,0;0,(-t)^n)/n! = mat(e^t,0;0,e^(-t)) $
  $ exp(t e)=sum_(n=0)^infinity t^n mat(0,1;0,0)^n/n! = mat(1,t;0,1), quad exp(t f)=sum_(n=0)^infinity t^n mat(0,0;1,0)^n/n! = mat(1,0;t,1) $
    Then as a smooth map, $Ad S:SL(2,CC) arrow.r.tilde SL(2,CC)$ acts on the above three matrices as follow:
    $ Ad S(exp(t h)) &= mat(0,-1;1,0) mat(e^t,0;0,e^(-t)) mat(0,-1;1,0)^(-1) =mat(0,-1;1,0) mat(e^t,0;0,e^(-t))mat(0,1;-1,0)\ 
    &= mat(0,-e^(-t);e^t,0)mat(0,1;-1,0) = mat(e^(-t),0;0,e^t)  $
    $ Ad S(exp(t e))=mat(0,-1;1,0)mat(1,t;0,1)mat(0,1;-1,0) = mat(0,-1;1,t)mat(0,1;-1,0) = mat(1,0;-t,1) $
    $ Ad S(exp(t f))=mat(0,-1;1,0) mat(1,0;t,1) mat(0,1;-1,0)=mat(-t,-1;1,0)mat(0,1;-1,0) = mat(1,-t;0,1) $
    Therefore, geometrically the differential $(Ad S)_*$ has the action on $h,e,f$ given as follow:
    $ (Ad S)_*(h) &= d/(d t)eval(#300%)_(t=0) Ad S(exp(t h))= d/(d t)eval(#300%)_(t=0) mat(e^(-t),0;0,e^t)\
    &= mat(-e^(-t),0;0,e^t)eval(#300%)_(t=0) = mat(-1,0;0,1)=-h  $
    $ (Ad S)_*(e) &= d/(d t)eval(#300%)_(t=0)Ad S(exp(t e))=d/(d t)eval(#300%)_(t=0) mat(1,0;-t,1)\ 
    &= mat(0,0;-1,0) = -f $
    $ (Ad S)_*(f) &= d/(d t)eval(#300%)_(t=0) Ad S(exp(t f))=d/(d t)eval(#300%)_(t=0) mat(1,-t;0,1)\ 
    &= mat(0,-1;0,0)=-e $
    So, writing in the ordered basis of $e,f, h$, the matrix is written as follow:
    $ cal(M)((Ad S)_*) = mat(0,-1,0;-1,0,0;0,0,-1) $
] 

#pagebreak()

= ND (part (1),(4))//3
#problem[
  Etingof Problem Set 3.19:

  Let $G$ be a complex connected Lie group.
  + Show that $g mapsto Ad g$ is an analytic map $G arrow.r gl(frak(g))$.
  + Assume that $G$ is compact, show that then $Ad g=1$ for any $g in G$.
  + Show that any connected compact complex group must be commutative.
  + Show that if $G$ is a connected complex compact group, then the exponential map gives an isomorphism of Lie groups $frak(g)\/L tilde.equiv G$ for some Lattice $L subset frak(g)$ (i.e. a free abelian group of rank equal to $2 dim(frak(g))$).
][
  + Assume this is true (fix this part later).

    \ 

  + Given that $G$ is compact (also connected complex Lie group by initial assumption), then the analytic map $Ad:G arrow.r gl(frak(g))$ must either be surjective or constant (by the maximum principle of complex manifold). However, since $gl(frak(g)) tilde.equiv M_n (CC)$ as manifold/vector space (given that $dim_CC (frak(g))=n$), $gl(frak(g))$ is not bounded with the natural euclidean norm, which is not compact. Then, $Ad:G arrow.r gl(frak(g))$ must not be surjective (if it's surjective, since $Ad(G) = gl(frak(g))$, then $Ad(G)$ is not compact; however $Ad$ as a continuous map must send compact sets to compact sets, so $Ad(G)$ is also compact. This is a contradiction). Hence, $Ad$ must be constant.

    Finally, since $id_frak(g) in im(G)$ (since $1 in G$ satisfies $Ad(1)=id_G$, so its differential $Ad 1_* = id_frak(g)$), then with $Ad$ being constant, then one must have $Ad g = id_frak(g)$ for all $g in G$. Denote $1:=id_frak(g) in gl(frak(g))$, one yields $Ad g=1$ for all $g in G$.

    \ 

  + Based on part (2), every $g in G$ satisfies $Ad g=1 in gl(frak(g))$. However, recall that every Lie group homomorphism $phi:G arrow.r K$ is uniquely determined by $phi_*: frak(g) arrow.r frak(k)$ (where the mathfrak of the lowercase symbol represents the lie algebra of the corresponding Lie group). Then, with every $g in G$ (and the corresponding adjoint map $Ad g:G arrow.r G$) satisfies $Ad g_* = 1 in gl(frak(g))$, while $id_G$ also satisfies $(id_G)_* = 1 in gl(frak(g))$, by uniqueness of the Lie group homomorphism, $Ad g_* = (id_G)_*$ implies $Ad g=id_G$. Hence, $Ad g(h) = g h g^(-1) = h$ for all $g,h in G$, showing that $g h=h g$ for all $g,h in G$, or $G$ is commutative.

    \ 

  + Given that $G$ is a connected complex compact Lie group, then by part (3) we know $G$ is commutative. Hence, given any $x,y in frak(g)$ (its Lie algebra), one has $exp(x+y)=exp(x)exp(y)$ based on commutativity. Hence, $exp:frak(g) arrow.r G$ is in fact a group homomorphism.

    Then, recall that there exists open neighborhood $U subset.eq frak(g)$ (where $0 in U$) and $tilde(U) subset.eq G$ (where $1 in tilde(U)$), such that $exp:U arrow.r.tilde tilde(U)$ is a diffeomorphism, while open neighborhood of $1 in G$ generates $G$ based on the connectedness of $G$. Hence, every $g in G$ can be expressed as products of finite $g_1,...,g_n in tilde(U)$, where each $g_i in tilde(U)$ can be expressed as $exp(x_i)$ for some $x_i in U$. Hence, we get that $g = product_(i=1)^n g_i = product_(i=1)^n exp(x_i) = exp(sum_(i=1)^n x_i) in im(exp)$, which shows that $exp$ is surjective.

    Hence, by First Isomorphism Theorem 
]