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
  title: "Math 220A Practice Midterm",
  authors: ("Zih-Yu Hsieh",),
  date: datetime.today().display("[month repr:long] [day], [year]"),
)

= D//1
#problem[
  Show that all finite $p$-groups are solvable.
][
  Given $G$ a $p$-group, with $|G|=p^n$ for some $n in NN$, we'll proceed by induction on the power $n$.

  \ 

  First, for $n=1$, since $|G|=p$ implies that $G$ is cyclice, hence abelian, which is trivially solvable.

  \ 

  Now, suppose for $k<n$, all $p$-group with order $p^k$ is solvable. To show that for $|G|=p^n$ implies $G$ is solvable, there are several observations:

  1. #text(weight: "bold")[$G$ has Nontrivial center:]

    If consider the conjugation action of $G$ on itself, then based on the class equation, one has the following:
    $ |G|=|Z(G)| + sum_(i in I)|Conj(g_i)| $
    where $Z(G)$ denotes the center of $G$ (which every of them has singleton conjugation class, due to the fact that the elements are central), and each $i in I$ corresponds to a $g_i$ with distinct nontrivial conjugation class $Conj(g_i)$. Then, since $|G| = p^n$, the left side is divisible by $p$; also, on the right side, since $|Conj(g_i)| < |G|$, and by orbit stabilizer theorem one has each $|Conj(g_i)|$ divides $|G|=p^n$. Then, with $|Conj(g_i)|!=1$ (due to the fact that $Conj(g_i)$ is non-singleton), one must have $|Conj(g_i)|=p^l$ for some positive integer $l<n$, so the sum $sum_(i in I)|Conj(g_i)|$ is divisible by $p$ also (since each $|Conj(g_i)|$ is divisible by $p$). As a result, $|Z(G)| = |G|-sum_(i in I)|Conj(g_i)|$ is divisible by $p$, hence $Z(G)!={e}$.

    As a result, one has $|Z(G)|=k$ for some positive integer $k<n$, which the quotient group $G\/Z(G)$ has order $|G|/|Z(G)| = p^(n-k)$ with $0<n-k<n$, hence $G\/Z(G)$ is a $p$-group with power $n-k<n$, which is solvable. Hence, there exists the following chain of abelian tower:
    $ {1} = K'_0 < K'_1 < ... < K'_s = G\/Z(G), quad K'_i \/ K'_(i-1) "is abelian" $

    \ 

  2. #text(weight: "bold")[Abelian Tower pulls back to an abelian tower:]

    Given projection$pi:G ->> G\/Z(G)$, suppose $N' <= M' <= G\/Z(G)$ are subgroups satisfying $N' lt.tri.eq M'$, then let $N:=pi^(-1)(N')$ and $M:= pi^(-1)(M')$, it's clear that $N <= M$, with $pi(N) = N'$ and $pi(M)=M'$, due to surjectivity of $pi$.

    Now, we claim that $N lt.tri.eq M$, and $M\/N tilde.equiv M'\/N'$: If consider the projection restricting to $M$, then $pi:M ->> M'$; now, if consider a further projection $phi:M' ->> M'\/N'$, then the composition $phi compose pi:M ->> M'\/N'$ has kernel characterized by $ker(phi compose pi) = N$ (since $n in ker(phi compose pi)$ iff $phi(pi(n)) = 0$ iff $pi(n) in N'$ iff $n in pi^(-1)(N')=N$), hence this shows that $N lt.tri.eq M$, moreover by First Isomorphism Theormem, since $phi compose pi$ is surjective, one also has $M'\/N' tilde.equiv M\/N$.

  As a result, since ${1}=K'_0<...<K'_s = G\/Z(G)$ is an abelian tower, for each index $i$, let $K_i := pi^(-1)(K'_i)$, then one has the following tower (Note that $pi^(-1)({1}) = Z(G)$):
  $ Z(G) =  K_0 < ... < K_s = G $
  And, for each index $i$, one has $K_i\/K_(i-1) tilde.equiv K'_i\/K'_(i-1)$ based on statement in 2. So, with each $K'_i\/K'_(i-1)$ being abelian, $Z(G)=K_0 < ... < K_s = G$ forms a chain of subgroups, with each consecutive quotient being abelian.

  Finally, since $Z(G)$ is abelian, concatinating ${1}$ the trivial group at the end completes an abelian tower, hence showing that $G$ is solvable. And, this completes the induction.
]

\ 

