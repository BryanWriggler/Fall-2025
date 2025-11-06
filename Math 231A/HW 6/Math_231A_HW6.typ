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
  title: "Math 231A HW 6",
  authors: ("Zih-Yu Hsieh",),
  date: datetime.today().display("[month repr:long] [day], [year]"),
)
#set enum(numbering:"(1)")
= D//1
#problem[
  Leg $frak(g)$ be a Lie algebra, and $(\_,\_):frak(g) times frak(g) arrow.r frak(g)$ a symmetric ad-invariant bilinear form on $frak(g)$ (i.e. for any $a,x,y in frak(g)$, we have $(x,y)=(y,x)$ and $([a,x],y)+(x,[a,y])=0$, which is the same as $([a,x],y)=-(x,[a,y])$). Show that the element $w in (frak(g)^*)^(times.circle 3)$ given by 
  $ w(x,y,z)=([x,y],z) $
  is skew-symmetric and ad-invariatnt.
][

  #text(weight: "bold")[I. Skew-Symmetric:]

  It suffices to verify that if two entries are the same, then it evaluates to be $0$. Given any $x,y in frak(g)$, it satisfies the following three relations:
  $ w(x,x,y) = ([x,x],y) = (0,y)=0 $
  $ w(x,y,x)=([x,y],x)=-(y,[x,x])=0 $
  $ w(y,x,x) = ([y,x],x)=(-[x,y],x)=-(y,[x,x])=-(y,0)=0 $
  This shows that $w$ is skew-symmetric.

  #text(weight: "bold")[II. Ad-invariance:]

  The goal is to prove that for any $a,x,y,z in frak(g)$, the following relation holds:
  $ w([a,x],y,z)+w(x,[a,y],z)+w(x,y,[a,z])=0 $
  Which, based on the given relation between $w$ and $(\_,\_)$, together with Jacobi's Identity, we get:
  $ [[a,x],y]=-[[x,y],a]-[[y,a],x] $
  $ w([a,x],y,z)&=([[a,x],y],z) = -([[x,y],a],z)-([[y,a],x],z)\ 
  &= ([a,[x,y]],z) +([[a,y],x],z) = -([x,y],[a,z]) + w([a,y],x,z)\ 
  &= -w(x,y,[a,z]) - w(x,[a,y],z) $
  Hence, we get that $w([a,x],y,z)+w(x,[a,y],z)+w(x,y,[a,z])=0$.
]

\ 

