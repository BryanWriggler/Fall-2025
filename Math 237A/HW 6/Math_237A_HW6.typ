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
  title: "Math 237A HW 6",
  authors: ("Zih-Yu Hsieh",),
  date: datetime.today().display("[month repr:long] [day], [year]"),
)

= D//1
#problem[
  Lazarsfeld Problem Set 5 (2):

  Let $f:X arrow.r Y$ be a dominant morphism of irreducible (quasi-projective) varieties. Prove that $dim Y<= dim X$.
][
  We'll first work with the affine case: Given that $f:X arrow.r Y$ is a dominant morphism, then the induced ring homomorphism $f^*:k[Y] arrow.r k[X]$ is injective. Which, such ring homomorphism can be extended to the field homomorphism between their fraction fields, say $overline(f^*):k(Y) arrow.r k(X)$ (or between their field of rational functions).

  Now, suppose $dim Y=n$, then there exists an algebraically independent subset over $k$ with length $n$, say $g_1,...,g_n in k(Y)$. So, the field homomorphism $overline(f^*)$ must have $overline(f^*)(g_1),...,overline(f^*)(g_n) in k(X)$ be algebraically independent also:
  
  Suppose the contrary that they're algebraically dependent, then there exists $p(x_1,...,x_n) in k[x_1,...,x_n]$, such that $p(overline(f^*)(g_1),...,overline(f^*)(g_n))=0$. Then, since $overline(f^*)$ is a field homomorphism, one has $0=p(overline(f^*)(g_1),...,overline(f^*)(g_n)) = overline(f^*)(p(g_1,...,g_n))$, showing $p(g_1,...,g_n)=0$ by the injectivity of field homomorphism. So, $g_1,...,g_n$ is no longer algebraically independent over $k$, which is a contradiction.

  So, $overline(f^*)(g_1),...,overline(f^*)(g_n) in k(X)$ is algebraically independent over $k$, showing $n <= "trdeg"_k k(x)=: dim X$. Hence, $dim Y<=dim X$.

  \ 

  Finally, for the quasi-projective case, it suffices to cover using affine charts, and provide the statement above the complete the claim for each affine charts, which provides a general statement for the whole quasi-projective variety also.
]

#pagebreak()