= D//2
#problem[
  Find all conjugacy classes of $S_3$, $S_4$, and $D_8$.
][
  First, for $S_3$ and $S_4$, there is a small lemma to use:
  #lemma[
    Given $S_n$, two elements are in the same conjugacy class, iff they have the same cycle type (or, if their disjoint cycle decomposition have the same collection of lengths).

    Note: For instance, in $S_5$ both $(1)(234)(5)$ and $(2)(4)(135)$ both has cycle type $1,1,3$. Which, the number of cycle types for $S_n$ is determined by the ways of partitioning $n$ into positive integers.
  ][

    $==>:$ First, suppose $sigma, gamma in S_n$ are conjugates of each other, say $sigma = tau gamma tau^(-1)$ for some $tau in S_n$. Then, let $gamma = (a^1_1 ... a^1_(k_1))...(a^l_1...a^l_(k_l))$ be the disjoint cycle decomposition of $gamma$ (where the $a^i_j$ runs through all elements in ${1,...,n}$ to include all cycles in $gamma$). Then, notice that the conjugation of each cycle in $gamma$ based on $tau$ has the following property:
    $ forall i in {1,...,n}, quad tau compose (a^j_1...a^j_(k_j))tau^(-1) dot i = cases(
      i quad i in.not {tau^(-1) dot a^j_1,...,tau^(-1) dot a^j_(k_j)}, 
      tau(a^j_(r+1))  quad i = tau^(-1)(a^j_r)
    ) $
    Where, if $r=k_j$, then $a^j_(r+1):= a^j_1$. So this concludes that $tau compose (a^j_1...a^j_(k_j)) tau^(-1) = (tau(a^j_1)...tau(a^j_(k_j)))$, as a $k_j$-cycle.

    As a result, we have the following:
    $ sigma &= tau gamma tau^(-1) = (tau (a^1_1...a^1_(k_1))tau^(-1))...(tau (a^l_1...a^l_(k_.))tau^(-1))\ 
    &= (tau(a^1_1)...tau(a^1_(k_1)))...(tau(a^l_1)...tau(a^l_(k_l))) $
    Since $tau$ is a bijection on ${1,...,n}$, then it sends each disjoint cycles to another disjoint cycles with the same length, so $sigma$ has the same cycle type as $gamma$.

    \ 

    $<==:$ Suppose $sigma, gamma in S_n$ have the same cycle type, say under disjoint cycle decomposition, we have the following:
    $ gamma = (a^1_1...a^1_(k_1))...(a^l_1...a^l_(k_l)), quad sigma = (b^1_1...b^1_(k_1))...(b^l_1...b^l_(k_l)) $
    Then, each given that $i!=i'$ or $j!=j'$, one has $a^i_j != a^(i')_(j')$ and $b^i_j != b^(i')_(j')$, and each $a^i_j$, $b^i_j$ runs through all elements in ${1,...,n}$.

    Now, define a map $tau:{1,...,n} -> {1,...,n}$ by $tau(a^i_j)=b^i_j$. Then, $tau$ forms a bijection (since each $b^i_j$ corresponds to a unique preimage, namely $a^i_j$). And, for each cycle in $gamma$ above, it satisfies the following:
    $ tau (a^i_1...a^i_(k_i)) tau^(-1) = (tau(a^i_1)...tau(a^i_(k_i))) = (b^i_1...b^i_(k_i)) $
    Hence, under conjugation of $tau$, one has the following:
    $ tau gamma tau^(-1) &= (tau(a^1_1...a^1_(k_1))tau^(-1))...(tau(a^l_1...a^l_(k_l))tau^(-1))\ 
    &= (tau(a^1_1)...tau(a^1_(k_1)))...(tau(a^l_1)...tau(a^l_(k_l)))\ 
    &= (b^1_1...b^1_(k_1))...(b^l_1...b^l_(k_l)) = sigma $
    Hence, $gamma, sigma$ are in the same conjugacy class.
  ]
  As a result, if one can find all methods of partition $n$  into positive integers, it uniquely determines all cycle types.

  1. For $S_3$, since $3=1+1+1=1+2=3$ (the only three ways of partition $3$), then it corresponds to conjugacy class $C_(1,1,1) = {e}$ (since it's the only permutation with three $1$-cycles), $C_(1,2) = {(12),(13),(23)}$ (since they all have one $2$-cycle, and another $1$-cycle / fixing $1$ element), and $C_3 = {(123),(132)}$ (all the $3$-cycles).

  \  

  2. For $S_4$, since $4=1+1+1+1=1+1+2=2+2=1+3=4$ (the only five ways of partition $4$), then it corresponds to conjugacy class $C_(1,1,1,1)={e}$ (the only permutation with four $1$-cycles), $C_(1,1,2) = {(12),(13),(14),(23),(24),(34)}$ (all permutation with one $2$-cycles, and fixing two elements / two $1$-cycles), $C_(2,2) = {(12)(34),(13)(24),(14)(23)}$ (all permutations with two disjoint $2$-cycles), $C_(1,3) = {(123),(132),(124),(142),(134),(143),(234),(243)}$ (all $3$-cycles, while fixing $1$ elements), and $C_4 = {(1234),(1243),(1324),(1342),(1423),(1432)}$ (all $4$-cycles).

  \ 

  3. For dihedral group $D_8$, since it's generated by rotation $sigma$ and a reflection $tau$, that satisfy $sigma^4 = tau^2 = e$, and $tau sigma = sigma^3 tau$. Then, $D_8 = {e,sigma,sigma^2,sigma^3,tau, tau sigma, tau sigma^2, tau sigma^3}$. Also, there are the following:
    - First, since $sigma dot sigma^2 = sigma^2 dot sigma$ by definition, and $tau sigma^2 = sigma^3 tau sigma = sigma^3 dot sigma^3 tau = sigma^2 tau$, then $sigma^2$ commutes with all generators, hence is central. So, besides $C_1 = {e}$, $C_2 = {sigma^2}$ is another singleton conjugacy class.
    - Since $tau sigma = sigma^3 tau$, then $tau sigma tau^(-1) = sigma^3$, so ${sigma, sigma^3}$ are contained in the same conjugacy class. Also, $sigma dot sigma dot sigma^(-1) = sigma$, this shows that $C_3 = {sigma, sigma^3}$ forms a conjugacy class (since under finite conjugation of $tau$ and $sigma$, it still stays in $C_3$).
    - Since $tau (tau sigma^3) tau^(-1) = sigma^3 tau = tau sigma$, so ${tau sigma, tau sigma^3}$ are contaiend in the same conjugacy class. Also, $sigma (tau sigma^3) sigma^(-1) = sigma (tau sigma^3) sigma^3 = sigma tau sigma^2 = sigma dot sigma^2 tau = sigma^3 tau = tau sigma$, showing $C_4 = {tau sigma, tau sigma^3}$ does form a conjugacy class (since under finite conjugation of $tau$ and $sigma$, it still stays in $C_4$, so it's invariant under $D_8$ conjugation action).
    - Since $sigma (tau sigma^2) sigma^(-1) = sigma tau sigma = sigma dot sigma^3 tau = tau$, then ${tau, tau sigma^2}$ are contained in the same conjugacy class. Also, $tau (tau sigma^2) tau^(-1) = sigma^2 tau = tau sigma^2$, showing $C_5 = {tau, tau sigma^2}$ does form a conjugacy class (since under finite conjugation of $tau$ and $sigma$, it still stays in $C_5$, so it's stable under conjugation of $D_8$).
  
  \ 

  Which, one can count that the above classes for each groups does contain all possible elements, hence must be all the conjugacy classes.
]

\ 

= ND//3
#problem[
  Let $R$ be a ring and $S$ be an $R$-algebra. Show that the functor from the category of $R$-algebras to itself given by $tensor_R S$ is left adjoint to the $Hom_R(S,\_)$. Conclude that tensor product preserves surjections and the Hom functor preserves injections. Given an example when tensor fails to preserve injectivity.
][

]

\ 

= D//4
#problem[
  Let $V$ and $W$ be two (finite dimensional) representations of a finite group $G$ over $k$. Show that the representations $Hom_k(V,W)$ is isomorphic to the tensor representation $V^or tensor_k W$.
][
  First, we'll show that they're isomorphic as vector spaces: Recall that $dim k = 1$ (as $k$-vector space), $dim V^or = dim V$ (under finite dimensional case), and $dim Hom_k(V,U) = (dim V) dot (dim U)$ for any finite dimensional $k$-vector space $V,U$. Then, using the natural isomorphism $Hom_(k)(V^or tensor_k W, k) tilde.equiv Hom_(k)(V^or, Hom_(k)(W,k))$ (based on the adjunction of $tensor_(k) W$ and $Hom_(k)(W,\_)$ functors), we have the following:
  $ dim V^or tensor_k W &= dim Hom_(k)(V^or tensor_(k)W, k)\ 
  &= dim Hom_(k)(V^or, Hom_(k)(W,k))\ 
  &= (dim V^or) dot (dim Hom_(k)(W,k))\ 
  &- (dim V) dot ((dim W) dot (dim k))\ 
  &= (dim V) dot (dim W)\ 
  &= dim Hom_(k)(V,W) $
  Since the dimension matches up, the two are isomorphic $k$-vector spaces.

  \ 

  Now, consider the map $B:V^or times W -> Hom_(k)(V,W)$, by $B(phi,w) = T_(phi,w)$, where for all $v in V$, one has $T_(phi,w) = phi(v) dot w in W$ (since $phi in V^or$, so $phi(v) in k$). Which, the map $B$ is well-defined, since $T_(phi,w):V -> W$ is linear (given any $a,b in k$ and $v,u in V$, we have $T_(phi,w)(a v+b u) = phi(a v+b u)w = a dot (phi(v)w)+b dot (phi(u) w) = a dot T_(phi,w)(v)+b dot T_(phi,w)(u)$).

  Also, notice that $B$ is bilinear: given any $a,b in k$, $phi,phi.alt in V^or$,and $w,z in W$, we have the following (for all $v in V$):
  $ B(a phi+b phi.alt, w) = T, quad T(v) &= (a phi+b phi.alt)(v) dot w = (a dot phi(v)+b dot phi.alt(v)) dot w\ 
  &= a dot (phi(v) w) + b dot (phi.alt(v) w) = a dot T_(phi,w)(v)+b dot T_(phi.alt,w)(v) \  
  &= a dot B(phi,w)(v) + b dot B(phi.alt,w)(v) $
  $ B(phi,a w+b z) = S, quad S(v) &= phi(v) (a w+b z) = a dot (phi(v) w)+ b dot (phi(v) z)\ 
  &= a dot T_(phi,w)(v) + b dot T_(phi,z)(v) - a dot B(phi,w)(v) + b dot B(phi,z)(v) $
  Which, $B(a phi+b phi.alt,w) = a dot B(phi,w)+b dot B(phi.alt,w)$, and $B(phi,a w+b z)= a dot B(phi,w)+b dot B(phi,z)$, showing $B$ is bilinear.

  Then, using the universality of tensor product, this uniquely factors to a linear map $overline(B):V^or tensor_k W -> Hom_(k)(V,W)$.

  \ 

  Finally, we claim that $overline(B)$ is an isomorphism, and also a morphism of $G$-representations, which implies that $overline(B)$ is an isomorphism as morphism of $G$-representations.

  1. Since the domain and codomain of $overline(B)$ have the same (finite) dimension, to show it's an isomorphism of vector spaces, it suffices to show surjectivity. 

    Fix a basis $v_1,...,v_n in V$, and $w_1,...,w_m in W$ (say $n = dim V$, $m = dim W$). Define the linear map $D_(i j):V -> W$ by $D_(i j)(v_l) = delta_(j l) w_i$ (where $delta_(j l)$ is the Kronecker delta). Then, for all $T in Hom_(k)(V,W)$, given $T(v_l) = sum_(i=1)^m a_(i l)w_i$ for all $l in {1,...,n}$, notice that the linear map $T_1 = sum_(i=1)^m sum_(j=1)^n a_(i j) D_(i j)$ satisfies the following:
    $ forall l in {1,...,n}, quad T_1(v_l)&=sum_(i=1)^m sum_(j=1)^n a_(i j)D_(i j)(v_l) = sum_(i=1)^m sum_(j=1)^n a_(i j) delta_(j l)w_i\ 
    &= sum_(i=1)^m a_(i l)w_i = T(v_l) $
    So, since $T,T_1$ acts on the given basis $v_1,...,v_n in V$ identically, $T=T_1$. Hence, $Hom_(k)(V,W) = span{D_(i j)}_(1<=i<=m\ 1<=j<=n)$.

    Now, let $phi_1,...,phi_n in V^or$ denotes the corresponding dual basis of $v_1,....,v_n in V$ (i.e. $phi_(j)(v_l) = delta_(j l)$), then notice that $overline(B)(phi_j, w_i) = T_(phi_j, w_i)$ satisfies the following, for any $l in {1,...,n}$:
    $ T_(phi_j, w_i)(v_l) = phi_j(v_l)w_i = delta_(j l)w_i = D_(i j)(v_l) $
    Hence, $T_(phi_j, w_i)$ and $D_(i j)$ acts on the given basis of $V$ identically, showing $overline(B)(phi_j,w_i) = T_(phi_j,w_i)=D_(i j)$. So, $overline(B)$ has image containing $span{D_(i j)}_(1<=i<=m\ 1<=j<=n) = Hom_(k)(V,W)$, showing $overline(B)$ is surjective, hence an isomorphism.

    \ 

  2. $overline(B)$ is a morphism of $G$-represention: Let $rho_V, rho_W$ denotes the representation of $G$ with $V,W$ respectively, and, let $rho_tensor$ denotes the representation of $G$ with $V^or tensor_k W$, while $rho_H$ denotes the representation of $G$ with $Hom_(k)(V,W)$. Then, for all $g in G$, for all $phi in V^or$, $w in W$, and $T in Hom_(k)(V,W)$ we have the following action:
  $ rho_(tensor)(g) dot (phi tensor w) = (phi compose rho_V(g)^(-1)) tensor (rho_W(g) dot w), quad rho_H(g) dot T = rho_W (g) compose T compose rho_ V(g)^(-1) $
  Then, notice that under $overline(B)$, one has the following:
  $ &overline(B)(rho_(tensor)(g) dot (phi tensor w)) = overline(B)((phi compose rho_(V)(g)^(-1)) tensor (rho_(W)(g) dot w)) = T \  
  &==> forall v in V, quad T(v) = (phi compose rho_(V)(g)^(-1) dot v) rho_(W)(g)(w) $
  $ overline(B)(phi tensor w)=T_(phi,w) ==> forall v in V, quad (rho_(H)(g) dot T_(phi,w))(v) &= rho_(W)(g) compose T_(phi,w) compose rho_(V)(g)^(-1)(v)\ 
  &= rho_(W)(g) (phi(rho_(V)(g)^(-1) dot v) w)\ 
  &= phi(rho_(V)(g)^(-1) dot v) rho_(W)(g)(w)\ 
  &= T(v) $
  So, we can conclude that $rho_(H)(g) dot overline(B)(phi tensor w) = overline(B)(rho_(tensor)(g) dot (phi tensor w))$, showing $overline(B)$ is a homomorphism of $G$-representations.

  So, this concludes that $V^or tensor_k W tilde.equiv Hom_(k)(V,W)$ as $G$-representations.
]

