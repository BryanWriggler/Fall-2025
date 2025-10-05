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
  title: "Math 231A HW 2",
  authors: ("Zih-Yu Hsieh",),
  date: datetime.today().display("[month repr:long] [day], [year]"),
)

= D//1
#problem[
  Etingof Problem Sets 2.2:

  (1) Show that every discrete normal subgroup of a connected Lie group is central (hint: consider the map $G arrow.r N:g arrow.r.bar g h g^(-1)$ where $h$ is fixed element in $N$).

  (2) By applying part (1) to kernel of the map $tilde(G) arrow.r G$, show that for any connected Lie group $G$, the fundamental group $pi_1(G)$ is commutative.
][
  We'll let $m:G times G arrow.r G$ denotes the group operation, while $iota:G arrow.r.tilde G$ denotes the inversion map of the Lie group $G$. We'll also use $bb(1)$ to denote the identity of $G$
 (to prevent confusion with $1 in I=[0,1]$).
  \ 

  #text(weight: "bold")[(1):] Recall that on a Lie group, inversion and multiplication are both regular maps. Now, fix an element $h in N$, if consider the map $Delta:G arrow.r G times G$ by $Delta(g) = (g,g)$, and consider the right multiplication of $h$ and inversion map, $R_h, iota:G arrow.r.tilde G$ which collects into a regular product map $(R_h, iota):G times G arrow.r G times G$ (by $(R_h,iota)(k,l) = (k h, l^(-1))$). Then, consider the map $f = m compose (R_h, iota) compose Delta:G arrow.r G$, we get:
  $ forall g in G,quad f(g) = m compose (R_h,iota) compose Delta(g) = m compose (R_h,iota)(g,g) = m(g h, g^(-1)) = g h g^(-1) $
  Which, this is the desired map we're working with, and it is a regular map. In particular, it's continuous.

  Then, since $G$ is a connected Lie group, one have $f(G) subset.eq G$ being connected; then, because $N$ is a normal subgroup, for any $g in G$, $f(g)=g h g^(-1) in N$, so $f(G) subset.eq N$; finally, since $N$ is discrete, then for any $h in N$, there exists open neighborhood $U in.rev h$ (where $U subset.eq G$) such that $U sect N={h}$, such that its closure $overline(U) sect N = {h}$ also (since $G$ is a manifold, choose a local chart with domain containing $h$ then one can use the discreteness in $RR^n$ or $CC^n$ to construct such open neighborhood).

  As a consequence, $f$ is restricted to be a constant map onto $h$, since if $h$ is non-constant, then $f(G) subset.eq.not {h}$, hence using the open neighborhood $U in.rev h$ above, take $V = G\\overline(U)$, one have $V sect U=emptyset$, while $f(G) in V union.sq U$ (since $overline(U)$ only contains $h$ while $h in U$ the interior of $overline(U)$, then since $overline(U)=U^degree union.sq partial U$, there's no point of $f(G)$ containing on the boundary $partial U$, and $partial U = G\\(V union.sq U)$ by some point set topology). Then, $V sect f(G)$ and $U sect f(G) = {h}$ forms a separation of $f(G)$ under its subspace topology, while $V sect f(G)$ is not empty based on the assumption that $f(G)$ is non-constant (i.e. there exists $h' != h$, where $h' in f(G)$; and since $h' in V$, one has $f(G) sect V != emptyset$). Yet, this contradicts the statement that $f(G)$ is connected. So, we must have $f(G)$ being constant, or $f(G) = {h}$.

  Hence, all $g in G$ satisfies $f(g)=g h g^(-1)=h$, or $g h=h g$, showing that $h in Z(G)$ (the center of $G$). And, with $h in N$ chosen arbitrarily, $N$ is central.

  \ 
  
  \ 

  #text(weight: "bold")[(2):] Given the covering map $p:tilde(G) arrow.r G$ that also serves as a group homomorphism. First, say we fix the base point of $G$ at identity $bb(1)$, and the base point of $tilde(G)$ at $[c_(bb(1))]$, the path class of constant map $c_(bb(1)):I arrow.r G$ by $c_1(s)=1$ (Note: the path class $[c_(bb(1))]$ also serves as the identity of $tilde(G)$, since for all other path classes $[g]$, its representative $g$ satisfies $g dot c_1(s) = g(s) dot c_1(s) = g(s) dot 1 = g(s) = c_1 dot g(s)$, so $[g] dot [c_1] = [g dot c_1]=[g]=[c_1 dot g] = [c_1] dot [g]$). 

  If we consider any path class $[g] in ker(p)$, one has $p([g]) = g(1) = bb(1)$. Since $g(0)=bb(1)$ also (by definition, the construction of $tilde(G)$ is all path classes with starting point at base point $bb(1)$ of $G$), then $g$ is in fact a loop, hence $[g] in pi_1(G):= pi_1(G, bb(1))$
  
  This shows that $ker(p) subset.eq pi_1(G)$, and $pi_1(G) subset.eq ker(p)$ simply because for any loop $[h] in pi_1(G)= pi_1(G,bb(1))$, if identify $[h] in tilde(G)$, $p([h]) = h(1)=bb(1)$, hence $[h] in ker(p)$. So, $ker(p) = pi_1(G)$ #text(weight: "bold")[as a set].

  Finally, to prove that the multiplication on $tilde(G)$ restricted to $ker(p)$ is compatible with the concatination operation on $pi_1(G)$, choose any path classes $[f],[g] in pi_1(G)$. If we define the map $H:I times I arrow.r G$ by $H(s,t) = f(s) dot g(t)$ (where the $dot$ is the group operation of $G$).
  
  Then, consider the diagonal path $H_Delta:I arrow.r G$ by $H_Delta(s) = H(s,s) = f(s) dot g(s) = (f dot g)(s)$, and the following path $h:I arrow.r G$:
  $ h(s):= cases(
    H(2s,0) quad quad quad s<=1/2,
    H(1,2s-1) quad s>1/2
  ) $
  Which, $h$ is tracing out the interval $[0,1] times {0}$, then continue with the interval ${1} times [0,1]$ in $I times I$, which is continuous. 

  Similarly, $H_Delta$ is tracing out the diagonal within $I times I$, then since $I times I$ is itself convex, and $H_Delta(0)=H(0,0)=h(0)$ while $H_Delta(1)=H(1,1)=h(1)$, then $H_Delta$ and $h$ are in fact path homotopic (since looking at their parametrization within $I times I$, they're convex hence homotopic, or can cf. #text(weight: "bold")[Square Lemma] in #text(weight: "bold")[Introduction to Topological Manifold] by Lee). So, $[h] = [H_Delta]$ as paths.

  \ 

  Finally, notice that $H_Delta$ is a path characterized by $f dot g$ (the multiplication defined for $tilde(G)$), while $h$ is a concatination of $f$ and $g$ (since $H(t,0) = f(t) dot g(0) = f(t) dot bb(1) = f(t)$, while $H(0,t) = f(0) dot g(t)=bb(1) dot g(t)=g(t)$). Hence, $H_Delta$ and $h$ being path homotopic, implies that the $[f] dot_(pi_1(G)) [g] = [f] dot_(tilde(G)) [g]$ (concatination in the fundamental group is the same as group operation in $tilde(G)$). Therefore, $ker(p) = pi_1(G)$ not only as sets, but as groups (since their group structure are th same from a topological perspective). 

  Which, with $ker(p) = pi_1(G)$ being discrete due to the fact that $p$ is a covering map, hence there exists evenly covered neighborhood $U subset.eq G$ of $bb(1)$, where $p^(-1)(U)= union.sq.big_(i in I)tilde(U)_i$ (with each $tilde(U)_i tilde.equiv U$ via restriction of $p$), and each component in $ker(p)$ must be containd in exactly one $tilde(U)_i$, while each $tilde(U)_i$ can contain only one candidate from $ker(p)$. So, these open subsets $tilde(U)_i$ forms a separation of $ker(p)$, showing it's discrete.

  Then, based on the fact that $ker(p) lt.tri.eq tilde(G)$ and its discrete, statement in (1) implies that it's central. Hence, $pi_1(G)$ is central.
]

#pagebreak()

= ND//2
#problem[
  Etingof Problem Sets 2.4:

  Let $cal(F)_n (CC)$ be the set of all flags in $CC^n$. Show that 
  $ cal(F)_n (CC)=GL(n,CC)\/B(n,CC) = U(n)\/T(n) $
  Where $B(n,CC)$ is the group of invertible complex upper triangular matrices, and $T(n)$ is the group of diagonal unitary matrices (which is easily shown to be the $n$-dimensional torus $(RR\/ZZ)^n$). Deduce from this that $cal(F)_n(CC)$ is a compact complex manifold and find its dimension over $CC$.
][
  As a premise, we'll identify $GL(n,CC)$ as a collection of linear operators on $CC^n$ with standard basis ${e_1,...,e_n}$ being the ordered basis. Let $V_i:= span{e_1,...,e_i}$, we'll denote the flag ${0}=V_0 subset.neq V_1 subset.neq ... subset.neq V_n = CC^n$ as $cal(F)_0$, called the #emph[Standard Flag]. 

  \ 
  
  #text(weight: "bold")[Equality between Sets:]\
  Notice that $GL(n,CC)$ has a natural action on $cal(F)_n (CC)$: For each $A in GL(n,CC)$ (viewed as an operator on $CC$), any subspace has its dimension being preserved (i.e. given $V subset.eq CC^n$ with $dim(V)=k$, $A(V) subset.eq CC^n$ also has $dim(A(V))=k$), and it preserves subspace inclusion (so $U subset.eq V ==> A(U) subset.eq A(V)$). Hence, if $U_0 subset.neq U_1 subset.neq ... subset.neq U_n$ is a flag, so is $A(U_0) subset.neq A(U_1) subset.neq ... subset.neq A(U_n)$; so, it makes sense to define $mu:GL(n,CC) times cal(F)_n (CC) arrow.r cal(F)_n (CC)$ by $mu(A, cal(F)) = A(cal(F))$ (where given $cal(F)$ as $U_0 subset.neq U_1 subset.neq ... subset.neq U_n$, $A(cal(F))$ denotes $A(U_0) subset.neq A(U_1) subset.neq ... subset.neq A(U_n)$). It's clear that $mu(B, mu(A,cal(F))) = mu(B A,cal(F))$ for all $A,B in GL(n,CC)$ and $cal(F) in cal(F)_n (CC)$ by composition of operators, while the identity matrix satisfies $mu(id,cal(F))=cal(F)$, hence $mu$ in fact forms a left action.

  \ 

  Now, we claim that $GL(n,CC)$ can be partitioned through its action on $cal(F)_0$, which can be seen through the following statements:

  #text(weight: "bold")[1. $B(n,CC)$ is the stabilizer of $cal(F)_0$:]
    We'll claim that $A in GL(n,CC)$ satisfies $mu(A,cal(F)_0)=A(cal(F)_0) = cal(F)_0$ iff $A in B(n,CC)$:

    If $A(cal(F)_0)=cal(F)_0$, it satisfies $A(V_i)=V_i$ for all $i=1,...,n$, hence $A(e_i) in A(V_i) = V_i = span{e_1,...,e_i}$ for each index $i$, showing $A$ is in fact uppertriangular with respect to basis ${e_1,...,e_n}$, hence $A in B(n,CC)$.

    Else, if $A in B(n,CC)$, each $e_i$ satisfies $A(e_i) in V_i=span{e_1,...,e_i}$, hence $A(V_1) = A(span{e_1}) subset.eq span{e_1} = V_1$ (while $A(V_1)$ and $V_1$ have the same dimension due to the fact that $A in GL(n,CC)$), showing that $A(V_1)=V_1$. Inductively one can show that all $A(V_i)=V_i$, hence $mu(A,cal(F)_0)=A(cal(F)_0)=cal(F)_0$.

    So, this concludes that $cal(F)_0$ is stable under (and only under) $B(n,CC)$, which $B(n,CC)$ is a stabilizer of $cal(F)_0$.

  #text(weight: "bold")[2. $mu$ is a Transitive Action:]
    To show such, consider a flag $cal(F)$ formed by ${0}=U_0 subset.neq U_1 subset.neq ... subset.neq U_n = CC^n$. Choose $u_1$ so that $U_1 = span{u_1}$, and inductively choose $u_i in U_i \\ U_(i-1)$ so that $U_i = span{u_1,...,u_i}$, then the list ${u_1,...,u_n}$ eventually forms a basis of $CC^n$ (#text(weight: "bold")[Rmk:] in particular using Gram Schmidt Formula one can restrict ${u_1,...,u_n}$ to be an orthonormal basis of $CC^n$ with Euclidean Inner Product). 
    
    Then, take a linear operator $T in GL(n,CC)$ that satisfies $T(e_i)=u_i$ for all index $i$. It satisfies $T(V_1)= T(span{e_1})subset.eq span{u_1}=U_1$, while the two have the same dimension, hence $T(V_1)=U_1$. Then, inductively one can derive $T(V_i)=span{u_1,...,u_i} = U_i$ using similar logic. Hence, $mu(T,cal(F)_0) = T(cal(F)_0)=cal(F)$, which shows that $mu$ is a transitive action. (#text(weight: "bold")[Rmk 2:] Because $u_i$s can be chosen as orthonormal basis, $T$ in fact can be chosen as a unitary operator, or $T in U(n)$. Hence, resrict the action $mu$ to an sub-action $U(n) times cal(F)_n (CC) arrow.r cal(F)_n (CC)$ is still a transitive action).

  \ 

  Then, since the orbit $Orb(cal(F)_0) = cal(F)_n (CC)$ while $G_(cal(F)_0) = B(n,CC)$ (the stabilizer), there is a one-to-one correspondance between $cal(F)_n$ and cosets of $B(n,CC)$, hence set wise $cal(F)_n (CC) tilde.equiv GL(n,CC)\/ B(n,CC)$.

  On the other hand, one has $B(n,CC) sect U(n) = T(n)$: Recall that $U(n)$ collects all unitary operators, so $A in B(n,CC)$ satisfies $A in U(n)$, iff as an uppertriangular matrix, it's also unitary (which equivalently requires $A$ to have orthonormal column vectors). Which, let $u_j$ be the $j^upright(t h)$ column vector of $A$, $u_j = sum_(i=1)^j a_(i,j) e_i$. Since $u_1 dot u_2=0$, it satisfies $(a_(1,1)e_1) dot (a_(1,2)e_1 + a_(2,2)e_2) = a_(1,2)a_(1,2)=0$, with $u_1!=bold(0)$ (or $a_(1,1)!=0$), it requires $a_(1,2)=0$, showing $u_2=a_(2,2)e_2$ Inductively one can verify $u_i = a_(i,i)e_i$ by the fact that ${u_1,...,u_n}$ is an orthonormal list. Hence, $A$ is in fact a diagonal matrix, showing $A in T(n)$, which concludes that $B(n,CC) sect U(n)subset.eq T(n)$ (while $T(n) subset.eq B(n,CC) sect U(n)$ by definition). Hence, $B(n,CC) sect U(n)=T(n)$.

  As a consequence, the sub-action $mu:U(n) times cal(F)_n (CC) arrow.r cal(F)_n (CC)$ has stabilizer of $cal(F)_0$, $G_(cal(F)_0)=B(n,CC) sect U(n)=T(n)$, hence set wise $cal(F)_n (CC) tilde.equiv U(n)\/T(n)$ also.

  \ 

  Since $GL(n,CC),U(n)$ are Lie groups, while $B(n,CC), T(n)$ are their closed Lie subgroups, then can classify $cal(F)_n (CC) := GL(n,CC)\/B(n,CC)$ or $cal(F)_n (CC) := U(n)\/T(n)$ as homogeneous space (and these two structures are compatible, since the cosets in $U(n)\/T(n)$ is simply a restriction of cosets in $GL(n,CC)\/B(n,CC)$ onto $U(n)$). Hence, with $U(n)$ being a compact Lie group, its quotient $cal(F)_n (CC)=U(n)\/T(n)$ is also compact.

  Finally, to collect the dimension of $cal(F)_n (CC)$, we claim that $B(n,CC)$ has dimension $n(n+1)/2$:
]