#set enum(numbering: "(a)")
= D//2
#problem[
  Lazarsfeld Problem Set 5 (3):

  Given $d>=2$, denote by $PP^(N(d))$ the projective space parametrizing all plane curves of degree $d$. (So $N(d)=mat(d+2;2)-1$).
  + Show that if $d=2$, then there is a dense open subset $U subset PP^5$ such that all conics corresponding to points in $U$ are projectively equivalent, i.e. differ by a linear change of coordinates.
  + On the other hand, prove that the analogous statement fails when $d>=3$.

  Note: You may grant that $SL(n+1)$ is irreducible. You will want to observe that it has dimensoin $= (n+1)^2-1$.
][
  + Recall that given $PP^5 = {[a,b,c,d,e,f]}$ can also be identified as all the matrix $S = mat(a,d,e;d,b,f;e,f,c)$ quotient out by scalar multiplication of $k^times$ (which each represents the conic $a x^2+b y^2+ c z^2+d x y + e x z+f y z$ over $PP^2$). Then, if using $SL(3)$ as a source of projective transformation on $PP^2$ (which transforms the coordinates, hence the coefficients of the conic over $PP^2$), then for any $A in SL(3)$, the transformation on the coefficients of the conics can be provided by $A^T S A$ as matrices.

    Now, if consider the morphism $phi: SL(3) -> PP^5$ by $A mapsto A^T I A = A^T A$ (or, doing a coordinate transformation on a standard conic $x^2+y^2+z^2$), then we have $im(phi) subset.eq {mat(a,d,e;d,b,f;e,f,c) eval(#200%) det mat(a,d,e;d,b,f;e,f,c) !=0}$ if identify $PP^5$ as symmetric matrices quotient out by scalar multiplication (since $det(A^T A)!=0$ for all $A in SL(3)$). Now, notice that $im(phi) = {mat(a,d,e;d,b,f;e,f,c) eval(#200%) det mat(a,d,e;d,b,f;e,f,c) !=0}$, since for any such symmetric matrix $S$ (with $det S!=0$), it is diagonalizable, so there exists $P in GL(3)$ (with $P^(-1) = P^T$) and diagonal matrix $D in GL(3)$, such that $S = P^T D P$. Then, take the square root matrix $sqrt(D)$ (which is also diagonal; this is defined due to the fact that $x^2 = lambda$ always has a solution over $k=overline(k)$), one has $S = P^T D P = P^T sqrt(D)^T sqrt(D) P = (sqrt(D) P)^T (sqrt(D) P)$ (where $sqrt(D) P in GL(3)$), then since $S$ is up to a scalar, by suitable scaling factor one can have $sqrt(D) P in SL(3)$, showing that the morphism $phi:SL(3) -> PP^5$ is in fact dominant (since the image is an open dense subset, where the symmetric matrix has determinant nonzero).

    Since within this open dense subset of $PP^5$, everything is a conic after a linear transformation on the coordinate of $x^2+y^2+z^2$, we can claim that within this open dense image, everything iis projectively equivalent (since it's up to a change of coordinates using elements of $SL(3)$).

    \ 

  + Given $d>=3$, notice that $mat(d+2;2) = ((d+2)(d+1))/2 >= (5 dot 4)/2 = 10$, $PP^(N(d))$ (the space of all plane curves of degree $d$) has dimension $>=10$. But, if using the same method as in part (a), since $dim SL(3) = 8$, there is no dense subset in $PP^(N(d))$ so that $SL(3)$ can map surjectively onto through a morphism like in part (a), simply because the dimension of the image must have dimension $<=8$, which has closure at most dimension $9$ (hence the closure cannot cover the whole space, since the space has dimension $>=10$). Therefore, the image cannot be dense, showing such claim fails.
]

= D//3
#problem[
  Lazarsfeld Problem Set 5 (4):
  
  Find the dimension of the space $M_(n times m)^(<=r)$ of all $n times m$ matrices of rank $<=r$.
][
  Given any matrix $A in M^(=r)_(n times m)$ (an open dense subset of $M^(<=r)_(n times m)$), since its column rank is $r$, if identify the $W_A subset.eq k^n$ as the column span of the columns of $A$, it is an $r$-dimensional subspace of $k^n$. Which, $A$ can be identified as $W_A$, together with $m$ column vectors $c_1,...,c_m in W_A$, so it can also be thought of as a pair in $GG(r,n) times (AA^(n m))$ (where $AA^(n m):= M_(n times m)$, all the $n times m$ matrix).

  More specifically, take $Z subset.eq GG(r,n) times AA^(n m)$ with all the pairs $(W,A)$ such that the column vectors of $A in M_(n times m)$, say $c_1,...,c_m in W$ (where $W$ is an $r$-dimensional subspace). This forms an algebraic set, since each $r$-dimensional subspace $W subset.eq AA^n$ is also an algebraic set cut out by several linear equations, and the requirement for $(W,A)$ to form a pair is that all the column vectors of A ($c_1,...,c_m in AA^n$) must satisfy the associated equations of $W$.

  Notice that fixing any $W in GG(r,n)$, the subset $"pr"_1^(-1)(W) = {W} times W^m$ (where now view $AA^(n m) := plus.circle_(i=1)^m k^n$, and each $W in k^n$), since for each pair $(W,A)$, it can also be viewed as $(W, {c_1,...,c_m})$ (where each $c_i in W$). THen, locally $Z$ is a fibre bundle with fibre being $W^m tilde.equiv AA^(r m)$ (wince $W$ is an $r$-dimensional subspace), showing $dim Z = dim GG(r,n) + dim W^m = r(n-r) + m r = r(n+m-r)$.

  \ 

  Now, if consider the projection $"pr"_2:Z -> AA^(n m) = M_(n times m)$. Since every pair $(W, A) in Z$ has $A in M_(n times m)$ being a matrix with column vectors in $W$ (an $r$-dimensional subspace), then rank of $A$ is $<=r$ (since the column span is contained in $W$), showing $im("pr"_2) subset.eq M^(<=r)_(n times m)$; and, the two are in fact equal as sets, since for any $A in M^(<=r)_(n times m)$, take $W subset.eq k^n$ as an $r$-dimensional subspace contain the column span of $A$, then $(W,A) in Z$, and $"pr"_2 (W,A) = A$. So, $"pr"_2:Z ->> M^(<=r)_(n times m)$ is a surjective morphism, showing that $dim M^(<=r)_(n times m)<= dim Z = r(n+m-r)$.

  \ 

  Finally, to show they're in fact equal, we'll show it's a birational equivalence also: take $"pr"_2^(-1)(M^(=r)_(n times m)) subset.eq Z$ a dense open subset (by continuity of $"pr"_2$), notice that the restriction onto this open subset $"pr"_2:"pr"_2^(-1)(M^(=r)_(n times m)) -> M^(=r)_(n times m)$ is in fact a one-to-one correspondance: such map is surjective, based on the fact that when restricting the codomain to $M^(<=r)_(n times m)$, the second projection $"pr"_2$ is surjective. It's injective, since if $(W_A,A), (W_B,B) in "pr"_2^(-1)(M^(=r)_(n times m))$ satisfies $A=B$ (or, their second projection are the same), then since $A,B$ both have the same column span being $r$-dimensional, while $W_A, W_B$ are also $r$-dimensional subspaces containing their column span, which enforces $W_A=W_B=$ column span of $A,B$ (since the dimension matches).

  Now, if restrict to an even smaller open subset, say $U subset.eq M^(=r)_(n times m)$, such that all matrices have the first $r times r$ minor with determinant  $!=0$, then it implies for any $A in U$, the first $r$ column vectors form a basis for the column span, hence using Plucker coordinates on the first $r$ columns (or on the left most $n times r$ submatrix), it defines a rational map $phi:M^(=r)_(n times m) arrow.dotted "pr"_2^(-1)(M^(=r)_(n times m))$, by $phi(A) = (W_A,A)$, where $W_A$ is the subspace generated by the first $r$ columns (using Plucker coordinates, it's taking all $r times r$ minor's determinant in the left most $n times r$ submatrix of $A$, which is a rational map into $GG(r,n)$). And, this rational map is well-defined on $U subset.eq M^(=r)_(n times m)$, since then the choice $W_A$ is in fact an r-dimensional subspace (or a well-defined point in $GG(r,n)$ when taking the Plucker coordinates).

  Then, we claim that $phi:U -> "pr"_2^(-1)(U)$ defines an inverse of $"pr"_2: "pr"_2^(-1)(U) -> U$: Given any $(W,A) in "pr"_2^(-1)(U)$, one has $W$ being the span of the first $r$ column vectors of $A$, so $"pr"_2(W,A) = A$, while $phi(A) = (W,A)$; Now, given any $B in U$, it's clear that $"pr"_2(phi(B)) = B$ by definitions. So, they're inverse of each other as rational maps.

  \ 

  Hence, $"pr"_2:Z -> M^(<=r)_(n times m)$ defines a birational equivalence, and since birational equivalence preserves dimension (due to the fact that it generates an isomorphism on the field of rational maps, which preserves the transcedence degree), then $dim Z=dim M^(<=r)_(n times m)$, showing $dim M^(<=r)_(n times m) = r(n+m-r)$.
]

#pagebreak()

= D//4
#problem[
  Hartshorne 1.1.10:

  + If $Y$ is any subset of a topological space $X$, then $dim Y<= dim X$.
  + If $X$ is a topological space which is covered by a family of open subsets ${U_i}$, then $dim X=sup dim U_i$.
  + Give an example of a topological space $X$ and a dense open subset $U$ with $dim U< dim X$.
  + If $Y$ is a closed subset of an irreducible finite-dimensional topological space $X$, and if $dim Y=dim X$, then $Y=X$.
  + Give an example of a Noetherian topological space of infinite dimension. 
][
  + Let $n= dim Y$, then there exists a maximal chain of irreducible closed subsets $Z_0 subset.neq Z_1 subset.neq... subset.neq Z_n subset.eq Y$ (under subspace topology). Now, for all index $i$, if consider $overline(Z_i) subset.eq X$ (under topology of $X$), one has $Z_i = overline(Z_i) sect Y$ (since closure in the original space then take the intersection, is the same as taking the intersection then take the closure under subspace topology). So, $Z_i subset.neq Z_(i+1) ==> overline(Z_i) subset.neq overline(Z_(i+1))$. Hence, we also have a chain of closed subsets $overline(Z_0) subset.neq overline(Z_1) subset.neq ... subset.neq overline(Z_n) subset.eq X$.

    Finally, notice that this chain is consist of irreducible closed subsets, since $Z_i$ is irreducible under subspace topology of $Y$ implies it's irreducible under topology of $X$ (since inclusion map $iota:Y arrow.hook X$ is continuous, one must have $Z_i$ irreducible getting sent to $iota(Z_i) = Z_i$, which is also irreducible). So, using the fact that closure of an irreducible subset is irreducible, each $overline(Z_i) subset.eq X$ is irreducible.

    Hence, $overline(Z_0) subset.neq overline(Z_1) subset.neq ... subset.neq overline(Z_n) subset.eq X$ is a chain of irreducible closed subsets with length $n$ in $X$, showing $dim Y = n<= dim X$.

    \ 

  + Using part (a), it's clear first that for any $i in I$ (the index set of ${U_i}$), one has $dim U_i <= dim X$, hence one must have $sup dim U_i <= dim X$ (since $dim X$ forms an upper bound of all $dim U_i$).

    Now, let $n:= dim X$, choose a maximal chain of irreducible closed subsets $Z_0 subset.neq Z_1 subset.neq ... subset.neq Z_n subset.eq X$. Choose an open subset $U_i$ such that $U_i sect Z_0!=emptyset$ (by the fact that $union.big U_alpha = X$, such $U_i$ exists). Then, since $Z_0 subset.neq Z_j$ for any other index $j$, one also has $U_i sect Z_j != emptyset$.

    Notice that $U_i sect Z_j subset.eq Z_j$ is an open subset under subspace topology, then based on the assumption that $Z_j$ is irreducible, any of its open subset must be irreducible and dense, so $U_i sect Z_j$ is irreducible dense in $Z_j$ for each index $j$, showing $overline(U_i sect Z_j) = Z_j$. (Note: since each $Z_j$ is closed in $X$, such closure in $X$ and $Z_j$ coincides).

    However, since $Z_j subset.neq Z_(j+1)$, then with the fact that $overline(U_i sect Z_(j)) = Z_(j)$ and $overline(U_i sect Z_(j+1)) = Z_(j+1)$, one must have $U_i sect Z_j subset.neq U_i sect Z_(j+1)$. Hence, in $U_i$ (with subspace topology), one has the following chain of irreducible closed subsets:
    $ U_i sect Z_0 subset.neq U_i sect Z_1 subset.neq ... subset.neq U_i sect Z_n subset.eq U_i  $
    (Note: Each $U_i sect Z_j$ is irreducible in $Z_j$, hence irreducible in $X$, which is also irreducible in any subspace containing it).

    This shows that $dim U_i = n = dim X$, so $dim X = sup dim U_i$.

    \ 

  + Consider the following topology on the set ${1,2,3}$:
        #figure(
        image("q4_3.jpg", width: 70%),
        caption: [
          Provided Topology on the 3-point set
        ],
      )
    Where, the red circles represent all the open sets, and the blue rectangles represent all the closed sets. Notice that every nonempty closed set $C$ is irreducible, since the closed subsets for a proper chain of inclusion, so every proper closed subset of $C$ unions to be a proper subset of $C$, so $C$ cannot be written as unions of two proper closed subsets, hence irreducible.

    First, notice that $X={1,2,3}$ under this topology has $dim X=2$ (since counting nonempty irreducible closed subsets, there are total of 3 forming a proper chain of inclusions).

    Now, consider the open subset $U = {1,2}$ (the second largest red circle). It satisfies $overline(U) = X = {1,2,3}$, since the only closed subset containing both $1$ and $2$ is ${1,2,3}$ (the largest blue rectangle). Also, if consider the subspace topology of $U$, the only closed sets are $emptyset, {2},$ and ${1,2}=U$ (again, both nonempty closed subsets are irreducible using the same claim as before). As a result, $dim U = 1$ (since only two irreducible closed subsets exist, and form a proper chain of inclusion).

    So, $U$ is dense in $X$, while $dim U=1<2 = dim X$.

    \ 

  + If $Y$ is a closed subset of $X$, then any of its irreducible closed subset $Z subset.eq Y$ (under subspace topology of $Y$) is also an irreducible closed subset in $X$ (since under inclusion map $iota:Y arrow.hook X$, $iota(Z) = Z$ is irreducible in $X$; while there exists closed set $C subset.eq X$, such that $Z = C sect Y$, so $Z$ is also closed under topology of $X$ because $Y$ is closed).

    Then, suppose the contrary that $Y!= X$, with $X$ being irreducible, let $Z_0 subset.neq Z_1 subset.neq ... subset.neq Z_n subset.eq Y$ be a maximal chain of irreducible subsets with length $n$ (under subspace topology of $Y$), including into $X$, one has $Z_0 subset.neq Z_1 subset.neq ... subset.neq Z_n subset.neq X$ be a chain of irreducible subsets with length $n+1$ (since $X$ is irreducible, and $Y subset.neq X$ implies $Z_n subset.neq X$). So, it shows that $dim X >= n+1 > n=dim Y$, which contradicts the assumption that $dim X=dim Y$. Hence, $Y=X$ is enforced.

    \ 

  + Consider the natural number $NN$, and impose a topology so that the open sets are in the form $U_n := {n+1,n+2,...}$ and empty set $emptyset$ (which, including $-1$ so that $U_(-1) = NN$). Which, the closed sets are instead in the form $C_n := NN\\ U_n = {0,1,...,n-1,n}$.Pictorially, we have the following:

        #figure(
        image("q4_5.jpg", width: 70%),
        caption: [
          Provided Topology on $NN$
        ],
      )
    Notice that for any ascending chain of open sets, say $U^((1)) subset.eq U^((2)) subset.eq... subset.eq U^((n)) subset.eq ...$, since each $U^((n)) = U_(k_n)$ for some $k_n in NN$, with $U_(k_n) subset.eq U_(k_(n+1))$, it enforces $k_(n+1)<= k_n$. So, since the defining integers satisfy $k_1 >= k_2 >= ... >= k_n >= ...>=-1$, then it must stabilize at some $n in NN$, showing for integer $l>=n$, one has $k_l = k_n$, or $U^((l)) = U_(k_l) = U_(k_n) = U^((n))$. Hence, all ascending chain of open subsets eventually stabilize, such topology makes $NN$ into a Noetherian space.

    \ 

    Also, every nonempty closed set $C$ is irreducible, since the closed sets form a proper chain of inclusion, hence alll the proper closed subsets of $C$ (where there's only finitely many) must union to be a proper closed subset, showing $C$ can't be written as unions of proper closed subsets.

    \ 

    Finally, $NN$ under this topology has infinite dimension, simply because the irreducible closed subsets form an infinite strict ascending chain.
]