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

= D//1
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

\ 

= D//2
#problem[
  Etingof Problem Set 2.13:

  Using Gram-Schmidt orthogonalization process, show that $GL(n,RR)\/O(n,RR)$ is diffeomorphic to the space of upper-triangular matrices with positive entries on the diagonal. Deduce from this that $GL(n,RR)$ is homotopic (as a topological space) to $O(n,RR)$.
][
  #text(weight: "bold")[1. Diffeomorphism between $GL(n,RR)\/O(n,RR)$ and $"UT"_+(n,RR)$:]
  Here we'll utilize QR-Factorization: Given $A in GL(n,KK)$ where $KK=CC$ or $RR$, then there exists unique matrices $Q$ and $R$ (with $Q$ being unitary and $R$ being upper-triangular with positive entries on the diagonal), such that $A=Q R$. 
  
  For the case $KK=RR$, since the unitary matrices are precisely collected by $O(n,RR)$, then with $"UT"_+(n,RR)$ denoting groups of upper triangular matrices with positive enries on the diagonal, if identify $GL(n,RR)\/O(n,RR)$ with the right cosets (instead of the left cosets), then for all matrix $A=Q R in GL(n,RR)$ (using QR-Factorization), we have $overline(A)=overline(R)$. THis shows the set function $"UT"_+(n,RR) arrow.r GL(n,RR)\/O(n,RR)$ by $R mapsto overline(R)$ is surjective.

  Also, notice that $O(n,RR) sect "UT"_+(n,RR) = {id_n}$: Given any $T in O(n,RR) sect "UT"_+(n,RR)$, we have its first column being normalized (and only with entry $T_(11)>0$), hence we must have $T_(11)=1$, while any other $T_(1k)=0$ (by the claim that $T$ is upper-triangular). Inductively, for the $i^upright(t h)$ column vector of $T$ (with $i<k$), if given $T_(i 1),...,T_(i (i-1)), T_(i (i+1)),...,T_(i n)$ are all $0$ and $T_(i i)=1$, then by orthonormality if taking the inner product of the $k^upright(t h)$ column vector with the first $(k-1)$ of them, we must yield $T_(k 1)=...=T_(k (k-1))=1$, while $T_(k (k+1))=...=T_(k n)=0$ by the fact that $T$ is upper-triangular. Finally, because $T_(k k)$ must have norm $1$ and being positive, then $T_(k k)=1$. Hence, all the diagonals are $1$ (by induction) while non-diagonal emtries are all $0$, showing $T=id_n$.

  Hence, given any $R,R' in "UT"_+(n,RR)$, if $overline(R)=overline(R') in GL(n,RR)\/O(n,RR)$, one must have $R(R')^(-1) in O(n,RR)$ (since they have the same right coset), showing that $R(R')^(-1)=id_n$, or $R=R'$. Therefore as set function, $"UT"_+(n,RR) arrow.r GL(n,RR)\/O(n,RR)$ by $R mapsto overline(R)$ is also injective. Hence, since it is bijective, there's no ambiguity identifying the representatives of each coset in $GL(n,RR)\/O(n,RR)$ using $"UT"_+(n,RR)$.

  \ 

  Since for all right coset $overline(A)$ in $GL(n,RR)\/O(n,RR)$ there exists a unique $R in "UT"_+(n,RR)$ such that $overline(R)=overline(A)$. Then, define a right action of $"UT"_+(n,RR) arrow.cw.half GL(n,RR)\/O(n,RR)$ by $overline(R) dot T := overline(R T)$. It is transitive since any coset $overline(R) = overline(id_n) dot R$. Also, notice that the stabilizer for any element is trivial: Given any $R in "UT"_+(n,RR)$, suppose $R' in "UT"_+(n,RR)$ satisfies $overline(R) dot R' = overline(R R')=overline(R)$, then since $R R' in "UT"_+(n,RR)$, so the one-to-one correspondance between $GL(n,RR)\/O(n,RR)$ and $"UT"_+(n,RR)$ indicates that $R=R R'$, hence $R'=id_n$.

  Hence, if consider $GL(n,RR)\/O(n,RR)$ as a manifold and fix $overline(id_n)$ as an element, since $Orb(overline(id_n)) = GL(n,RR)\/O(n,RR)$ and $G_(overline(id_n)) = {id_n}$ under the action of $"UT"_+(n,RR)$, then we have $"UT"_+(n,RR) tilde.equiv "UT"_+(n,RR)\/{id_n} tilde.equiv Orb(overline(id_n)) = GL(n,RR)\/O(n,RR)$ (by #text(weight: "bold")[Corollary 4.13] in Etingof's notes). 

  (#text(weight: "bold")[Rmk:] Here the reason why the action is smooth, is because the action corresponds to a natural right action on $GL(n,RR)$, say $a:GL(n,RR) times "UT"_+(n,RR) arrow.r GL(n,RR)$ by $a(A,R)=A R$. Then, the action on $GL(n,RR)\/O(n,RR)$ can be obtained through $pi compose a$, where $pi:GL(n,RR) arrow.r GL(n,RR)\/O(n,RR)$ is the projection).

  \ 

  #text(weight: "bold")[2. Homotopy between $GL(n,RR)$ and $O(n,RR)$:] 
  Here, notice that $"UT"_+(n,RR) tilde.equiv (0,infinity)^n times RR^(n(n-1)/2)$ (since the $n$ diagonal entries are positive, while the $n(n-1)/2$ strict upper-triangular entries can be arbitrary real numbers), then this space is simply-connected (since $pi_1((0,infinity))tilde.equiv pi_1((RR))={e}$, so $pi_1("UT"_+(n,RR)) tilde.equiv product_(i=1)^n pi_1((0,infinity)) times product_(j=1)^(n(n-1)/2)pi_1(RR) = {e}$). So, that means the space is contractable, hence there exists smooth homotopy $H:"UT"_+(n,RR) times [0,1]arrow.r "UT"_+(n,RR)$, such that $H(R,1)=id_n$ for all $R in "UT"_+(n,RR)$.

  Then, one can basically pull back the homotopy to the homotopy on $GL(n,RR)$: Define $H':GL(n,RR) times [0,1] arrow.r GL(n,RR)$ by $H'(A,t) = Q_A dot H(R_A,t)$, where $A=Q_A R_A$ by QR-Factorization, so $R_A in "UT"_+(n,RR)$. Notice that such $H'$ in fact is well-defined by the uniqueness of QR-Factorization, and it's a smooth map due to the fact that the map $O(n,RR) times "UT"_+(n,RR) arrow.r GL(n,RR)$ by $(Q,R) mapsto Q R$ is a smooth surjective map (not a group homomorphism though) that's a locally trivial fibration (or one can choose small neighborhoods of $Q in O(n,RR)$ so that such map is diffeomorphic to its own image). Hence, since the map $((Q,R),t) mapsto (Q, H(R,t))$ defines a smooth homotopy on $O(n,RR) times "UT"_+(n,RR)$ that descends to $H':GL(n,RR) times [0,1] arrow. GL(n,RR)$ (by the local diffeoorphism onto $GL(n,RR)$), then $H'$ can be identified as a smooth map. Hence, one has $H'(A,1) = Q_A dot H(R_A,1) = Q_A dot id_n = Q_A in O(n,RR)$ for all $A in GL(n,RR)$, showing that $GL(n,RR)$ in fact is homotopic to $O(n,RR)$.
]

#pagebreak()

= D//3
#problem[
  Etingof Problem Set 2.14:

  Let $L_n$ be the set of all Lagrangian subspaces in $RR^(2n)$ with the standard symplectic form $w$. (A subspace $V$ is Lagrangian if $dim(V)=n$ and $w(x,y)=0$ for any $x,y in V$). Show that the group $Sp(n,RR)$ acts transitively on $L_n$ and use it to define on $L_n$ a structure of a smooth manifold and find its dimension.
][

  #text(weight: "bold")[1. Symplectic Action on Space of Lagrangian:]

  First, we'll fix $L^((0)):= span{e_1,...,e_n}$ (given that $RR^(2n)$ has standard basis ${e_1,...,e_n,f_1,...,f_n}$). Notice that $L^((0))$ is an $n$-dimensional subspace, and it's in fact Lagrangian: Notice that with symplectic form $w$, its matrix under standard basis is $cal(M)(w)=J=mat(0,id_n;-id_n,0)$, hence since for all $e_i,e_j in {e_1,...,e_n}$ we have $J(e_j)=-f_(j)$, then one has $w(e_i, e_j)=e_i dot J(e_j)=e_i dot (-f_j)=0$ (using standard Euclidean inner product). Hence, since all the pairs of basis elements of $L^((0))$ (when fixing a basis) yields $0$ under symplectic form, every $x,y in L^((0))$ satisfies $w(x,y)=0$ (by inductively breaking down the bilinear form into sums of the form applies to each pair of he basis). Hence, $L^((0))$ is a Lagrangian subspace.

  \ 

  To prove that $Sp(n,RR)$ acts transitively on $L_n$ (all Lagrangian Subspace), it suffices to prove that one can send $L^((0))$ to any Lagrangian Subspace, say $L in L_n$.
  We'll first establish some tools: 
  #lemma(1)[
    Given any Lagrangian Subspace $L in L_n$, with $J:= cal(M)(w)$ (the matrix of symplectic form), then $J L:={J(v)| v in L}$ is also Lagrangian.
  ][
    This can be seen by the following equation:
    $ J^T J J = mat(0,-id_n;id_n,0)mat(0,id_n;-id_n,0)mat(0,id_n;-id_n,0)=mat(0,id_n;-id_n,0) = J  $
    Hence, for all $x,y in L$, it satisfies $w(J x,J y) = (J x)^T J (J y) = x^T J^T J J y = x^T J y = w(x,y) = 0$, hence $J L$ is also Lagrangian (since $J$ is invertible, $J L$ is also $n$-dimensional).
  ]
  #lemma(2)[
    Given any Lagrangian $L in L_n$, $L plus.circle J L=RR^(2n)$ and $J L = L^perp$.
  ][
    For any $x = (a_1,...,a_n,b_1,...,b_n) in L sect J L$, we have the following:
    $ J x=mat(0,id_n;-id_n,0)mat(a_1;dots.v;b_n) = mat(b_1;dots.v;b_n;-a_1;dots.v;-a_n) in J L $
    $ J^(-1)x = mat(0,-id_n;id_n,0)mat(a_1;dots.v;b_n)=mat(-b_1;dots.v;-b_n;a_1;dots.v;a_n) in L $
    
    Hence, we also have $J x in L sect J L$. So, if we consider $w(x, J x) = 0$, it is expressed as follow:
    $ 0=w(x,J x)=mat(a_1,...,b_n) mat(0,id_n;-id_n,0)^2 mat(a_1;dots.v;b_n) $ 
    $ = mat(a_1,...,b_n) mat(-id_n,0;0,-id_n) mat(a_1;dots.v;b_n) = -x dot x $
    (Here it's using $J^2=-id_(2n)$).

    Hence, $x dot x=0$ under Euclidean inner product, showing that $x=0$. This concludes that $L sect J L={0}$, hence $L plus.circle J L$ forms a direct sum; however, since both $L,J L$ are $n$-dimensional subspaces, $L plus.circle J L$ is $2n$-dimensional, so $L plus.circle J L = RR^(2n)$.

    Also, let $a,b,c,d in RR^n$ satisfying $(a,b), (c,d) in L$, then the matrix tells that $w((a,b),(c,d)) = (a,b) dot (d,-c) = a dot d - b dot c = 0$. So, we get that $(a,b) dot J((c,d)) = w((a,b),(c,d))=0$. Hence, any $(a,b) in L$ and $J((c,d)) in J L$ are orthogonal to each other, showing that $J L subset.eq L^perp$; and with the two subspace having the same dimension, $J L=L^perp$.
  ]

  Which by the proof in #text(weight: "bold")[Lemma 2] in particular, let ${u_1,...,u_n}$ denotes an orthonormal basis of $L$, then ${J(u_1),...,J(u_n)}$ actually forms an orthonormal basis (since $J$ swaps entry only when fixing standard basis, which preserves the norm; while $J^T=J^(-1)$, hence $(J u_i) dot (J u_j) = (u_i^T J^T)(J u_j) = u_i^T u_j = u_i dot u_j=0$ for all $i!=j$). Hence, ${u_1,...,u_n, J u_1,...,J u_n}$ in fact forms an orthonormal basis of $RR^(2n)$ (since $u_1,..,u_n in L$, while $J u_1,...,J u_n in J L=L^perp$ by #text(weight: "bold")[Lemma 2]).

  \ 

  Now, consider the matrix $T in GL(n,RR)$ satisfying $T(e_i)=u_i$ and $T(f_i)=-J u_i$, we claim that $T in Sp(n,RR)$: To prove that $T$ preserves symplectic form, it suffices to show it preserves the form's relation on the standard basis (since the rest follows by decomposing the form to the evaluation on pairs of basis elements, using linearity of $T$ and bilinearity of $w$). Given any $e_i,e_j$ we have $w(e_i,e_j)=0$, which $w(T(e_i),T(e_j)) = w(u_i,u_j)=0$ also (since $u_i,u_j$ are chosen to be basis elements of Lagrangian $L$). Similarly, any $f_i,f_j$ satisfies $w(T(f_i),T(f_j))=w(-J u_i,-J u_j)=0$ (since they're basis elements of $J L = L^perp$, the complement Lagrangian or $L$). Also, given any $e_i, f_i$ we have $w(T(e_i), T(f_i))=w(u_i,-J u_i)=u_i^T J (-J u_i) =  u_i dot u_i = 1 = e_i dot e_i = e_i^T J(-J e_i) = w(e_i,f_i)$ (since $J(e_i)=-f_i$, and $u_i$ is chosen to be normalized). Finally, we also have $e_i,f_j$ satisfies $w(T(e_i),T(f_j))=w(u_i,-J u_j) = u_i^T J(-J u_j) = u_i^T u_j = u_i dot u_j=0 = e_i dot e_j = e_i^T J(-J e_j)= w(e_i,f_j)$ (give $i!=j$). Hence, $T$ indeed preserves the symplectic form between any two pairs of the standard basis elements, hence $T in Sp(n,RR)$.

  Finally, since $L = span{u_1,..,u_n} = span{T(e_1),...,T(e_n)}$, then we have $T(L^((0)))=L$ as Lagrangian subspace, which shows that the natural action $Sp(n,RR) arrow.cw.half L_n$ by $T dot L = T L$ is transitive (Note: if $T in Sp(n,RR)$, then for all $x,y in L$, we have $w(T(x),T(y))=w(x,y)=0$, henc $T L$ is also Lagrangian).

  \ 

  #text(weight: "bold")[2. Dimension of Space of Lagrangian:]

  Here, we'll fix $L^((0)) = span{e_1,...,e_n}$ and compute its stabilizer (Note: we also have $J L^((0))=span{f_1,...,f_n}$, with ${e_1,...,e_n,f_1,...,f_n}$ being standard basis on $RR^(2n)$). 
  
  Given any $T in G_(L^((0)))$, since $T(L^((0)))=L^((0))$, then with $T=mat(A,B;C,D)$ for some $A,B,C,D in M_n(RR)$, we must have $C=0$ (since $T(e_i) in span{e_1,...,e_n}$). Then using the properties of symplectic matrix, we have:
  $ A^T C=C^T A = 0, quad B^T D= D^T B, quad A^T D- C^T B = A^T D = id_n $
  Hence, fixing any $A in GL(n,RR)$, we automatically has $D = (A^T)^(-1) = (A^(-1))^T$ and $B^T=D^T B D^(-1) = A^(-1) B A^T$.

  Notice that the correspondance for $B$ above actually is encoding $n(n-1)/2$ equations (since $T$ must preserve Lagrangian, then in particular it also preserves $T(J L^((0)))$ as Lagrangian, where $J L^((0))=span{f_1,...,f_n}$), hence the last $n$ column vectors of $T$ (which is formed by entries of $B,D$) must pairwise satisfy symplectic form being $0$, showing that $B in M_n (RR)$ (with $n^2$ entries) actually has a solution space of $n^2-n(n-1)/2 = n(n+1)/2$ dimension (Note: The collection of $B$ with the above properties form a subspace in $M_n (RR)$ of $n(n-1)/2$ non-degenerate linear equations).

  Hence, $G_(L^((0)))$ can be identified using $A in GL(n,RR)$ and its corresponding solution space for $B$ (denoted as $V_A subset.eq M_n (RR)$), which $dim(G_(e_1)) = dim(GL(n,RR)) + dim(V_A)= n^2 + n(n+1)/2$.

  Finally, since $L_n tilde.equiv Sp(n,RR)\/G_(L^((0)))$ based on the group action, then since $Sp(n,RR)$ has dimension $2n^2+n$, we have the following:
  $ dim(L_n) = dim(Sp(n,RR)) - dim(G_(L^((0)))) = 2n^2+n - n^2-n(n+1)/2 = n(n-1)/2 $
]

