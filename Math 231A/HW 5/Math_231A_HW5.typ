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

  + 
]