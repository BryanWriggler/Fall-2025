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

= D//2
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

  Since $GL(n,CC),U(n)$ are Lie groups, while $B(n,CC), T(n)$ are their closed Lie subgroups (since they're stabilizers of the given action / sub-action $mu$, and all stabilizers are closed Lie subgroups b #text(weight: "bold")[Proposition 4.12] in Etingof's lecture notes), then can classify $cal(F)_n (CC) := GL(n,CC)\/B(n,CC)$ or $cal(F)_n (CC) := U(n)\/T(n)$ as homogeneous space (and these two structures are compatible, since the cosets in $U(n)\/T(n)$ is simply a restriction of cosets in $GL(n,CC)\/B(n,CC)$ onto $U(n)$). Hence, with $U(n)$ being a compact Lie group, its quotient $cal(F)_n (CC)=U(n)\/T(n)$ is also compact. 
  
  (#text(weight: "bold")[Note:] The reason why $U(n)$ is compact, since chosen the smooth endomorphism on $M_n (CC)$ by $A mapsto A A^dagger$ (here it represents conjugate transpose), we have the preimage of ${id}$ being $U(n)$, hence ${id}$ is closed implies $U(n)$ is closed; similarly, $U(n)$ is compact, since for all $A in U(n)$, its operator norm $||A||:= sup_(||v||=1)||A v|| = 1$, and this operator norm is compactible with Euclidean norm, showing that $U(n)$ is also bounded under Euclidean Norm).

  \ 

  Finally, to collect the dimension of $cal(F)_n (CC)$, we claim that $B(n,CC)$ has real dimension $n(n+1)$: Given any $A in B(n,CC) subset.eq GL(n,CC)$, since $GL(n,CC)$ is open in $M_n (CC)$, there exists $r>0$ such that with respect to the Euclidean Norm $B_r (A) subset.eq GL(n,CC)$. Take the smooth inclusion $iota:CC^(n(n+1)/2) arrow.r.hook M_n (CC)$, by sending $n(n+1)/2$ entries to an upper triangular matrix in some particular order, then take $iota^(-1)(B_r (A))$ as the desired open set, it has a natural 1-to-1 correspondance with $B_r (A) sect B(n,CC)$, and $iota$ (when restricting onto $B(n,CC)$) has inverse naturally given by canonical projection $pi:B(n,CC) arrow.r CC^(n(n+1)/2)$ that projects the $n(n+1)/2$ upper triangular entries back. Hence, this $iota$ characterizes a homeomorphism from an open subset of $CC^(n(n+1)/2)$ to an open neighborhood of $A$, showing that $B(n,CC)$ has real dimension of $n(n+1)$ (since $CC^(n(n+1)/2)$ has real dimension $n(n+1)$).

  Then, with $GL(n,CC)$ having real dimension of $2n^2$, $cal(F)_n (CC) = GL(n,CC)\/ B(n,CC)$ has real dimension $2n^2-n(n+1) = n^2-n$.
]

#pagebreak()