\ 

= D//5
#problem[
  Show that if two representations $V$ and $W$ have characters $chi_1, chi_2$ respectively, then the chraacter of the tensor representation of $V$ and $W$ is given by $chi_1 chi_2$.
][
  Here, fix a basis $v_1,...,v_n in V$ and $w_1,...,w_m in W$ (assume both are finite dimensional). Then, $V tensor_k W$ have a basis ${v_j tensor w_l}_(1<=j<=n\ 1<=l<=m)$.

  Which, Let $rho_(V), rho_(W)$ denote the representation of $G$ over $V,W$ respectively. Let $cal(M)(rho_(V)(g)) = (a_(i j))_(1<=i,j<=n)$, and $cal(M)(rho_(W)(g))=(b_(k l))_(1<=k,l<=m)$ under the given bases of $V,W$ respectively. Then, one has $rho_(V)(g)(v_(j)) = sum_(i=1)^n a_(i j)v_i$, and $rho_(W)(g)(w_l) = sum_(k=1)^m b_(k l)w_k$. 

  Now, let $rho$ denotes the tensor representation of $G$ over $V tensor_k W$, then notice that its action on each basis of the tensor product is as follow:
  $ rho(g)(v_j tensor w_l) &= (rho_(V)(g)(v_j)) tensor (rho_(W)(g)(w_l)) = (sum_(i=1)^n a_(i j)v_i) tensor (sum_(k=1)^m b_(k l)w_k)\ 
  &= sum_(i=1)^n sum_(k=1)^m a_(i j)b_(k l)(v_i tensor w_k) $
  So, the componeent of $v_j tensor w_l$ after the action of $g$, is given by the component $i=j$ and $k=l$, which has coefficient $a_(j j)b_(l l)$.

  Finally, if express $rho(g)$ in the basis ${v_j tensor w_l}_(1<=j<=n\ 1<=l<=m)$, then the diagonal entries are given by all the $v_j tensor w_l$-component of $rho(g)(v_j tensor w_l)$, which are all $a_(j j)b_(l l)$, where $1<=j<=n$ and $1<=l<=m$. So, we get the following:
  $ tr(rho(g)) = sum_(j=1)^n sum_(l=1)^m a_(j j) b_(l l) = (sum_(j=1)^n a_(j j))(sum_(l=1)^m b_(l l)) = tr(rho_(V)(g)) dot tr(rho_(W)(g)) = chi_1(g) dot chi_2(g) $
  So, this indicates that the character of the tensor representation $V tensor_k W$ is given by $chi_1 chi_2$.
]
\ 