= D//2
#problem[
  Let $C$ be the standard cube in $RR^3:$ $C:={|x_i|<=1}$, and let $S$ be the set of faces of $C$ (thus, $S$ consists of $6$ elements). Consider the $6$-dimensional complex vector $V$ space of functions on $S$, and define $A:V arrow.r V$ by 
  $ (A f)(sigma)=1/4 sum_(sigma')f(sigma') $
  where the sum is taken over all faces $sigma'$ which are neighbors of $sigma$ (i.e. have a common edge with $sigma$). The goal of this problem is to diagonalize $A$.
  + Let $G={g in O(3,RR) | g(C)=C}$ be the group of symmetries of $C$. Show that $A$ commutes with the natural action of $G$ on $V$.
  + Let $z=-I in G$. Show that as a representation of $G$, $V$ can be decomposed in the direct sum 
    $ V=V_+ plus.circle V_-, quad V_plus.minus = {f in V | z f=pm f} $
  + Show that as a representation of $G$, $V_+$ can be decomposed in the direct sum 
    $ V_+ = V^0_+ plus.circle V^1_+, quad V^0_+:={f in V_+ | sum_(sigma)f(sigma)=0}, quad V^1_+ = CC dot 1 $
    where $1$ denotes the constant function on $S$ whose value at every $sigma in S$ is $1$.
  + Find the eigenvalues of $A$ on $V_-,V^0_+, V^1_+$.

  [Note: in fact, each of $V_-, V^0_+, V^1_+$ is an irreducible representation of $G$, but you do not need this fact].
][

  + Since $G$ preserves the whole cube $C$ by "rotating" and/or "reflecting" the cube in ways that send faces to faces, in particular it sends adjacent faces to adjacent faces. Hence, for any face $sigma in S$, if $sigma' in S$ is one of its adjacent faces, for any $g in G$ one still has $g dot sigma$ and $g dot sigma'$ being adjacent faces (and this is an if and only if relation, because $g$ is invertible). 

    Hence, one can define an action $G arrow.cw.half V$ as follow:
    $ forall f in V, quad forall g in G, quad forall sigma in S, quad quad (g dot f)(sigma) := f(g dot sigma) $

    Now, notice that for all $f in V$ and any $g in G$, given any $sigma in S$, we have the following:
    $ g dot f(sigma) = f(g dot sigma), quad A(g dot f)(sigma) = sum_(sigma')(g dot f)(sigma') = sum_(sigma')f(g dot sigma') $
    Which, notice that the collection $sigma'$ are the adjacent faces of $sigma$, hence $g dot sigma'$ are the adjacent faces of $g dot sigma$. Therefore, we also have the following relation:
    $ (g dot A f)(sigma) = (A f)(g dot sigma) = sum_(g dot sigma')f(g dot sigma') = A(g dot f)(sigma) $
    Since $sigma in S$ is arbitrary, this proves that $A(g dot f) = g dot (A f)$ as functions, hence as a linear operator on $V$, $A$ is commuting with the action of $G$ on $V$.

    \ 

  + Given $z=-I in G$, for any face $sigma in S$, let $-sigma in S$ denotes the face of $C$ on the opposite side of $sigma$. Then, notice that $-sigma = z(sigma)$ (since $-sigma$ precisely contains all negative vectors of $sigma$). Hence, if consider any funciton $f in V_pm$, since it satisfies $z dot f = pm f$, then we must have:
    $ pm f(sigma) = (z dot f)(sigma) = f(z dot sigma) = f(-sigma) $
    Hence, for $V_+$, we have $f(-sigma) = f(sigma)$ (indicating opposite faces have the same value), while for $V_-$, we have $f(-sigma)=-f(sigma)$ (indicating opposite faces have neative values).

    As a result, because for the $G$ action on $S$, any $g in G$ and $sigma in S$ has $-(g dot sigma) = g dot (-sigma)$ (i.e. the $G$-action on $S$ preserves opposite faces), then given any $f in V_pm$, we have the following for all $sigma in S$:
    $ (z dot (g dot f))(sigma) = (g dot f)(-sigma) = f(g dot (-sigma)) = f(-(g dot sigma)) = pm f(g dot sigma) = pm(g dot f)(sigma) $
    where the second last equality is coming from the fact that $pm f(sigma')=(z dot f)(sigma') = f(- sigma')$ (where $pm$ depends on $V_pm$). So, since the above indicates that $z dot (g dot f) = pm (g dot f)$ for all $g in G$ and $f in V_pm$, showing that $g dot f in V_pm$ also, hence $V_pm$ each form a subrepresentation of $G$.

    To prove that $V_pm$ sums to $V$, first for any function $f in V$, consider the pair $(f+z dot f)/2$ and $(f-z dot f)/2$, they satisfy the following:
    $ z dot ((f+z dot f)/2) = (z dot f+z^2 dot f)/2 = (z dot f+f)/2 = (f+z dot f)/2 $
    $ z dot ((f-z dot f)/2) = (z dot f - z^2 dot f)/2 = (z dot f-f)/2 = -(f-z dot f)/2 $
    This indicates that $(f+z dot f)/2 in V_+$, while $(f-z dot f)/2 in V_-$, and $(f+z dot f)/2 + (f-z dot f)/2 = f in V$. Hence, this implies $V = V_+ + V_-$ as vector spaces.

    Finally, the reason why it's a direct sum, is because for any $f in V_+ sect V_-$, we must have $z dot f = f$ and $z dot f = -f$ simultaneously, so $f = -f$, or $f=0$. Hence, with intersection being trivial, $V_+ plus.circle V_- = V$.

    \ 

  + First to prove that $V_+=V^0_++V^1_+$, recall that $V_+$ is the space of function where every two opposite faces yield the same value for every funciton in $V_+$. Hence, there are total of $3$ faces (or $3$ directions) that may consist of different function values (WLOG, say in $RR^3$ these three faces are normal to $e_1,e_2,e_3$ three vectors). Then, consider the permutation matrices $g=mat(0,1,0;0,0,1;1,0,0), g^2=mat(0,0,1;1,0,0;0,1,0) in G$ (which they preserve the cube, since it's only swapping the $3$ standard basis vectors). Then, since for any function $f in V_+$, one has $(f+g dot f+g^2 dot f)/3$ that yields the same value for every face (for definiteness, say pick face at direction $e_1$, then $g dot f(e_1) = f(g dot e_1)=f(e_3)$, and $g^2 dot f(e_1) = f(g^2 dot e_1)=f(e_2)$, so $(f+g dot f+g^2 dot f)/3 (e_1) = (f(e_1)+f(e_2)+f(e_3))/3$; with $f in V_+$, then the same statement is true for $pm e_1$, and is true also for $pm e_2, pm e_3$). Hence, $(f + g dot f+g^2 dot f)/3 in V^1_+= CC dot 1$.

    Also, notice that the sum $sum_(sigma)f(sigma) = 2(f(e_1)+f(e_2)+f(e_3))$ (since the other three faces ar the opposite of these three, which satisfies $f(-e_i)=f(e_i)$, since $f in V_+$), while $sum_(sigma)(f+g dot f+g^2 dot f)/3 (sigma) = 6 dot (f(e_1)+f(e_2)+f(e_3))/3 = 2(f(e_1)+f(e_2)+f(e_3))$. Hence, if consider the function $h = f - (f+g dot f+g^2 dot f)/3$, it satisfies $sum_(sigma)h(sigma) = 0$, hence $h in V^0_+$. And, notice that $h + (f+g dot f+g^2 dot f)/3 = f$, which also shows that $V_+ = V^0_++V^1_+$.

    \ 

    Then, to show it's a direct sum, it's because for any $f in V^0_+ sect V^1_+$, we have $f = k dot 1$ for some $k in CC$; also, we have $sum_(sigma)f(sigma) = sum_(sigma)k = 6k = 0$ based on the property of $V^0_+$, hence we must have $k=0$, showing $f = 0$. So, $V^0_+ plus.circle V^1_+ = V_+$.

    Finally, the two are subrepresentations, simply just because the $G$-action on $C$ sends faces to faces, so for any $f in V^0_+$, since $sum_(sigma)f(sigma)=0$, then for any $g in G$, $sum_(sigma)(g dot f)(sigma) = sum_(sigma)f(g dot sigma)=0$ (since $g$ just permutes $S$), showing that $g dot f in V^0_+$; also, for any $h in V^1_+$ (where $h = k dot 1$ for some $k in CC$), then $g dot h(sigma) = h(g dot sigma) = k$ for any $sigma in S$, showing $g dot h in V^1_+$. Hence, $V^0_+, V^1_+$ are both invariant under $G$, which are subrepresentations of $G$.

    \

  + First, for any $f in V_-$, since it satisfies $f(-sigma) = -f(sigma)$ for all face $sigma in S$, then it satisfies $(A f) (sigma) = sum_(sigma')f(sigma') = 0$ (since let $sigma_1,sigma_2$ be two adjacent sides of faces that're not opposite face of each other, the other two adjacent sides are given by $-sigma_1,-sigma_2$; so, the sum becomes $f(sigma_1)+f(sigma_2)+f(-sigma_1)+f(-sigma_2)=0$ based on the fact that $f(-sigma)=-f(sigma)$). Hence, this shows that $A f=0$ (given $f in V_-$), so $A$ has eigenvalue $0$ on $V_-$ (and whole $V_-$ is contained in the eigenspace of $0$).

    \ 

    Then, for any $f in V^0_+ subset.eq V_+$, since every face $sigma in S$ satisfies $f(-sigma) = f(sigma)$ (the property of $V_+$), and also $sum_(sigma)f(sigma) = 0$, then since the adjacent faces of $sigma$ precisely excluded $sigma$ and $-sigma$, then if the collection of $sigma'$ runs through the adjacent faces of $sigma$, it satisfies $sum_(sigma')f(sigma') + f(sigma) + f(-sigma) = sum_(sigma'' in S)f(sigma'') = 0$, hence $sum_(sigma')f(sigma') = -f(sigma)-f(-sigma) = -2 f(sigma)$. So, we have that $(A f)(sigma) = 1/4sum_(sigma')f(sigma') = -1/2 f(sigma)$, showing that $A f = -1/2 f$ (given $f in V^0_+$), so $A$ has eigenvalue $-1/2$ on $V^0_+$ (also, all $V^0_+$ is contained in the eigenspace of $-1/2$).

    \ 

    Finally, for any $f in V^1_+$, since $f = k dot 1$ for some $k in CC$, then for all $sigma in S$, it satisfies $f(sigma) = k$. Hence $(A f)(sigma) = 1/4 sum_(sigma')f(sigma') = 1/4 dot 4k = k = f(sigma)$, showing that $A f = f$ (given $f in V^1_+$). Hence, $A$ has eigenvalue $1$ on $V^1_+$ (again, all $V^1_+$ is contained in the eigenspace of $1$).
]

\ 

\ 

= D//3
#problem[
  Show that if $V$ is finite-dimensional representation of $sl(2,CC)$, then $V tilde.equiv plus.circle.big n_k V_k$ (or $plus.circle.big V_k^(n_k)$), and $n_k = dim V[k] - dim V[k+2]$ (where $V[k]$ representes the eigenspace of $k$ as an eigenvalue of $h in sl(2,CC)$). Show also that $sum n_(2k) = dim V[0]$, $sum n_(2k+1) = dim V[1]$.
][
  Since $V$ is a finite-dimensional $sl(2,CC)$-Representation, then it's completely reducible, and each irreducible component must be isomorphic to some $V_k$. Hence, $V tilde.equiv plus.circle.big V_k^(n_k)$ for finitely many nonnegative integer $k$ (where $n_k$ represents the number of copies of $V_k$, so only for finite $k$ we have $n_k >0$).

  \ 

  Now, fix a specific nonnegative integer $k$. For any $l in ZZ$, the Representation $V_(k+l)$ has basis elements $x^p y^q$, where $p+q = k+l$, and it satisfies $h dot (x^p y^q) = (p-q)x^p y^q$. Hence, each unique pair $(p,q)$ corresponds to a unique eigenvalue of $h$ on $V_(k+l)$, and since this list is a basis of $V_(k+2l)$, it implies that $h$ has $(k+l)+1 = dim(V_(k+l))$ distinct eigevalues on $V_(k+l)$, hence each eigenvalue corresponds to a $1$-dimensional eigenspace. So, if $k$ is an eigenvalue of $h$ on $V_(k+l)$, it has at most $1$-dimensional eigenspace.

  Also, if $k$ is an eigenvalue of $h$ on $V_(k+l)$, it must be one of th eigenvalues of the form $(p-q)$, where $p+q=k+l$. Hence, for some $p,q$ satisfying $p+q=k+l$, one has $k=p-q$, showing that $p+q=k+l = p-q+l$, so $l = 2q$ (where $q$ is a nonnegative integer). Hence, every $V_(k+l)$ which has $k$ as an eigenvalue of $h$ must be in the form $V_(k+2q)$ for some nonnegative integer $q$. Moreover, this is an if and only if, since conversely for any nonnegative integer $q$, the polynomial $x^(k+q)y^q in V_(k+2q)$ satisfies $h dot (x^(k+q)x^q) = ((k+q)-q)x^(k+q)y^q = k dot x^(k+q)y^q$, showing $h$ as an operator on $V_(k+2q)$ has eigenvalue $k$).

  \ 

  Hence, we concluded that $k$ is an eigenvalue of $V_(k+l)$ iff $l=2q$ for some nonnegative integer $q$, and it corresopnds to a $1$-dimensional eigenspace in $V_(k+l)$. Hence, given that $V tilde.equiv plus.circle.big V_(k')^(n_(k'))$ (where for finite amount of $k'$ we have $n_(k')>0$), for each fixed $k$, the only $k' in NN$ that has $V_(k')$ contains a nontrivial eigenvector corresponding to eigenvalue $k$, are $k' = k+2q$ for $q in NN$.

  Also, for every $v in V[k]$, since it can be uniquely expressed as finite sums of vectors in each $V_(k')$ (based on the direct sum argument), while each $V_(k')$ is invariant under $h$, then if $v = v_(k'_1)+...+v_(k'_m)$ (where each nonzero $v_(k'_i) in V_(k'_i)$), we have $k v_(k'_1)+...+k v_(k'_m)=k v=h dot v = h dot v_(k'_1)+...+h dot v_(k'_m)$, and each $k v_(k'_i), h dot v_(k'_i) in V_(k'_i)$. Hence, by uniqueness $h dot v_(k'_i) = k v_(k'_i)$, showing each $V_(k'_i)$ contains some eigenvector corresponding to eigenvalue $k$, hence $k'_i = k+2q_i$ for some $q_i in NN$.

  This shows that $V[k]$ is in fact a direct sum of eigenspace of $k$ in each $V_(k+2q)$, denote as $E_(k+2q)(k) subset V_(k+2q)$. Since each $E_(k+2q)(k)$ is $1$-dimensional, then $dim V[k] = sum_(q>=0)n_(k+2q)$ (since each $q>=0$ has $V_(k+2q)$ containing a copy of $E_(k+2q)(k)$, while there are $n_(k+2q)$ copies of $V_(k+2q)$ in $V$). As a result, we have the following for $n_k$:
  $ n_k = sum_(q>=0)n_(k+2q) - sum_(q>=1)n_(k+2q) = dim V[k] - sum_(q>=0)n_((k+2)+2q) = dim V[k]-dim V[k+2] $

  \ 

  Finally, with the formula derived above about $n_k$, using Telescoping series, we have the following:
  $ sum_(k=0)^l n_(2k) = sum_(k=0)^l (dim V[2k]-dim V[2k+2]) = dim V[0]-dim V[2l+2] $
  $ sum_(k=0)^l n_(2k+1) = sum_(k=0)^l (dim V[2k+1] - dim V[2k+3]) = dim V[1]-dim V[2l+3] $
  Since $V tilde.equiv plus.circle.big V_(k')^(n_k')$ is finite-dimensional, then there exists some $m in NN$, such that $k'>=m$ implies $n_(k')=0$. Then, since $k'$ can only be an eigenvalue of $h$ in $V$ iff there is a nontrivial copy of $V_(k'+2q)$ for some $q in NN$, then with $k'>=m$, $k'$ is not an eigenvalue of $h$ over $V$ (since there's no nontrivial copy of $V_(k'+2q)$ for any $q in NN$). 
  
  Hence, for any $l>=m$, we have $sum_(k=0)^l n_(2k) = dim V[0]-dim V[2l+2] = dim V[0]$, and $sum_(k=0)^l n_(2k+1) = dim V[1]-dim V[2l+3] = dim V[1]$ (since $2l+2,2l+3>=m$). So, there's no ambiguity to conclude that $sum n_(2k)=dim V[0]$, and $sum n_(2k+1) = dim V[1]$.
]

