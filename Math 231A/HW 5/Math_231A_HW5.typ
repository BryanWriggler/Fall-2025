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

= D//1
#problem[
  Etingof Problem Set 3.13:

  + Let $frak(g)$ be a three-dimensional real Lie algebra with basis $x,y,z$ and commutation relation $[x,y]=z$, $[z,x]=[z,y]=0$ (this algebra is called #emph[Heienberg Algebra]). Without using Campbell-Hausdorff formula, show that in the correspondin Lie group, one has $exp(t x) exp(s y)=exp(t s z)exp(s y)exp(t x)$ and construct explicitly the connected, simply-connected Lie group corresponding to $frak(g)$.

  + Generalize the previous part to the Lie algebra $frak(g)=V plus.circle RR z$, where $V$ is a real vector space with non-degenerate skew-symmetric form $w$ and the commutation relations are given by $[v_1,v_2]=w(v_1,v_2)z, [z,v]=0$.
][
  Since both questions have nearly the same method, so we'll state and prove the generalized case in (2), then go back and prove (1).


  
  2. #lemma([Part (2)])[
    Given the Lie algebra $frak(g)=V plus.circle RR z$, where $V$ is a finite-dimensional real vector space with non-degenerate skew-symmetric form $w$.

    Define the Lie Bracket $[dot, dot]:frak(g) times frak(g) arrow.r frak(g)$ by commutation relation $[v_1,v_2]=w(v_1,v_2)z$ and $[z,v]=0$ for all $v,v_1,v_2 in V$. Let $G$ be the simply-connected Lie Group corresponding to $frak(g)$, then the following formula always holds,for all $s,t in RR$ and $v_1,v_2 in V$:
    $ exp(t v_1)exp(s v_2)exp(-t v_1)exp(-s v_2) = exp(t s dot w(v_1,v_2)z) $
  ][
    To prove the above statement, we'll approach using the following:

    \ 

    #text(weight: "bold")[I. Center of $frak(g)$ is $RR z$:]

    Given that $frak(g)=V plus.circle RR z$, then every $v in frak(g)$ can be uniquely expressed as $v_1+k z$, where $v_1 in V$ and $k in RR$. Which, given that $u=v_2 + k' z$ (with $v_2 in V$ and $k' in RR$) with $u in frak(z):= $ center of $frak(g)$, then we must have $[u, v]=0$ for all $v in frak(g)$. Hence, the following is true:
    $ 0=[u,v]=[v_2+k' z, v_1+k z]=[v_2,v_1] + k [v_2,z]+k' [z,v_1]+k k'[z,z] = w(v_2,v_1)z $
    This implies that $w(v_2,v_1)=0$ for every $v_2 in V$. However, with $w$ being a non-degenerate bilinear form, if $v_2!=0$, one must have some corresponding $v_2' in V$ such that $w(v_2,v_2')!=0$. Hence, this enforces $v_2=0$, so $u=k' z in RR z$. This shows that $frak(z) subset.eq RR z$.

    Also, notice that given any $k in RR$, any $v=v_1+k' z in frak(g)$ (where $v_1 in V$ and $k' in RR$) satisfies the following:
    $ [k z, v_1+k'z]=k[z,v_1]+k k'[z,z]=0 $
    Hence, we also have $k z in frak(z)$, or $RR z subset.eq frak(z)$. Therefore, $frak(z)=RR z$, this is the center of the Lie algebra $frak(g)$.

    Moreover, this also implies that every $t in RR$ satisfies $exp(t z) in Z(G)$ (since $frak(z)$ the center of $frak(g)$, is the tangent space of $Z(G)$).

    \ 

    #text(weight: "bold")[II. Expression of Group Commutator:]

    Recall that given any $v_1,v_2 in V$ and $t,s in RR$, we have $exp(t v_1)exp(s v_2)exp(-t v_1) = Ad(exp(t v_1)) dot exp(s v_2)$, and such expression is the same as $exp(Ad_(exp(t v_1)) (s v_2))$ (where $Ad_(exp(t v_1)) in GL(frak(g))$ denotes the differential of $Ad(exp(t v_1))$ at $1 in G$). However, remember that for $ad(t v_1) in End(frak(g))$, it satisfies $exp(ad(t v_1)):= sum_(n=0)^infinity (ad (t x))^n/n! = Ad_(exp(t v_1))$ as linear operator on $frak(g)$. So, we get the following:
    $ Ad_(exp(t v_1))(s v_2) &= sum_(n=0)^infinity 1/n! (ad(t v_1))^n dot (s v_2)\
     &= s v_2 + ad(t v_1)(s v_2)+sum_(n=2)^infinity 1/n! (ad(t v_1))^(n-2)((ad(t v_1))^2 dot (s v_2))\ 
     &= s v_2 + [t v_1,s v_2]+sum_(n=2)^infinity (ad(t v_1))^(n-2)dot [t v_1,[t v_1,s v_2]]\ 
     &= s y+t s dot w(v_1,v_2)z + sum_(n=2)^infinity (ad(t v_1))^(n-2)dot [t v_1,t s dot w(v_1,v_2)z]\ 
     &= s y+t s dot w(v_1,v_2)z $
    (Note: recall that $[v_1,z]=0$ for all $v_1 in V$).

    Hence, we get the formula $exp(t v_1)exp(s v_2)exp(-t v_1) = exp(Ad_(exp(t v_1))dot (s y)) = exp(s y+t s dot w(v_1,v_2)z)$. And, by the fact that $exp(k z)$ is central for all $k in RR$ (the claim in #text(weight: "bold")[I.]), we have $exp(t v_1)exp(s v_2)exp(-t v_1) = exp(s y+t s dot w(v_1,v_2)z) = exp(s y) exp(t s dot w(v_1,v_2)z)$. Hence, we end with the following:
    $ exp(t x)exp(s y)exp(-t x)exp(-s y)&=exp(s y)exp(t s dot w(v_1,v_2)z)exp(-s y)\ 
    &= exp(s y) exp(-s y)exp(t s dot w(v_1,v_2)z)\ 
    &=exp(t s dot w(v_1,v_2)z) $
    Take $t,s=1$, we recover what the lemma wants.
  ]

    \ 
  
    For the actual Lie Algebra and Lie Group of that, consider the Generalized Heisenberg Algebra: 

    For this, we do need to show that $k=dim(V) = 2n$ for some $n in NN$ first though. Since $w$ is a non-degenerate skew-symmetric bilinear form on $V$, then pick any nonzero $v_1 in V$, the linear functional $w(v_1,\_):V arrow.r RR$ is nontrivial (so $ker(w(v_1,\_))=k-1$), hence there exists nonzero $u_1 in V$, such that $w(v_1,u_1)!=0$ (in particular, can choose $u_1$ such that $w(v_1,u_1)=1$). Also, notice that because $w$ is skew-symmetric, then $u_2 in.not span{v_1}$ (if so, then the output should be $0$). So, the two are in fact linearly independent.

    Now, consider $V_1 = ker(w(v_1,\_)) sect ker(w(u_1,\_))$: If such set is $0$ then we're done (where $n=1$), but if not, then notice that since $V = span{v_1} plus.circle ker(w(u_1,\_)) = span{u_1} plus.circle ker(w(v_1,\_))$ (since $v_1 in.not ker(w(u_1,\_))$ and $u_1 in.not ker(w(v_1,\_))$, while the dimension works out), then based on the claim of direct sum (together with the fact that $v_1,u_1$ are linearly independent), every vector $v in V$ has $v=a v_1+b u_1 + v'$ for unique $a,b in RR$ and $v'$ in the intersection of the kernel. Hence, $V=span{v_1} plus.circle span{u_1} plus.circle V_1$, showing that $dim(V_1)=k-2$. 
    
    Then, notice that now $w$ restricts to another non-degenerate skew-symmetric bilinear form on $V_2$: For every nonzero $v in V_1$, if $u$ satisfies $w(v,u)!=0$, $u in.not span{v_1,u_1}$, since we have $w(v_1,v) = w(u_1,v)=0$. So, it implies $u = a v_1+b u_1 + v'$ for some $a,b in RR$ and $v' in V_1$, where $w(v, v') = w(v, a v_1+b u_1+v') = w(v, u)!=0$, hence one can find $v' in V_1$ such that $w(v,v')!=0$. Hence, since $dim(V_1)=k-2 < k$, apply induction on the claim, we get that $dim(V_1)$ is even, showing that $k=dim(V_1)+2$ is again even.

    \ 

    Now, consider the following subspace of $gl_(2n+2)(RR)$, defined as $frak(h)$:
    $ frak(h) := span{v_1,...,v_n, u_1,...,u_n} plus.circle RR z $ 
    $ " where " v_i = mat(0, ..., 1, ..., 0;dots.v,dots.down,dots.v, , dots.v;0,dots,0, dots, 0; dots.v, , dots.v, dots.down, dots.v; 0, dots, 0, dots, 0) "at the " (i+1)^"th" "column" $
    $ u_j = mat(0, ..., 0, ..., 0;dots.v,dots.down,dots.v, , dots.v;0,dots,0, dots, 1; dots.v, , dots.v, dots.down, dots.v; 0, dots, 0, dots, 0) "at the " (j+1)^"th" "row" $
    $ z = mat(0,...,1; dots.v, dots.down, dots.v; 0, dots, 0) $
    Denote $V:=span{v_1,...,v_n,u_1,...,u_n}$, and define a skew-symmetric bilinear form by the relations on the basis as $w(v_i,u_i)=1$ for all $i$, $w(v_i,u_j)=0$ if $i!=j$, and $w(v_i,v_j) = w(u_i,u_j)=0$ in general. 

    Then, notice that under matrix commutator, it satisfies the following:
    $ [v_i,v_j] = [u_i,u_j]=0, quad [v_i,u_i] =z = w(v_i,u_i)z, quad forall i,j in {1,...,n} $
    $ [v_i,u_j]=0, " if " i!=j $
    Which, $frak(h)$ under matrix commutator not only is a Lie algebra, but one that satisfies the condition that $[v,u] = w(v,u)z$ for all $v,u in V$ (since such relation is satisfied by the basis elements of $V$).

    Then, taken the matrix exponential of the Lie algebra, since each $v_i,u_j$ satisfies $v_i^2 = u_j^2 = z^2= 0$ as matrix, then we automatically get that $exp(t v_i) = id_(2n+2)+t v_i, exp(s u_j)=id_(2n+2)+s u_j$, and $exp(r z)=id_(2n+2)+r z$. Which, Notice that they generate all matrices of the following form:
    $ A = mat(1, t_1,..., t_n, r; 
              0, 1,dots, 0, s_1;
              dots.v,dots.v, dots.down, dots.v, dots.v;
              0,0, dots, 1, s_n;
              0,0, dots, 0, 1) $
    Which, this Lie group generated by exponentiation of $frak(h)$ (denoted as $H$), as a manifold is isomorphic to $RR^(2n+1)$, which is in fact simply-connected, so this is one of the desired Lie group.


  //This is different 
  /*

    \ 

  #text(weight: "bold")[II. $RR z=frak(z)$ is the Derived Subalgebra $[frak(g),frak(g)]$:]

    Given any $v,w in frak(g)$, since $v=v_1+k z$ and $w=v_2+k' z$ for some $v_1,v_2 in V$ and $k,k' in RR$, then one has the following:
    $ [v,w]=[v_1+k z,v_2+k' z]=[v_1,v_2]+k'[v_1,z]+k[z,v_2]+k k'[z,z] = w(v_1,v_2)z $
    Hence, the generators of $[frak(g),frak(g)]$ is contained in $RR z$, showing that $[frak(g),frak(g)] subset.eq RR z$.

    Also, since $w$ is a non-degenerate bilinear form, every $v_1 in V$ has a corresponding $v_2 in V$ such that $w(v_1,v_2)!=0$ (WLOG by scaling with some scalar, one can say there $w(v_1,v_2)=1$). Hence, $z=w(v_1,v_2)z=[v_1,v_2] in [frak(g),frak(g)]$, showing that $RR z subset.eq [frak(g),frak(g)]$. Therefore, $RR z=[frak(g),frak(g)]$, showing that the derived subalgebra of $frak(g)$ is also the center of $frak(g)$.

    \ 

  #text(weight: "bold")[III. Element of the form $g h g^(-1) h^(-1)$ forms a Manifold, with Tangent Space contained in $[frak(g),frak(g)]$:]

    For this, consider the map $G times G arrow.r G times G times G times G arrow.r G times G arrow.r G$ by $(g,h) mapsto (g,h,g^(-1),h^(-1)) mapsto (g h,g^(-1),h^(-1)) mapsto (g h g^(-1) h^(-1))$. This map can be realized as certain product maps of identity, inverse, and multiplication map on $G$, hence is not only smooth, but also with constant rank (since all such maps are with constant rank). So, its image is in fact an immersed submanifold. 

    Also, for suitable $g,h$ that's small enough to be in the domain of $log$ function (which can be written as $g=exp(t v), h=exp(s u)$ for some $t,s in RR$, $v,u in frak(g)$), then one has 

    \ 

  Finally, recall that $[frak(g),frak(g)]=RR z=frak(z) = T_1(Z(G))$ (where $Z(G)$ denotes the center of the Lie group $G$), hence for any $v_1,v_2 in V$, with suitable scaling so that $exp(v_1)exp(v_2)exp(-v_1)exp(-v_2) in [G,G]$ being in the domain of the $log$ map, we have the following for some $c in RR$:
  $ log(exp(v_1)exp(v_2)exp(-v_1)exp(-v_2))=c z in [frak(g),frak(g)] = frak(z) $
  Hence, $exp(v_1)exp(v_2)exp(-v_1)exp(-v_2) = exp(c z)$. To claim that $c=w(v_1,v_2)$, we'll consider a more general statement: Given any $t,t',s,s' in RR$, since now we've derived the fact that $exp((t+t')v_1)exp(s v_2)exp(-(t+t')v_1)exp(-s v_2) = exp(c' z) in Z(G)$ for suitable choice of $t,t',s,s'$. Which, notice that it satisfies the following:
  $ &exp((t+t')v_1)exp(s v_2)exp(-(t+t')v_1)exp(-s v_2)\
  &= exp(t v_1) exp(t' v_1)exp(s v_2)exp(-t' v_1) exp(-t v_1)exp(-s v_2)\
  &= exp(t v_1)(exp(t'v_1)exp(s v_2)exp(-t'v_1)exp(-s v_2))exp(s v_2)exp(-t v_1)exp(-s v_2)\ 
  &= exp(t v_1)exp(c''z)exp(s v_2)exp(-t v_1)exp(-s v_2)\ 
  &= exp(c'' z)exp(t v_1)exp(s v_2)exp(-t v_1)exp(-s v_2)\ 
  &= (exp(t' v_1)exp(s v_2)exp(-t' v_1)exp(-s v_2))(exp(t v_1)exp(s v_2)exp(-t v_1)exp(-s v_2)) $
  Which, above is given by $exp(c''z)=exp(t' v_1)exp(s v_2)exp(-t' v_1)exp(-s v_2) in Z(G)$ (since $z in frak(z)=T_1(Z(G))$), which commutes with everything. So, we conclude that the map $phi:RR arrow.r G$ by $phi(t) = exp(t v_1)exp(s v_2)exp(-t v_1)exp(-s v_2)$ is in fact a Lie group homomorphism as intended. Applying similar logic to the map $psi:RR arrow.r G$ by $psi(s)=exp(t v_1)exp(s v_2)exp(-t v_1)exp(-s v_2)$, this is also a Lie group homomorphism.

  Which, let $c:RR^2 arrow.r RR$ be a function that satisfies $exp(t v_1)exp(s v_2)exp(-t v_1)exp(-s v_2)=exp(c(t,s)z)$. Based on the claim that fixing either $t$ or $s$ makes the other component becoming a Lie group homomorphism implies that $c$ is bilinear (for instance, $exp(c(t+t',s)z) = exp(c(t,s)z)exp(c(t',s)z) = exp((c(t,s)+c(t',s))z)$ based on the fact that fixing $s$, this function is a Lie group homomorphism in $t$; $exp(c(k t,s)z)=exp(k c(t,s)z)$ follows by smoothness and the property of group homomorphism over $RR$). Which, if consider $c(1,1)$, we get the following using the limit definition of Lie bracket:
  $ [v_1,v_2]=&lim_(t,s arrow.r 0)log(exp(t v_1)exp(s v_2)exp(-t v_1)exp(-s v_2))/(t s) = lim_(t,s arrow.r 0)log(exp(c(t,s)z))/(t s)\
  &= lim_(t,s arrow.r 0)(t s c(1,1)z)/(t s)=c(1,1)z $
  Which, with $[v_1,v_2]=w(v_1,v_2)z$, we must have $c(1,1)=w(v_1,v_2)$. Hence, the following is true:
  $ exp(v_1)exp(v_2)exp(-v_1)exp(-v_2) = exp(c(1,1)z)=exp(w(v_1,v_2)z) $
  And, this proves the desired statement.
  
  \ 

  \ 

  #text(weight: "bold")[Special Case in Part (1):]
  */



  \ 

  1. Given $3$-dimensional real Lie algebra $frak(g)$ with basis $x,y,z$, consider $V=span{x,y}$, then $frak(g) = V plus.circle RR z$. On $V$, one can define a bilinear form $w:V times V arrow.r V$ by $w(x,x)=w(y,y)=0$, $w(x,y)=-w(y,x)=1$. Then, $w$ is in fact a non-degenerate skew-symmetric bilinear form on $V$ (since given any nonzero $a x+b y in V$, if $a!=0$, then $w(a x+b y, y)=a w(x,y)=a!=0$; similar for $b!=0$, then choose $x$ as a counterpart instead). 

    Also, given any $a x+b y, c x+d y in V$, one has $w(a x+b y,c x+d y)=(a d-b c)w(x,y) = (a d-b c)$ Hence, we have the following on its Lie algebra structure:
    $ [a x+b y,c x+d y]=(a c-b d)[x,y] = w(a x+b y,c x+d y)z $ 
    $ [a x+b y,z]=0 $
    Hence, the Heisenberg Algebra satisfies the given condition in part (2), which its Lie group $G$ automatically satisfies the condition $exp(t x)exp(s y)exp(-t x)exp(-s y)=exp(t s z)$ (with $x,y in V$), hence $exp(t x)exp(s y)=exp(t s z)exp(s y)exp(t x)$, which is the desired statement.

    \ 
  
    Now, for a concrete group for 3-dimensional Heisenberg Algebra, consider the group $H subset.eq GL_3(RR)$ collecting all matrices of the following:
    $ H={mat(1,a,b;0,1,c;0,0,1) in GL_3(RR)eval(#300%)a,b,c in RR} $
    Notice that as $RR$-manifold, $H tilde.equiv RR^3$ due to the freedom of $3$ entries, and for any $a,b,c in RR$ such matrix is always invertible because of the diagonals all being $1$, and its uppertriangular. So, $H$ is simply-connected. Also, taking the geometric tangent vector by taking differentiation, if fixing only one entry of $a,b,c$, one deduces that the corresponding Lie algebra $frak(h)$ is spanned by ${x:=mat(0,1,0;0,0,0;0,0,0),y:=mat(0,0,0;0,0,1;0,0,0), z:=mat(0,0,1;0,0,0;0,0,0)}$. Which, their matrix commutation is as follow:
    $ [x,y]=mat(0,1,0;0,0,0;0,0,0)mat(0,0,0;0,0,1;0,0,0)-mat(0,0,0;0,0,1;0,0,0)mat(0,1,0;0,0,0;0,0,0)=mat(0,0,1;0,0,0;0,0,0)=z $
    $ [x,z]=mat(0,1,0;0,0,0;0,0,0)mat(0,0,1;0,0,0;0,0,0)-mat(0,0,1;0,0,0;0,0,0)mat(0,1,0;0,0,0;0,0,0)=0 $
    $ [y,z]= mat(0,0,0;0,0,1;0,0,0)mat(0,0,1;0,0,0;0,0,0)-mat(0,0,1;0,0,0;0,0,0)mat(0,0,0;0,0,1;0,0,0)=0 $
    Hence, Lie group $H$ and its Lie algebra $frak(h)$ does satisfy the given condition in Part (1).
]

\ 

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

= D//3
#problem[
  Etingof Problem Set 3.19:

  Let $G$ be a complex connected Lie group.
  + Show that $g mapsto Ad g$ is an analytic map $G arrow.r gl(frak(g))$.
  + Assume that $G$ is compact, show that then $Ad g=1$ for any $g in G$.
  + Show that any connected compact complex group must be commutative.
  + Show that if $G$ is a connected complex compact group, then the exponential map gives an isomorphism of Lie groups $frak(g)\/L tilde.equiv G$ for some Lattice $L subset frak(g)$ (i.e. a free abelian group of rank equal to $2 dim(frak(g))$).
][
  + In general, it is true that $Ad:G arrow.r GL(frak(g)) subset gl(frak(g))$ is a Lie group homomorphism (as real Lie group, verifiedin the previous HW). Which, the reason why given $G$ as a complex connected Lie group, such map is complex analytic, is because taking the differential $Ad g$ when expressing the tangent space (togehter with some neighborhood of $1 in G$) it turns into a complex analytic map, and varying $g$ (which is also described by analytic map) has every entry of the differential also varies analytically, hence $Ad$ is in fact an analytic map.

    \ 

  + Given that $G$ is compact (also connected complex Lie group by initial assumption), then the analytic map $Ad:G arrow.r gl(frak(g))$ must either be surjective or constant (by the maximum principle of complex manifold). However, since $gl(frak(g)) tilde.equiv M_n (CC)$ as manifold/vector space (given that $dim_CC (frak(g))=n$), $gl(frak(g))$ is not bounded with the natural euclidean norm, which is not compact. Then, $Ad:G arrow.r gl(frak(g))$ must not be surjective (if it's surjective, since $Ad(G) = gl(frak(g))$, then $Ad(G)$ is not compact; however $Ad$ as a continuous map must send compact sets to compact sets, so $Ad(G)$ is also compact. This is a contradiction). Hence, $Ad$ must be constant.

    Finally, since $id_frak(g) in im(G)$ (since $1 in G$ satisfies $Ad(1)=id_G$, so its differential $Ad 1_* = id_frak(g)$), then with $Ad$ being constant, then one must have $Ad g = id_frak(g)$ for all $g in G$. Denote $1:=id_frak(g) in gl(frak(g))$, one yields $Ad g=1$ for all $g in G$.

    \ 

  + Based on part (2), every $g in G$ satisfies $Ad g=1 in gl(frak(g))$. However, recall that every Lie group homomorphism $phi:G arrow.r K$ is uniquely determined by $phi_*: frak(g) arrow.r frak(k)$ (where the mathfrak of the lowercase symbol represents the lie algebra of the corresponding Lie group). Then, with every $g in G$ (and the corresponding adjoint map $Ad g:G arrow.r G$) satisfies $Ad g_* = 1 in gl(frak(g))$, while $id_G$ also satisfies $(id_G)_* = 1 in gl(frak(g))$, by uniqueness of the Lie group homomorphism, $Ad g_* = (id_G)_*$ implies $Ad g=id_G$. Hence, $Ad g(h) = g h g^(-1) = h$ for all $g,h in G$, showing that $g h=h g$ for all $g,h in G$, or $G$ is commutative.

    \ 

  + Given that $G$ is a connected complex compact Lie group, then by part (3) we know $G$ is commutative. Hence, given any $x,y in frak(g)$ (its Lie algebra), one has $exp(x+y)=exp(x)exp(y)$ based on commutativity. Hence, $exp:frak(g) arrow.r G$ is in fact a group homomorphism.

    Then, recall that there exists open neighborhood $U subset.eq frak(g)$ (where $0 in U$) and $tilde(U) subset.eq G$ (where $1 in tilde(U)$), such that $exp:U arrow.r.tilde tilde(U)$ is a diffeomorphism, while open neighborhood of $1 in G$ generates $G$ based on the connectedness of $G$. Hence, every $g in G$ can be expressed as products of finite $g_1,...,g_n in tilde(U)$, where each $g_i in tilde(U)$ can be expressed as $exp(x_i)$ for some $x_i in U$. Hence, we get that $g = product_(i=1)^n g_i = product_(i=1)^n exp(x_i) = exp(sum_(i=1)^n x_i) in im(exp)$, which shows that $exp$ is surjective.

    Hence, by First Isomorphism Theorem of groups, one must have $frak(g)\/ker(exp) tilde.equiv G$. Let $L:=ker(exp)$, we' first claim that $L$ is discrete. However, this simply follows from the fact that $exp$ is a local diffeomorphism near $0 in frak(g)$, which there is a neighborhood $U subset.eq frak(g)$ where $exp$ is diffeomorphism. Hence, within this neighborhood it intersects $L$ only at $0$. Now, for any $v in L$, $v+U$ is a suitable open neighborhood of $v+U$ where $exp$ is again a diffeomorphism (translation of the original thing, and the fact that $exp$ is a group homomorphism), hence only intersecting $L$ at $v$. So, $L$ is discrete, hence $frak(g)\/L$ in fact has a complex manifold structure, that is diffeomorphic to $G$.

    \ 

    Now, we claim that $L$ is in fact a lattice. First, it's a free abelian group, since for all $v in L$, any $n in ZZ$ satisfies $n dot v in L$ by the property of kernel, and the fact that it's a subgroup inside of a vector space (which is again a free abelian group).

    Then, to say that $L$ has rank $>= 2 dim(frak(g))$, we'll prove by contradiction: Suppose $L$ has rank $k < 2 dim(frak(g))$, then notice that when viewing $frak(g)$ as $RR^(2 dim(frak(g)))$ (where $dim(frak(g))$ is the complex dimension), the list of basis $v_1,...,v_k$ of $L$ as a free $ZZ$-module is not spanning $frak(g)$ as $RR$-vector space (because the list has length $<$ real dimension of $frak(g)$). Hence, there exists $w in frak(g)$ such that $w in.not span{v_1,...,v_k}$, and $L subset span{v_1,...,v_k}$ by definition. So, since exponential map quotients any line $RR v_1$ into $S^1$ (since there are discrete and evenly-spaced point on $RR v_1$ that gets send to the same point by the property that $v_1 in L$, so $ZZ v_1$ are all send to the point), then in particular as a manifold $exp(frak(g)) tilde.equiv RR^(2dim(frak(g))-k) times (S^1)^k$ (since each basis element $v_i in L$ has the line $RR v_i$ quotients to $S^1$ without affecting the structure of the other elements). Yet, in this case $exp(frak(g)) = G$ is not compact (using the fact that $exp$ is surjective in this case), which violates our assumption that $G$ is compact. So, rank of $L$ being $k<2 dim(frak(g))$ reaches a contradiction.

    \ 

    Finally, to say that rank of $L$ has $k<=2 dim(frak(g))$, suppose the contrary again that $k>2 dim(frak(g))$. Then, one can choose a basis $v_1,...,v_(k-1),w$ for $L$, which they're $ZZ$-linearly independent, and product a discrete set in $frak(g)$. However, since this list has length $k>2 dim(frak(g))$ (real dimension of $frak(g)$), then it is $RR$-linearly dependent, hence there exists some index $1<=i<=k$ and some real numbers $a_1,...,a_i$ (not all $0$), such that $a_1 v_1+...+a_i v_i=w$.

    Notice that if $a_1,...,a_i$ are all rational numbers, then $v_1,...,v_i,w$ are $ZZ$-linearly dependent (since let $q = lcm$ of the denominators of $a_1,...,a_i$, then one has $q(a_1 v_1+...+a_i v_i)=q w$, while every coefficient $q a_j in ZZ$ and $q in ZZ$ and not all of them are $0$), which contradicts the assumption that they're $ZZ$-linearly independent. Hence, at least one of them needs to be irrational. 

    Which, since by scaling with suitable rational numbers (i.e. $lcm$ of denominators of all ratioanl coefficients), can assume $a_1,...,a_i$ only contains integers and irrational numbers (also, up to shifting by integer multiples of $v_1,...,v_i$ one can say all integer coefficients are $0$). Now, for any $a_j$ that is irrational, notice that by taking the cost $a_j+ZZ$ and take the quatient of $RR\/ZZ tilde.equiv S^1$, $a_j + ZZ$ has a dense image in $S^1$. Hence, if viewing $S^1$ as $[0,1)$ under addition quotient by $ZZ$, every $epsilon >0$ has one $n in ZZ$, such that $k=(n+a_j mod ZZ) in [0,1)$ satisfies $|k-0|<epsilon$. Which, there exists $n' in ZZ$ such that $|n'+a_j - 0| < epsilon$ in $RR$ (by moving $n+a_j$ into the interval $[0,1)$ through adding some integers).
    Now, for every $epsilon >0$, since $||v_j||>0$, then $epsilon/(k)||v_j||)>0$, hence by the statement above there exists $n_j in ZZ$, such that $||n_j v_j+a_j v_j - 0|| = |n_j+a_j - 0| dot ||v_j|| < ||v_j|| dot epsilon/(k dot ||v_j||) = epsilon/(k)$.

    Then, given $a_(i_1)v_(i_1)+...+a_(i_l)v_(i_l)=w$ has all coefficients being irrational, then the following is satisfied:
    $ lr(||, size: #300%)sum_(j=1)^l (n_(i_j)+a_(i_j)) v_(i_j) lr(||, size: #300%) <= sum_(j=1)^l |n_(i_j)+a_(i_j)| dot ||v_(i_j)|| < sum_(j=1)^l epsilon/(k) < epsilon $
    (Note: this is because $l<k$ by the fact that $v_(i_1),...,v_(i_l)$ is a sublist of $v_1,...,v_k$).

    Notice that this shows that for every $epsilon >0$, there exists such expression $sum_(j=1)^l (n_(i_j)+a_(i_j))v_(i_j) in L$ (since initially $sum a_i v_i in L$, hence integer combination of $v_i$ added to this vector is still in $L$), such that it is distance $<epsilon$ away from $0$, while not $0$ (since $w = sum a_(i_j) v_(i_j)$ is $ZZ$-linearly independent from $v_(i_1),...,v_(i_j)$). Hence, this shows that one can get arbitrarily close things to $0 in L$ using elements in $L$, then $L$ cannot be discrete, but this is agani a contradiction.

    So, $L$ has rank $<= 2 dim(frak(g))$, together with the previous fact that its rank $>= 2 dim(frak(g))$, we must have $L$ being rank $2 dim(frak(g))$, which $L$ is a lattice, and this finishes the proof.
]