#pagebreak()

#set enum(numbering: "(1)")
= D//4
#problem[
  Etingof Problem Set 2.16:

  + Show that $Sp(1) tilde.equiv SU(2) tilde.equiv S^3$.
  + Using the previous exercise (2.15), show that we have a natural transitive action of $Sp(n)$ on the sphere $S^(4n-1)$ and a stabilizer of a point is isomorphic to $Sp(n-1)$.
  + Deduce that $pi_1(Sp(n+1))=pi_1(Sp(n))$, $pi_0(Sp(n+1))=pi_0(Sp(n))$.
][
  
  + Given that $Sp(1) := Sp(1,CC) sect SU(2)$, it suffices to prove that $SU(2) subset.eq Sp(1,CC)$. Recall that any $A in SU(2)$ can be expressed as $A=mat(a,b;-overline(b),overline(a))$ where $|a|^2+|b|^2=1$. Then, consider the symplectic matrix, we get:
    $ A^T J A = mat(a,-overline(b);b,overline(a))mat(0,1;-1,0)mat(a,b;-overline(b),overline(a))=mat(0,1;-1,0) $
    Hence, $A in Sp(1,CC)$, showing that $SU(2) subset.eq Sp(1,CC)$, or $SU(1)=Sp(1,CC) sect SU(2)=SU(2)$. As a consequence, $Sp(1)=SU(2) tilde.equiv S^3$.

    \ 
  + Notice that $S^(4n-1)$ can be identified as all normal vectors in $RR^(4n)$, which can be reclassified as $HH^n$. Hence, since $U(n,HH)$ has a natural transitive action on $S^(4n-1)$, while $U(n,HH) tilde.equiv Sp(n):= Sp(n,CC) sect SU(2n)$, there is a natural transitive action of $Sp(n)$ on $S^(4n-1)$.

    Then, let $RR^(4n)$ be identified as $CC^(2n)$ with standard basis ${e_1,...,e_n,f_1,...,f_n}$. If we consider the action of $Sp(n)$ on $S^(4n-1)$ and consider the stabilizer of $e_1$ (denote as $G_(e_1)$).

    For $n=1$ one has the stabilizer being $A = mat(1,b;0,d) in G_(e_1) subset.eq Sp(1)=SU(2)$, which $d = overline(1)=1$ and $b=-overline(0)=0$, so $A = id_2$.

    Now, for $n>=2$, suppose $A in G_(e_1)$, then express in matrix form (using standard basis) the first column vector is $e_1=mat(1;0;dots.v;0)$. Notice for the specific case $f_1$, because $w(e_1,f_1)=1$ (Since $J(f_1)=e_1$), while symplectic matrix preserves it, then we have $w(A(e_1),A(f_1)) = w(e_1, A(f_1))$. Let $A(f_1)=a_((n+1)1)e_1+...+a_n\((n+1)n)e_n+a_((n+1)(n+1))f_1+...+a_((n+1)(2n))f_n$, we have $w(e_1,A(f_1)) = a_((n+1)(n+1))$ (since symplectic form $J$ swaps the first $n$ entries with the last $n$ entries, while providing a negative sign for the moved first $n$ entries), hence $a((n+1)(n+1))=1$. Also, recall that $Sp(n) subset.eq SU(2n)$, then every column vector must itself be normalized. So, with the $(n+1)^upright(t h)$ column vector (i.e. $A(f_1)$) having the $(n+1)^upright(t h)$ entry being $1$, the other entry is enforced to be $0$. Hence, we get that $A(f_1)=f_1$ by appealing to the matrix form of $A$. Which, there exists $A',B',C',D' in M_((n-1))(CC)$ satisfying the following:
    $ A = mat(1,0,0,0;0,A',0,B';0,0,1,0;0,C',0,D') $
    Since the original column vectors in $A$ (involving $A',B',C',D'$) forms an orthonormal list, after truncating the two entries involving $0$, they still form an orthonormal list, so we have $mat(A',B';C',D') in U(2n-2)$. Then, by the claim that it is special unitary, we have $det(A)=1 dot det mat(A',0,B';0,1,0;C',0,D') = 1 dot det mat(A',B';C',D')=1$, hence we also have $A in SU(2n-2)$. Finally, since $A$ is symplectic, it satisfies the following three relations:
    $ mat(0,0;0,(A')^T C)=mat(1,0;0,A')^T mat(0,0;0,C') = mat(0,0;0,C')^T mat(1,0;0,A') =mat((C')^T A)  $
    $ mat(0,0;0,(B')^T D) mat(0,0;0,B')^T mat(1,0;0,D')=mat(1,0;0,D')^T mat(0,0;0,B')=mat(0,0;0,(D')^T B) $
    $ id_(n)=mat(1,0;0,A')^T mat(1,0;0,D')-mat(0,0;0,C')^T mat(0,0;0,B') = mat(1,0;0,(A')^T D'-(C')^T B') $
    So, we get $(A')^T C' = (C')^T A'$, $(B')^T D'=(D')^T B'$, and $(A')^T D'-(C')^T B' = id_(n-1)$, showing that $mat(A',B';C',D') in Sp(n-1,CC)$. Hence, $mat(A',B';C',D') in Sp(n-1) = Sp(n-1,CC) sect SU(2n-2)$.

    Hence, this creates an injection $G_(e_1) arrow.r.hook Sp(n-1)$ by mapping $A=mat(1,0,0,0;0,A',0,B';0,0,1,0;0,C',0,D') mapsto mat(A',B';C',D')$ (and it's a group homomorphism also). Also, every $T' in Sp(n-1)$ after decomposing into four pieces of $(n-1) times (n-1)$ block matrices (say $T' = mat(A',B';C',D')$) and plug into the desired positions shown above (say $mat(1,0,0,0;0,A',0,B';0,0,1,0;0,C',0,D')$), we also recover something contained in $G_(e_1)$, which creates a mutual inverse. Hence, $G_(e_1) tilde.equiv Sp(n-1)$ as groups, and we get the following:
    $ S^(4n-1)=Orb(e_1)tilde.equiv Sp(n)\/G_(e_1) tilde.equiv Sp(n)\/Sp(n-1) $
    Where the middle part is appealing to homogeneous space theory.

    \ 

  + From the previous part we've deduce that as homogeneous space, $S^(4n-1)tilde.equiv Sp(n)\/Sp(n-1)$. For $Sp(1)=SU(2) tilde.equiv S^3$ (by (1)), we have $Sp(1)$ being simply-connected. Now, by induction suppose $Sp(n)$ is connected ($pi_0(Sp(n))={*}$), then using #text(weight: "bold")[Corollary 4.2] in Etingof's Notes, we have $pi_0(Sp(n+1))=pi_0(Sp(n+1)\/Sp(n)) = pi_0(S^(4n+3)) = {*}$, hence $Sp(n+1)$ is also connected.

    Then, also by induction assume that $Sp(n)$ is simlpy-connected, using the connectedness and #text(weight: "bold")[Corollary 4.2] again, we have the following long exact sequence:
    $ pi_2(Sp(n+1)\/Sp(n)) arrow.r pi_1(Sp(n)) arrow.r pi_1(Sp(n+1)) arrow.r pi_1(Sp(n+1)\/Sp(n)) arrow.r {e} $
    Since $Sp(n+1)\/Sp(n) tilde.equiv S^(4n+3)$, we have $pi_2(S^(4n+3))=pi_1(S^(4n+3))={e}$, hence the above exact sequence reduces to the following:
    $ {e} arrow.r pi_1(Sp(n)) arrow.r pi_1(Sp(n+1)) arrow.r {e} $
    This shows that $pi_1(Sp(n)) tilde.equiv pi_1(Sp(n+1))$. As a consequence, $Sp(n)$ is simply-connected implies $Sp(n+1)$ is also simply-connected.
]