= D//3
#problem[
  Etingof Problem Sets 2.5:

  Let $G_(n,k)$ be the set of all dimension $k$ subspaces in $RR^n$ (usually called the Grassmanian). Show that $G_(n,k)$ is a homogeneous space of the group $O(n,RR)$ and thus can be identified with coset space $O(n,RR)\/H$ for appropriate $H$. Use it to prove that $G_(n,k)$ is a manifold and find its dimension.
][
  First, let ${e_1,...,e_n}$ be the ordered elementary basis of $RR^n$, and we'll set $V_s := span{e_1,...,e_k}$ as the standard subspace with dimension $k$. We aim to show that $O(n,RR)$ has a transitive action on $G_(n,k)$.

  \  

  #text(weight: "bold")[1. Action of $O(n,RR)$ on $G_(n,k)$:]
  First, given $V in G_(n,k)$ (a $k$-dimensional subspace), it's clear that all $A in O(n,RR)$ satisfies $dim(A(V))=k$ (since the linear operator is invertible). So, define the map $mu:O(n,RR) times G_(n,k) arrow.r O(n,RR)$ by $mu(A,V) = A(V)$, it forms a left action since $mu(B,mu(A,V)) = B(A(V)) = (B A)(V) = mu(B A,V)$ for all $A,B in O(n,RR)$ and $V in G_(n,k)$, while $mu(id,V) = id(V)=V$.

  #text(weight: "bold")[2. Action $mu$ is Transitive:]
  To show it is transitive, it suffices to show that $O(n,RR)$ can permute the standard subspace $V_s$ to any $k$-dimensional subspace $V in G_(n,k)$. 

  For any $V in G_(n,k)$, let ${v_1,...,v_k}$ be a a basis of $V$, and extend it to a basiss ${v_1,...,v_n}$ of the whole space $RR^n$. Using Gram Schmidt formula, ${v_1,...,v_n}$ can specifically be modified to an orthonormal basis ${f_1,...,f_n}$, such that $V=span{f_1,...,f_k}$ still, so WLOG, we'll say ${v_1,...,v_n}$ is orthonormal.

  Define a linear operator $A in M_n (RR)$ satisfying $A(e_i)=v_i$ for all index $i=1,...,n$, since it sends orthonormal basis ${e_1,...,e_n}$ to orthonormal basis ${v_1,...,v_n}$, it's a real unitary operator, hence $A in O(n,RR)$. And, since $A(e_i)=v_i$, then $A(V_s) = A(span{e_1,...,e_k}) = span{A(e_1),...,A(e_k)} = span{v_1,...,v_k} = V$, showing that $mu(A,V_s) = A(V_s)=V$. This shows the transitivity of the action $mu$.

  \ 

  Hence, let $H = G_(V_s)$, the stabilizer of $V_s$ under the action $mu$, $H <= O(n,RR)$ is a closed Lie subgroup (by #text(weight: "bold")[Proposition 4.12] in Etingof's lecture notes), and since $G_(n,k) = Orb(V_s)$ has a natural set isomorphism to the let cosets of $G_(V_s)$, we have $G_(n,k) tilde.equiv O(n,RR)\/H$ as sets, showing that $G_(n,k)$ can be identified as a homogeneous space of $O(n,RR)$ by $O(n,RR)\/H$, with dimension $dim(O(n,RR)) - dim(H)$.

  \ 

  Now, to calculate the dimension of $G_(n,k)$, it requires both the dimension of $O(n,RR)$ and $H$. For this, we'll explicitly calculate $H$. Recall that dimension of $O(l,RR)$ for all $l in NN\\{0}$ is given by $l(l-1)/2$. We'll eventually show that $H tilde.equiv O(k,RR) times O(n-k,RR)$.

  For all $A in H = G_(V_s)$, let $u_i = A(e_i)$ for all index $i$, we have ${u_1,...,u_n}$ being an orthonormal basis, such that $span{u_1,...,u_k} = span{A(e_1),...,A(e_k)} = A(span{e_1,...,e_k}) = A(V_s) = V_s$, hence if restrict $A$ as a linear operator to $V_s$, since ${u_1,...,u_k}$ is an orthonormal basis of $V_s = span{e_1,...,e_k}$ (so each component can be expressed as unique linear combination of $e_1,...,e_k$), hence $A|_(V_s) in O(V_s)$ (or it's a unitary operator on $V_s$).

  Similarly, since $u_(k+1),...,u_n$ are all orthogonal to $u_1,...,u_k$, then $span{u_(k+1),...,u_n} subset.eq span{u_1,...,u_k}^perp = V_s^perp$; and since $dim(V_s^perp)=n-dim(V_s)=n-k$, then ${u_(k+1),...,u_n} subset V_s^(perp)$ (an orthonormal list of $n-k$ vectors) is a basis of $V_s^(perp)$. Notice that $e_(k+1),...,e_n in V_s^perp$ (since $V_s = span{e_1,...,e_k}$, and the standard basis forms an orthonormal basis), hence we again get $A(V_s^perp)=V_s^perp$ (since it sends ${e_(k+1),...,e_n}$ an orthonormal basis of $V_s^perp$ to ${u_(k+1),...,u_n}$ another orthonormal basis of $V_s^perp$). So, when restricting to $V_s^perp$, $A|_(V_s^perp) in O(V_s^perp)$.

  Then, given $O(V_s) = O(k,RR)$ (if using $e_1,...,e_k$ as its basis) and $O(V_s^perp) tilde.equiv O(n-k,RR)$ (if using $e_(k+1),...,e_n$ as its basis) by similar reason, then, $A$ in fact can be decomposed as follow:
  $ A = mat(A|_(V_s), 0; 0, A|_(V_s^perp)) $
  This is due to the fac that each $u_1,...,u_k in V_s$ can be written as linear combination of $e_1,...,e_k$ (and such linear combination is unique), and similar reason for $u_(k+1),...,u_n in V_s^perp$ being written as unique linear combination of $e_(k+1),...,e_n$.
  
  Hence, there is a natural group homomorphism $rho:H arrow.r O(k,RR) times O(n-k,RR)$ given by $rho(A) = (A|_(V_s), A|_(V_s^perp))$, since it satisfies the following for all $A,B in H$:
  $ A B = mat(A|_(V_s), 0; 0, A|_(V_s^perp))mat(B|_(V_s), 0; 0, B|_(V_s^perp)) = mat(A|_(V_s)B|_(V_s), 0; 0, A|_(V_s^perp) B|_(V_s^perp)) = mat((A B)|_(V_s), 0; 0, (A B)|_(V_s^perp))  $
  Which, $rho(A B) = (A|_(V_s) B|_(V_s), A|_(V_s^perp) B|_(V_s^perp)) = (A|_(V_s),A|_(V_s^perp)) dot (B|_(V_s),B|_(V_s)^perp) = rho(A) dot rho(B)$.

  This morphism is injective, simply because if $rho(A) = (id|_(V_s), id|_(V_s)^perp)$, with $RR^n = V_s plus.circle V_s^perp$ and restriction of $A$ fixing both subspaces, we must have $A = id$; and, this morphism is surjective, simply because any unitary operators $A_k in O(k,RR)$ and $A_(n-k) in O(n-k,RR)$, the following is a unitary operator fixing $V_s$:
  $ A := mat(A_k,0;0,A_(n-k)) $
  Since first $k$ and last $(n-k)$ column vectors form two orthonormal lists, while any column vector $u_i$ ($i<=k$) and $u_j$ ($j>k$) are orthonormal because their nonzero entries are mutually disjoint. Hence, the column vectors of $A$ form an orthonormal list of $n$ vectors, which is an orthonormal basis, showing $A in O(n,RR)$; also, since every $e_i$ for $1<=i<=k$ satisfies $A(e_i) in span{e_1,...,e_k}=V_s$, it stabilizes $V_s$, hence $A in H$.

  \ 

  As a result, one has $H tilde.equiv O(k,RR) times O(n-k,RR)$, and the map is in fact smooth (since it's essentially projecting onto the top left $k times k$ minor, and the bottom right $(n-k) times (n-k)$ minor), which demonstrates that $dim(H) = dim(O(k,RR))+dim(O(n-k,RR)) = k(k-1)/2+(n-k)(n-k-1)/2$. Finally, we conclude that the dimension of $O(n,RR)\/H$ is given as follow:
  $ dim(O(n,RR)\/H) = dim(O(n,RR))-dim(H) $ 
  $ = n(n-1)/2 - (k(k-1)/2+(n-k)(n-k-1)/2) = k(n-k) $
]

#pagebreak()

= ND//4
#problem[
  Etingof Problem Sets 2.6:

  Show that if $G=GL(n,RR) subset End(RR^n)$ so that each tangent space is canonically identified with $End(RR^n)$, then $(L_g)_* v=g v$ (or $(d L_g)_id v = g v$) where the product in the right-hand side is the usual product of matrices, and similarly for the right action. Also, the adjoint action is given by $"Ad" g(v)=g v g^(-1)$.
][

]

= ND//5
#problem[
  Let $phi:SU(2) arrow.r SO(3,RR)$ be the morphism defined in the previous problem. Compute explicitly the map of tangent spaces $phi_*: su(2) arrow.r so(3,RR)$ and show that $phi_*$ is an isomorphism. Deduce from this that $ker phi$ is a discrete normal subgroup in $SU(2)$ and that $im phi$ is an open subgroup in $SO(3,RR)$.
][]