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
  title: "Math 231A HW 3",
  authors: ("Zih-Yu Hsieh",),
  date: datetime.today().display("[month repr:long] [day], [year]"),
)

= ND//1
#problem[
  Etingof Problem Set 2.11:

  Show that for $n>=1$, we have $pi_0(SU(n+1))=pi_0(SU(n))$, $pi_0(U(n+1))=pi_0(U(n))$ and deduce from it that groups $U(n),SU(n)$ are connected for all $n$. Similarly, show that for $n>=2$, we have $pi_1(SU(n+1))=pi_1(SU(n))$, $pi_1(U(n+1))=pi_1(U(n))$ and deduce from it that for $n>=2$, $SU(n)$ is simply-connected and $pi_1(U(n))=ZZ$.
][

  #text(weight: "bold")[1. Statements about $pi_0$, the Connected Components:]
  We'll approach the first part by induction. For $n=1$, we have $U(1)=S^1$ and $SU(1)={1}$, which are both connected (these will be treated as base case).

  Now, suppose for given $n>=1$, suppose $U(n)$ (respectively, $SU(n)$) is connected (which $pi_0(U(n)) = pi_0(SU(n))={*}$). Consider $U(n+1)$ (and $SU(n)$ respectively): It has a natural action on $CC^(n+1)tilde.equiv RR^(2n+2)$ while preserving the norm, which descends to a natural action on $S^(2n+1):= {v in RR^(2n+2) | ||v||=1}$.

  Notice that for both $U(n)$ and $SU(n)$ such action on $S^(2n+1)$ is transitive, since let ${e_1,...,e_(n+1)}$ be the elementary basis of $CC^(n+1)$, for any $u_1 in S^(2n+1)$ one can extend this to an orthonormal basis, say ${u_1,...,u_(n+1)}$, then the matrix $mat(|, ,|;u_1,...,u_(n+1);|, ,|)$ is unitary, and sends $e_1$ to $u_1$, showing that $U(n)$ has transitive action on $S^(2n+1)$; and, for $SU(n+1)$ it's also transitive, since one can always modify the list ${u_1,...,u_(n+1)}$ (by multiplying one some scalar $lambda in CC$ with $|lambda|=1$ to one of the $u_2,...,u_(n+1)$) to get determinant $1$, hence one can talk about their stabilizers for $e_1 in S^(2n+1)$ for instance.

  \ 

  If fix $e_1 in S^(2n+1)$, then $G_(e_1) subset U(n+1)$ must fixe $e_1$, while send $span{e_1}^perp = span{e_2,...,e_(n+1)}$ back to itself (due to the unitarity of the matrices). Hence, any $O in G_(e_1)$ must have $O(e_1)=e_1$, and $O(e_i) in span{e_2,...,e_(n+1)}$ for all index $i>1$, which has the following form under standard basis:
  $ cal(M)(O) = mat(1,0;0,O^((n))) $
  Where here $O^((n)) in U(n)$ (since $O$ itself restricts to a unitary operator on $span{e_2,...,e_(n+1)}$). Hence, by taking the map $O mapsto O^((n))$, it defines an injective map (in fact a group homomorphism because $O^((n))$ is a block matrix on the diagonal) of $G_(e_1) arrow.r.hook U(n)$. This map is also surjective since every $O^((n)) in U(n)$ has $O:= mat(1,0;0,O^((n)))$ be a unitary operator on $CC^(n+1)$. Hence, $G_(e_1) tilde.equiv U(n)$.

  As a consequence, since the action on $S^(2n+1)$ is transitive, by the theorem related to the homogeneous space we have $S^(2n+1) = Orb(e_1) tilde.equiv U(n+1)\/G_(e_1) tilde.equiv U(n+1)\/U(n)$. Hence, by assumption since $U(n)$ is connected, while $S^(2n+1)$ is simply-connected, we have $pi_0(U(n+1)) tilde.equiv pi_0(U(n+1)\/U(n)) = pi_0(S^(2n+1))={*}$ (from a set-theoretic point of view, due to #text(weight: "bold")[Corollary 4.2] in Etingof's notes), hence $pi_0(U(n+1))$ is trivial, which $U(n+1)$ is connected.

  Then, recall that $SU(n+1)$ also acts transitively on $S^(2n+1)$, and its stabilizer for $e_1$ is $SU(n+1) sect G_(e_1)$, which from the formual in (1.1) it's every matrix of the form $O=mat(1,0;0,O^((n)))$ with $det(O)=det(O^((n)))=1$, hence we have $SU(n+1)sect G_(e_1) tilde.equiv SU(n)$ by definition. So by similar logic, $pi_0(SU(n+1)) tilde.equiv pi_0(SU(n+1)\/SU(n)) = pi_0(S^(2n+1)) = {*}$ (as sets), again showing that $SU(n+1)$ is also connected.

  \ 

  #text(weight: "bold")[2. Statements about $pi_1$, the Fundamental Groups:]
  Since we've proven by induction that $U(n)$ and $SU(n)$ are all connected for $n>=1$, hence one can identify its fundamental group. Again, by applying #text(weight: "bold")[Corollary 4.2] in Etingof's Notes, using the same (transitive) action defined in the previous part, we have the following exact sequences for all $n>=1$:
  $ pi_2(U(n+1)\/U(n)) arrow.r pi_1(U(n)) arrow.r pi_1(U(n+1)) arrow.r pi_1(U(n+1)\/U(n)) arrow.r {1} $
  $ pi_2(SU(n+1)\/SU(n)) arrow.r pi_1(SU(n)) arrow.r pi_1(SU(n+1)) arrow.r pi_1(SU(n+1)\/SU(n)) arrow.r {1} $
  Then, because $U(n+1)\/U(n) tilde.equiv SU(n+1)\/SU(n)tilde.equiv S^(2n+1)$ by the previous construction of homogeneous spaces, then because $pi_2(S^(2n+1))$ and $pi_1(S^(2n+1))$ are both trivial groups, the above exact sequences reduce to the following:
  $ pi_1(U(n)) arrow.r.tilde pi_1(U(n+1)), quad pi_1(SU(n)) arrow.r.tilde pi_1(SU(n+1)) $
  Hence, one can identify $pi_1(U(n))=pi_1(U(n+1))$ and $pi_1(SU(n))=pi_1(SU(n+1))$.

  Finally, because $U(1)=S^1$ (which has $pi_1(S^1)=ZZ$) and $SU(1)={1}$ (which has $pi_1({1})={1}$), then we conclude that $pi_1(U(n))=ZZ$ and $pi_1(SU(n))={1}$ for all $n>=1$.

]

#pagebreak()

= ND//2
#problem[
  Etingof Problem Set 2.13:

  Using Gram-Schmidt orthogonalization process, show that $GL(n,RR)\/O(n,RR)$ is diffeomorphic to the space of upper-triangular matrices with positive entries on the diagonal. Deduce from this that $GL(n,RR)$ is homotopic (as a topological space) to $O(n,RR)$.
][
  Here we'll utilize QR-Factorization: Given $A in GL(n,KK)$ where $KK=CC$ or $RR$, then there exists unique matrices $Q$ and $R$ (with $Q$ being unitary and $R$ being upper-triangular with positive entries on the diagonal), such that $A=Q R$. 
  
  For the case $KK=RR$, since the unitary matrices are precisely collected by $O(n,RR)$, then with $"UT"_+(n,RR)$ denoting groups of upper triangular matrices with positive enries on the diagonal, if identify $GL(n,RR)\/O(n,RR)$ with the right cosets (instead of the left cosets), then for all matrix $A=Q R in GL(n,RR)$ (using QR-Factorization), we have $overline(A)=overline(R)$. THis shows the set function $"UT"_+(n,RR) arrow.r GL(n,RR)\/O(n,RR)$ by $R mapsto overline(R)$ is surjective.

  Also, notice that $O(n,RR) sect "UT"_+(n,RR) = {id_n}$: Given any $T in O(n,RR) sect "UT"_+(n,RR)$, we have its first column being normalized (and only with entry $T_(11)>0$), hence we must have $T_(11)=1$, while any other $T_(1k)=0$ (by the claim that $T$ is upper-triangular). Inductively, for the $i^upright(t h)$ column vector of $T$ (with $i<k$), if given $T_(i 1),...,T_(i (i-1)), T_(i (i+1)),...,T_(i n)$ are all $0$ and $T_(i i)=1$, then by orthonormality if taking the inner product of the $k^upright(t h)$ column vector with the first $(k-1)$ of them, we must yield $T_(k 1)=...=T_(k (k-1))=1$, while $T_(k (k+1))=...=T_(k n)=0$ by the fact that $T$ is upper-triangular. Finally, because $T_(k k)$ must have norm $1$ and being positive, then $T_(k k)=1$. Hence, all the diagonals are $1$ (by induction) while non-diagonal emtries are all $0$, showing $T=id_n$.

  Hence, given any $R,R' in "UT"_+(n,RR)$, if $overline(R)=overline(R') in GL(n,RR)\/O(n,RR)$, one must have $R(R')^(-1) in O(n,RR)$ (since they have the same right coset), showing that $R(R')^(-1)=id_n$, or $R=R'$. Therefore as set function, $"UT"_+(n,RR) arrow.r GL(n,RR)\/O(n,RR)$ by $R mapsto overline(R)$ is also injective. Hence, since it is bijective, there's no ambiguity identifying the representatives of each coset in $GL(n,RR)\/O(n,RR)$ using $"UT"_+(n,RR)$.

  \ 

  Notice that such identification automatically defines a faithful and transitive right action of $"UT"_+(n,RR)$: Since for all right coset $overline(A)$ in $GL(n,RR)\/O(n,RR)$ there exists a unique $R in "UT"_+(n,RR)$ such that $overline(R)=overline(A)$, 
]

= ND//3
#problem[
  Etingof Problem Set 2.14:

  Let $L_n$ be the set of all Lagrangian subspaces in $RR^(2n)$ with the standard symplectic form $w$. (A subspace $V$ is Lagrangian if $dim(V)=n$ and $w(x,y)=0$ for any $x,y in V$). Show that the group $Sp(n,RR)$ acts transitively on $L_n$ and use it to define on $L_n$ a structure of a smooth manifold and find its dimension.
][
  
]

#set enum(numbering: "(1)")
= ND//4
#problem[
  Etingof Problem Set 2.16:

  + Show that $Sp(1) tilde.equiv SU(2) tilde.equiv S^3$.
  + Using the previous exercise, show that we have a natural transitive action of $Sp(n)$ on the sphere $S^(4n-1)$ and a stabilizer of a point is isomorphic to $Sp(n-1)$.
  + Deduce that $pi_1(Sp(n+1))=pi_1(Sp(n))$, $pi_0(Sp(n+1))=pi_0(Sp(n))$.
][
  
]