#pagebreak()

= D//4
#problem[
  Show that the symmetric power representation $S^k CC^2$ is isomorphic to the irreducible representation $V_k$ with the highest weight $k$.
][
  First, fix basis $x,y in CC^2$. Since $sl(2,CC) subset gl(2,CC) = End(CC^2)$, there is a natural $sl(2,CC)$-action on $CC^2$, by simply viewing it as a subspace of the linear operators on $CC^2$. 

  \ 

  #text(weight: "bold")[I. Map of Tensor Representation:]

  Before starting, we want to understand the action of $sl(2,CC)$ on $(CC^2)^(times.circle n)$ first (and we'll do so by applying induction): Recall that given $rho_V:frak(g) arrow.r gl(V)$ and $rho_W:frak(g) arrow.r gl(W)$ two Lie Algebra Representation, the Tensor Representation $rho_(V times.circle W):frak(g) arrow.r gl(V times.circle W)$ is defined by $rho_(V times.circle W)(x) = rho_V (x) times.circle 1_W + 1_V times.circle rho_W (x)$.
  
  For base case $n=2$, a Lie Algebra Representation $rho:frak(g) arrow.r gl(V)$, the Tensor Representation on $V times.circle V$ is defined as $rho_2:frak(g) arrow.r gl(V times.circle V)$ by $rho_2 (x) := rho(x) times.circle 1_V + 1_V times.circle rho(x)$. Now, suppose for given $n in NN$, the Tensor Representation $rho_n:frak(g) arrow.r gl(V^(times.circle n))$ is given as follow:
  $ rho_n (x) = sum_(i=1)^n x^((n))_i, quad quad x^((n))_i := 1_V times.circle...times.circle rho(x) times.circle ... times.circle 1_V, " " rho(x) "at "i^upright(t h) "position" $
  Then, the corresponding Tensor Representation $rho_(n+1):frak(g) arrow.r gl(V^(times.circle n+1))$ (where $V^(times.circle n+1) = V^(times.circle n) times.circle V$) is given as follow:
  $ rho_(n+1)(x) &= rho_n (x) times.circle 1_V + 1_(V^(times.circle n)) times.circle rho(x) = (sum_(i=1)^n x^((n))_i) times.circle 1_V + 1_V times.circle...times.circle 1_V times.circle rho(x) $
  Where, the second tensor $1_V times.circle ... times.circle 1_V times.circle rho(x)$ has $n$ copies of $1_V$ with $rho(x)$ at the $(n+1)^upright(t h)$ position, we'll denote as $x^((n+1))_(n+1)$. Also, each $x^((n))_i = 1_V times.circle ... times.circle rho(x) times.circle ... times.circle 1_V$ (total of $n$ entries, with $rho(x)$ at the $i^upright(t h)$ entry), then $x^((n))_i times.circle 1_V$ has $(n+1)$ entries, with $rho(x)$ at the $i^upright(t h)$ entry, hence $x^((n))_i times.circle 1_V = x^((n+1))_i$. So, eventually the above simplivies to:
  $ rho_(n+1)(x) &= (sum_(i=1)^n x^((n))_i) times.circle 1_V + x^((n+1))_(n+1)\ 
  &= sum_(i=1)^n x^((n))_i times.circle 1_V + x^((n+1))_(n+1) = sum_(i=1)^n x^((n+1))_i + x^((n+1))_(n+1)=sum_(i=1)^(n+1) x^((n+1))_i $
  Which is the desired form of the tensor representation. So, based on induction, the $n$-Tensor Representation $rho_n:frak(g) arrow.r gl(V^(times.circle n))$ is given by $rho_n (x) = sum_(i=1)^n 1_V times.circle...times.circle rho(x) times.circle ... times.circle 1_V$ (where for each index $i$, $rho(x)$ is at the $i^upright(t h)$ entry).

  \ 

  #text(weight: "bold")[II. Symmetric Tensor of $CC^2$:]

  Given $V^(times.circle k)$, the symmetric tensor $S^k V$ can be defined as the quotient $V^(times.circle k)\/S_k$, where we say $times.circle_(i=1)^k v_i tilde times.circle_(i=1)^k u_i$, if there exists a permutation $sigma in S_k$, such that each $u_i = v_(sigma(i))$ (i.e. identify each pure $k$-tensor to be the same, if the entries are the same up to coordinates permutation).

  Which, if limit $V = CC^2$, with basis $x,y$, then$S^k CC^2$ in fact has a basis of the collection ${v_(p q) := (times.circle_(i=1)^p x) times.circle (times.circle_(j=1)^q y) | p+q = k}$ (since $(CC^2)^(times.circle k)$ is spanned by all the pure $k$-tensors formed with various permutations of $x,y$ with total of $k$ entries, then since here the equivalence is up to permutation of entries, $S^k CC^2$ is spanned by these pure $k$-tensors that covered all possible amount of $x,y$ that fit as a $k$-tensor; the reason they're linearly independent, is due to the fact that if the pair $(p,q)$ don't match, the corresponding $v_(p q)$ are not equivalent under $S_k$-action, so no linaer combinations of them would ever be quotiented out). 

  This shows that $dim (S^k CC^2) = k+1$, which as vector space $S^k CC^2 tilde.equiv V_k$ (since $V_k subset CC[x,y]$ is spanned by all $x^p y^q$ where $p+q=k$, so $dim(V_k)=k+1$ also). Here, an explicit isomorphism is given by $T: S^k CC^2 arrow.r.tilde V_k$ by $T((times.circle_(i=1)^p x) times.circle (times.circle_(j=1)^q y)) = x^p y^q$.

  \ 

  #text(weight: "bold")[III. Invariance of $sl(2,CC)$ action on $S^k CC^2$:]

  Given any tensor $times.circle_(i=1)^k v_i in (CC^2)^(times.circle k)$, given any $x in sl(2,CC)$, the tensor representation is given as:
  $ rho_k (x) dot (times.circle_(i=1)^k v_i) = sum_(i=1)^k x^((k))_i dot (times.circle_(i=1)^k v_i), quad x^((k))_i dot (times.circle_(i=1)^k v_i) = v_1 times.circle ... times.circle (x dot v_i) times.circle...times.circle v_k $
  So, chosen any permutation $sigma in S_k$, we have the following:
  $ rho_k (x) dot (times.circle_(i=1)^k v_(sigma(i))) = sum_(i=1)^k x^((n))_i dot (times.circle_(i=1)^k v_(sigma(i))) = sum_(i=1)^k x^((k))_(sigma(i)) dot (times.circle_(i=1)^k v_i) = rho_k (x) dot (times.circle_(i=1)^k v_i) $
  (Note: since $(times.circle_(i=1)^k v_i)$ is fixed, one can permute $x^((k))_i$ instead fo the indices to match up). Hence, this shows that the $sl(2,CC)$ action on $(CC^2)^(times.circle k)$ is invariant under $S_k$-action, which implies that the $sl(2,CC)$-action on $S^k CC^2:= (CC^2)^(times.circle k)\/S_k$ is well-defined, and acts the same on their representatives in $(CC^2)^(times.circle k)$. So, for ease of calculation, we'll use the representatives in $(CC^2)^(times.circle k)$ to calculate the action, then take quotient to see the result in $S^k CC^2$.

  \ 

  #text(weight: "bold")[III. Isomorphism as $sl(2,CC)$ Representation:]

  Finally, we aim to show that $T:S^k CC^2 arrow.r.tilde V_k$ in part #text(weight: "bold")[II] is in fact an isomorphism as $sl(2,CC)$ representations. Since it's already a linear isomorphism, it suffices to check if $T$ is a morphism of $sl(2,CC)$ representations.

  Given the matrix form $h = mat(1,0;0,-1), e=mat(0,1;0,0), f=mat(0,0;1,0)$, the action on $CC^2$ (with ordered basis ${x,y}$) is as follow:
  $ h dot x=x, quad h dot y = -y, quad quad  e dot x = 0, quad e dot y = x, quad quad f dot x=y, quad f dot y=0 $
  Hence, given any $v_(p q)=(times.circle_(i=1)^p x) times.circle (times.circle_(j=1)^q y)$, the action of $h,e,f$ on $S^k CC^2$ are as follow:
  - For $h$, each $h^((k))_i = 1_V times.circle...times.circle h times.circle ... times.circle 1_V$ (with $h$ at the $i^upright(t h)$ entry, identity on the rest). Hence, if $p<i$, the $i^upright(t h)$ entry of $v_(p q)$ here is given by $y$, so $h^((k))_i v_(p q) = -v_(p q)$ (since at the $i^upright(t h)$ entry $h dot y=-y$); else, if $p>=i$, the $i^upright(t h)$ entry of $v_(p q)$ is given by $x$, so $h^((k))_i v_(p q) = v_(p q)$ (since $h dot x=x$ on the $i^upright(t h)$ entry). Therefore:
    $ rho_k (h) dot v_(p q) &= sum_(i=1)^k h^((k))_i dot v_(p q) = sum_(i=1)^(p)h^((k))_i dot v_(p q)+sum_(i=p+1)^k h^((k))_i dot v_(p q)\ 
    &= p dot v_(p q) - (k-p) dot v_(p q) = (p-q) dot v_(p q) $
    (Note: Recall that $p+q = k$).

    \ 

  - For $e$, each $e^((k))_i$ has $e$ at the $i^upright(t h)$ entry (identity on the rest). Hence, if $p<i$, the $i^upright(t h)$ entry of $v_(p q)$ is given by $y$, so $e^((n))_i v_(p q)tilde v_((p+1)(q-1))$ (since on the $i^upright(t h)$ entry we have $e dot y = x$, so increase number of $x$ i.e. $p$ by $1$, and decrease number of $y$ i.e. $q$ by 1); else if $p>=i$, the $i^(t h)$ entry of $v_(p q)$ is given by $x$, so $e^((n))_i v_(p q)=0$ (since $i^upright(t h)$ entry is $e dot x = 0$). Hence:
    $ rho_k (e) dot v_(p q)&=sum_(i=1)^k e^((k))_i dot v_(p q)=sum_(i=1)^p e^((k))_i dot v_(p q)+sum_(i=p+1)^k e^((k))_i dot v_(p q)\ 
    &= (k-p) v_((p+1)(q-1)) = q dot v_((p+1)(q-1)) $

    \ 

  - For $f$, each $f^((k)_i)$ has $f$ at the $i^upright(t h)$ entry (identity on the rest). Hence, if $p<i$, the $i^upright(t h)$ entry of $v_(p q)$ is given by $y$, so $f^((n)_i v_(p q)) = 0$ (since $f dot y=0$ on the $i^upright(t h)$ entry); else, if $p>=i$, the $i^upright(t h)$ entry of $v_(p q)$ is $x$ instead, so $f^((n))_i v_(p q) tilde v_((p-1)(q+1))$ (since $f dot x=y$ on the $i^(upright(t h))$ entry, so number of $x$ i.e. $p$ decrease by $1$, while number of $y$ i.e. $q$ increase by $1$). Hence:
    $ rho_k (f) dot v_(p q)&=sum_(i=1)^k f^((k))_i dot v_(p q)=sum_(i=1)^p f^((k))_i dot v_(p q)+sum_(i=p+1)^k f^((k))_i dot v_(p q)= p dot v_((p-1)(q+1)) $
  
  So, with the map $T$ in mind, the $sl(2,CC)$-action have $h,e,f$ satisfy the following:
  $ T(rho_k (h) dot v_(p q)) = T((p-q) dot v_(p q)) = (p-q)x^p y^q = h dot (x^p y^q) = h dot T(v_(p q)) $
  $ T(rho_k (e) dot v_(p q))=T(q dot v_((p+1)(q+1))) = q x^(p+1)y^(q-1) = e dot (x^(p)y^(q)) = e dot T(v_(p q)) $
  $ T(rho_k (f) dot v_(p q))=T(p dot v_((p-1)(q+1))) = p x^(p-1)y^(q-1) = f dot (x^p y^q) = f dot T(v_(p q)) $
  (Note: above $h,e,f$ acts on the monomials $x^p y^q$ as differential operators).

  Hence, we concluded that $T$ is also a morphism of $sl(2,CC)$ Representation (since it preserves the action of $h,e,f$ on the vector spaces, which are the basis elements of $sl(2,CC)$). Therefore, $S^k CC^2 tilde.equiv V_k$ not only as vector spaces, but also as $sl(2,CC)$-Representations.

]