= ND//6
#problem[
  Let $V$ be a representation of $G$. Let $W subset V tensor V$ be the subspace of the tensor product $V tensor V$ generated by vectors of the form $x tensor y+y tensor x$.
  1. Show that $W$ is a subrepresentation.
  2. Suppose that $V$ has dimension $d$, what is the dimension of $W$?
  3. Let $chi$ denote the character of $V$, what is the character of $W$?
][
  1. Let $rho_V$ denotes the representation of $G$ over $V$, and $rho$ denotes the tensor representation of $G$ over $V tensor V$. Then, for all $x,y in V$, and $g in G$, the action is given as follow:
    $ rho(g)(x tensor y)=(rho_(V)(g)(x)) tensor (rho_(V)(g)(y)) $
    Hence, for the generators $x tensor y+y tensor x in W$, the action is as follow:
    $ rho(g)(x tensor y+y tensor x) &= rho(g)(x tensor y)+rho(g)(y tensor x)\ 
    &= (rho_(V)(g)(x)) tensor (rho_(V)(g)(y)) + (rho_(V)(g)(y)) tensor (rho_(V)(g)(x)) in W $
    This shows that $W$ is invariant under $rho(g)$ (since all generators are still contained in $W$ after $rho(g)$ acts on it), hence $W$ forms a subrepresentation of $V tensor V$.

    \ 

  2. (Here, we'll assume $Char(k)!=2$). Let $v_1,...,v_d in V$ be a basis of $V$. We'll claim that $dim W = d(d+1)/2$, by proving that the list ${v_i tensor v_j+v_j tensor v_i}_(1<=i<=j<=d) subset W$ form a basis of $W$ Z(Note: for all $j in {1,...,d}$, there are $j$ indices satisfy $i<=j$, which the length of the list is $sum_(j=1)^d j = d(d+1)/2$, which is the length of the list).

    First, for all $x,y in V$, it can be uniquely written as $x=sum_(i=1)^n a_i v_i$ and $y=sum_(j=1)^n b_j v_j$, hence we have the following:
    $ x tensor y+y tensor x &= (sum_(i=1)^n a_i v_i) tensor (sum_(j=1)^n b_j v_j)=(sum_(j=1)^n b_j v_j) tensor (sum_(i=1)^n a_i v_i)\ 
    &= sum_(i=1)^n sum_(j=1)^n a_i b_j (v_i tensor v_j)+ sum_(i=1)^n sum_(j=1)^n a_i b_j (v_j tensor v_i)\ 
    &= sum_(i=1)^n sum_(j=1)^n a_i b_j(v_i tensor v_j+v_j tensor v_i) $
    If $i>j$, one can use $v_j tensor v_i + v_i tensor v_j$, then with $i'=j$ and $j'=i$, now the element becomes $v_(i') tensor v_(j')+v_(j') tensor v_(i')$, with $i'<j'$. Hence, this shows that $x tensor y+y tensor x in span{v_i tensor v_j + v_j tensor v_i}_(i<=j)$, or $W= span{v_i tensor v_j+v_j tensor v_i}_(i <=j)$.

    Then, to show linear independence, suppose $sum_(i<=j)a_(i j)(v_i tensor v_j+v_j tensor v_i)=0$, notice that if $i<=j$, the coefficient of $v_i tensor v_j$ is $a_(i j)$, while if $i>j$, the coefficient of $v_i tensor v_j$ is $a_(j i)$. Then, based on linear independence of the list ${v_i tensor v_j}_(1<=i,j<=n) subset V tensor V$, it enforces each $a_(i j), a_(j i)=0$. This shows the linear independence of the list.

    Hence, we can conclude that $dim W=d(d+1)/2$, with a convenient basis ${v_i tensor v_j+v_j tensor v_i}_(i<=j)$.

    \ 

  3. Let $chi$ denotes the character of $V$, then the character of $V tensor V$ is $chi^2$. Here, WLOG one can assume that $k=overline(k)$ (the reason is if we're simply computing the trace, one can embed $GL_(d)(k) arrow.hook GL_(d)(overline(k))$, which is possible to find an upper-triangular form in $GL_(d)(overline(k))$ and make our life easier for computation, but still leave the trace invariant after the embedding).

    For each $g in G$, 
]

\ 

= D//7
#problem[
  Determine all (isomorphism classes of) irreducible representations of $S_3$ and $D_8$.
][
  First, we'll recall that for a finite group $G$ with its representations over $CC$-vector spaces, if $(V_1,rho_1),...,(V_k,rho_k)$ are mutually non-isomorphic irreducible representations of $G$, then with $d_i:- dim V_i$ for each index $i$, one has $|G|=sum_(i=1)^k d_i^2$; also, $k=$ number of conjugacy classes in $G$. 

  \ 

  1. For $S_3$, since $|S_3|=6$, and in #text(weight: "bold")[Problem 2] we've computed all conjugacy classes: $C_(1,1,1)={e}, C_(1,2)={(12),(13),(23)},$ and $C_3 = {(123),(132)}$. Then, the only way of partition $6$ into three perfect squares, is $6=1+1+2^2$, this indicates that $S_3$ has two $1$-dimensional, and one $2$-dimensional irreducible representations.

    \ 

    For the $1$-dimension cases, given $CC^times = GL_1(CC)$, there are two immediate group homomorphisms $S_3-> CC^times$, given as follow:
    - The trivial map $bb(1):S_3 -> CC^times$ by $bb(1)(sigma) = 1$ forms the trivial representation.
    - The sign map $sign:S_3 arrow.r {pm 1} subset CC^times$ by $sigma mapsto sign(sigma)$ forms the sign representation (which is distinct from trivial representation, since $sign((1 2)) = -1$, while $bb(1)((1 2))=1$).

    \ 

    For the $2$-dimensional case, we'll find an irreducible subrepresentation in $CC^3$: Given standard basis $e_1,e_2,e_3$ (representing $(1,0,0)$, $(0,1,0)$, and $(0,0,1)$ respectively). Let $S_3$ define an action on $CC^3$ by $sigma(x e_1+y e_2+z e_3) := x e_(sigma(1))+y e_(sigma(2))+z e_(sigma(3))$ (i.e. permute the ordered coordinates).

    First, notice that the $2$-dimensional subspace $V:={(x,y,z) in CC^3 | x+y+z=0}$ is a subrepresentation, since regardless of the permutation, the three entries are always given by $x,y,z$ (may be in some other order), so before and after the permutation, the sum of the entries is always $x+y+z=0$, showing that $V$ is invariant under $S_3$-action on $CC^3$, which $V$ is a subrepresentation.

    Now, we claim that $V$ is irreducible: Suppose the contrary that $V$ is reducible, meaning it has a proper nontrivial subrepresentation $W subset V$, enforcing $W$ to be $1$-dimensional, or $W = span{(x,y,z)}$ for some $(x,y,z) in V$. However, if it's a subrepresentation, it must be isomorphic to one of the irreducible $1$-dimensional representations mentioned before, in either case one always have $3$-cycle $(1 2 3)$ acts as an identity on the vector space. So, we must have the following:
    $ (x,y,z)=(1 2 3) dot (x,y,z) = (z,x,y) ==> x=y=z $
    However, this implies that $3x=x+y+z=0$, or $0=x=y=z$, showing $(x,y,z)=0$, or $W = span{(x,y,z)} = (0)$, which contradicts the assumption that $W$ is a $1$-dimensional subspace. So, $V$ must be irreducible, hence the desired $2$-dimensional irreducible representation of $S_3$.

    \ 

    \ 

  2. For $D_8$, since $|D_8|=8$, and in #text(weight: "bold")[Problem 2] we've also computed all conjugacy classes: $C_1={e}, C_={sigma^2}, C_3={sigma, sigma^3}, C_4 = {tau, tau sigma^2},$ and $C_5 = {tau sigma, tau sigma^3}$. Then, the only way of partition $8$ into five perfect squares, is $8 = 1+1+1+1+2^2$, this indicates that $D_8$ has four $1$-dimensional, and one $2$-dimensional irreducible representations.

    \ 

    For the $1$-dimension cases, given any representation $phi:D_8 -> C^times = GL_1 (CC)$, for any $g in D_8$, we have its character $chi_phi (g) = tr(phi(g)) = phi(g)$ (since it's a $1 times 1$ matrix), then $chi_phi = phi$ as a set map. Then, with $chi_phi$ being conjugation invariant, so is $phi$. Hence, based on the conjugacy classes, we have the following:
    - Based on relation of $C_3$, $phi(sigma) = phi(sigma^3) = phi(sigma)^3$, so $phi(sigma^2)=phi(sigma)^2 = 1$, showing $phi(sigma)=pm 1$.
    - For relation on $tau$, since $phi(tau)^2=phi(tau^2) = phi(e) = 1$, then $phi(tau) = pm 1$ also.

    Which, there are four possible combinations: either $phi(sigma)=phi(tau)=1$, $phi(sigma)=1$ and $phi(tau)=-1$, $phi(sigma)=-1$ and $phi(tau)=1$, or $phi(sigma)=phi(tau)=-1$. Using $phi_1, phi_(pm 1), phi_(mp 1), phi_(-1)$ respectively to denote the corresponding maps, we have the following results:
    $ phi_1(D_8)={1} $
    $ &phi_(pm 1)(e)=phi_(pm 1)(sigma^2) = phi_(pm 1)(sigma)=phi_(pm 1)(sigma^3)=1\ 
    &phi_(pm 1)(tau)=phi_(pm 1)(tau sigma^2)= phi_(pm 1)(tau sigma)= phi_(pm 1)(tau sigma^3)=-1 $
    $ &phi_(mp 1)(e)=phi_(mp 1)(sigma^2)=phi_(mp 1)(tau)=phi_(mp 1)(tau sigma^2)=1\ 
    &phi_(mp 1)(sigma)=phi_(mp 1)(sigma^3)=phi_(mp 1)(tau sigma)=phi_(mp 1)(tau sigma^3)=-1 $
    $ &phi_(-1)(e)=phi_(-1)(sigma^2)=phi_(-1)(tau sigma)=phi_(-1)(tau sigma^3)=1\ 
    &= phi_(-1)(sigma)=phi_(-1)(sigma^3)=phi_(-1)(tau)=phi_(-1)(tau sigma^2)=-1 $
    These are all distinct maps, and one can check that all of them are group homomorphisms $D_8 -> {pm 1} subset CC^times$, which forms all the $1$-dimensional group representations of $D_8$.

    \ 

    For the $2$-dimension case, we'll again find a subrepresentation in $CC^4$ (with standard basis $e_1,e_2,e_3,e_4$): If consider the dihedral group $D_8$ as the symmetry group on a square in $CC$ (with four vertices labeled as $1,2,3,4$ in counterclockwise order, and with the vertex $1$ lying on positive real axis; for convenience $1,2,3,4$ can also be represented with $1,i,-1,-i$ using coordinates on $CC$), then let $sigma$ denotes the counterclockwise rotation, $tau$ denotes the reflection by real axis, we have $sigma = (1234)$, and $tau = (13)$ as permutations of the vertices. Hence, this creates an embedding $D_8 arrow.hook S_4$.

    Now, consider the natural action of $S_4$ on $CC^4$ (which induces a subgroup representation of $D_8$ over $CC^4$), by $sigma(x e_1+y e_2+z e_3+w e_4):=x e_(sigma(1))+y e_(sigma(2))+z e_(sigma(3))+ w e_(sigma(4))$, notice that the $3$-dimensional subspace $V = {(x,y,z,w) in CC^4 | x+y+z+w=0}$ forms a subrepresentation of $S_4$ (since after permuting the coordinates, the entries are still given by $x,y,z,w$, so the sum $x+y+z+w=0$ is invariant). Hence, with $D_8 arrow.hook S_4$, $V$ is also a subrepersentation of $D_8$. 

    Second, consider the vector $(1,-1,1,-1) in V$ (since $1+(-1)+1+(-1)=0$). Notice that under rotation $sigma=(1234)$ and reflection $tau=(13)$, they have the following:
    $ sigma(1,-1,1,-1) = (-1,1,-1,1) = -(1,-1,1,-1), quad tau(1,-1,1,-1) = (1,-1,1,-1) $
    Hence, the $1$-dimensional subspace $W=span{(1,-1,1,-1)} subset V$ is invariant under the action of $D_8$'s generators, hence invariant under $D_8$. This shows that $V$ has a $1$-dimensional subrepresentation.

    Then, consider the orthogonal complement of $W$ in $V$, denoted as $U$, then $U = {(x,y,z,w) in CC^4 | x+y+z+w=0, quad x-y+z-w=0}$ (the second equation is the inner product with $(1,-1,1,-1)$). For any $(x,y,z,w) in U$, if consider the action of $sigma$ and $tau$ on it, we have the following:
    $ sigma(x,y,z,w) = (w,x,y,z), quad w - x+y -z = -(x-y+z-w) = 0 $
    $ tau(x,y,z,w) = (z,y,x,w), quad z-y+x-w = x-y+z-w=0 $
    Hence, $sigma(x,y,z,w), tau(x,y,z,w) in U$, showing that $U$ is invariant under $D_8$'s action (since it's invariant under the generators' actions). Hence, $U$ is a $2$-dimensional subrepresentation of $D_8$.

    Finally, we claim that $U$ is irreducible: Again, suppose the contrary that $U$ is reducible, then there exists a proper nontrivial subrepresentation $Z subset U$, which enforces $Z$ to be $1$-dimensional. Now, say $Z=span{(x,y,z,w)}$ (which by definition of $U$, it satisfies $w = -x-y-z$, and $0=x-y+z-w = x-y+z+(x+y+z)=2x+2z$, enforcing $x=-z$, which further implies $w=-x-y-z=-y$), then under the action of $sigma$ and $tau$, by the invariance of $Z$ under their actions, there exists $lambda, eta in CC$, such that the following is true:
    $ lambda (-z,y,z,-y) = sigma(-z,y,z,-y)=(-y,-z,y,z) ==> z = -lambda y, y=lambda z $
    $ eta (-z,y,z,-y) = tau(-z,y,z,-y)=(z,y,-z,-y) ==> y = eta y, z = -eta z $
    The equation $y=eta y$ implies that either $y=0$ (which implies $z=-lambda y=0$, so $(-z,y,z,-y)=0$, which contradicts the fact that $Z=span{(-z,y,z,-y)}$ is $1$-dimensional), or $eta = 1$. But, $z=-eta z = -z$ implies that $z=0$, which further implies $y=lambda z=0$, which is again a contradiction.

    So, $U$ must be irreducible, hence the desired $2$-dimensional irreducible representation of $D_8$.
]

\ 

= D//8
#problem[
  Compute the character tables for $S_3$ and $D_8$.
][
  In both cases, in #text(weight: "bold")[Problem 7] we've proven that for $1$-dimensional representations, the representation $rho:G -> CC^times$ is the same as the character $chi_rho:G -> CC^times$. Hence, we can directly use the results from the previous problem for all $1$-dimensional case. For practice purpose, we'll practice using orthonormality to solve for the remaining entries.

  \ 

  1. Given $S_3$, let $chi_1,chi_2$ denotes the $1$-dimensional irreducible characters, and $chi_3$ denotes the $2$-dimensional irreducible characters. For any character $chi$, since $chi(e) - tr(id_V) = dim(V)$, then for the conjugacy class $C_(1,1,1)={e}$, it must be evaluated to be the dimension of the corresponding representation. Hence, we have the following table:

    \ 

    #set align(center)
    #table(
    columns: 4,
    stroke: 0.5pt + rgb("000000"),
    [Character\\Class], [$C_(1,1,1)$],[$C_(1,2)$],[$C_(3)$],
    [$chi_1$], [$1$], [$1$], [$1$],
    [$chi_2$],[$1$],[$-1$], [$1$],
    [$chi_3$], [$2$], [$x$], [$y$]
    )
    #set align(left)
    Then, using orthonormality, we have the following (recall that $|C_(1,1,1)|=1$, $|C_(1,2)|=3$, and $|C_3|=2$):
    $ langle chi_3,chi_1 rangle = 1/6 dot (2 dot 1+x dot 3+y dot 2)=0 ==> 2+3x+2y=0 $
    $ langle chi_3,chi_2 rangle=1/6 dot (2 dot 1+ x dot (-3) + y dot 2)=0 ==> 2-3x+2y=0 $
    Adding the two equations, we get that $4+4y=0$, or $y=-1$, which results in $2+3x+2(-1)=0$, so $3x=0$, or $x=0$. Hence, the full table is as follow:

    #set align(center)
    #table(
    columns: 4,
    stroke: 0.5pt + rgb("000000"),
    [Character\\Class], [$C_(1,1,1)$],[$C_(1,2)$],[$C_(3)$],
    [$chi_1$], [$1$], [$1$], [$1$],
    [$chi_2$],[$1$],[$-1$], [$1$],
    [$chi_3$], [$2$], [$0$], [$-1$]
    )
    #set align(left)
    
    \ 

    \

  2. Given $D_8$, let $chi_1,chi_2,chi_3,chi_4$ denote the $1$-dimensional irreducible characters, and $chi_5$ denotes the $2$-dimensional irreducible characters. Together with the dimension claim, and the $1$-dimensional character being the same as the group representation, we get the following table (where the characters correspond to the representations $phi_1, phi_(pm 1), phi_(mp 1), phi_(-1)$ respectively):

    \

    #set align(center)
    #table(
    columns: 6,
    stroke: 0.5pt + rgb("000000"),
    [Character\\Class], [$C_(1)$],[$C_(2)$],[$C_(3)$], [$C_4$], [$C_5$],
    [$chi_1$], [$1$], [$1$], [$1$],[$1$],[$1$],
    [$chi_2$],[$1$],[$1$], [$1$],[$-1$],[$-1$],
    [$chi_3$], [$1$], [$1$], [$-1$],[$1$],[$-1$],
    [$chi_4$], [$1$], [$1$], [$-1$], [$-1$], [$1$],
    [$chi_5$], [$2$], [$x$], [$y$], [$z$], [$w$]
    )
    #set align(left)

    Then, based on the orthonormality, we get the following four equations (Note: $|C_1|=|C_2|=1$, and $|C_3|=|C_4|=|C_5|=2$):
    $ langle chi_5,chi_1 rangle = 2 dot 1+x dot 1+y dot 2+z dot 2+w dot 2=0 ==> 2+x+2y+2z+2w=0 $
    $ langle chi_5,chi_2 rangle = 2 dot 1+x dot 1+y dot 2-z dot 2-w dot 2=0 ==> 2+x+2y-2z-2w=0 $
    $ langle chi_5,chi_3 rangle = 2 dot 1+x dot 1-y dot 2+z dot 2-w dot 2=0 ==> 2+x-2y+2z-2w=0 $
    $ langle chi_5,chi_4 rangle = 2 dot 1+x dot 1-y dot 2-z dot 2+w dot 2=0 ==> 2+x-2y-2z+2w=0 $
    Add the first two (and respectively, the last two) equations together, we get:
    $ 4+2x+4y=0, quad 4+2x-4y=0 ==> 8+4x=0 ==> x=-2 $
    Plug into the equation, we get:
    $ &4+2(-2)+4y=0 ==> 4y=0 ==> y=0 $
    Now, plug $x=-2, y=0$ into other equations, we get:
    $ &2+(-2)+2z+2w=0 ==> z+w=0\
    &2+(-2)+2z-2w=0 ==> z-w=0 $
    Hence, add these two equations up, it derives $2z=0$, or $z=0$; then, this results in $w=0$ also. So, the full table is as follow:

    \ 

    #set align(center)
    #table(
    columns: 6,
    stroke: 0.5pt + rgb("000000"),
    [Character\\Class], [$C_(1)$],[$C_(2)$],[$C_(3)$], [$C_4$], [$C_5$],
    [$chi_1$], [$1$], [$1$], [$1$],[$1$],[$1$],
    [$chi_2$],[$1$],[$1$], [$1$],[$-1$],[$-1$],
    [$chi_3$], [$1$], [$1$], [$-1$],[$1$],[$-1$],
    [$chi_4$], [$1$], [$1$], [$-1$], [$-1$], [$1$],
    [$chi_5$], [$2$], [$-2$], [$0$], [$0$], [$0$]
    )
    #set align(left)


]