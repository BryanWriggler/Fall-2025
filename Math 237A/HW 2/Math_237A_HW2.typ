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
  title: "Math 237A HW 2",
  authors: ("Zih-Yu Hsieh",),
  date: datetime.today().display("[month repr:long] [day], [year]"),
)

#set enum(numbering: "(a)")

= ND//1
#problem[Statement][
  
  Proof
]
#pagebreak()

= D//2
#problem[
  Hartshorne 1.7:

  #set enum(numbering: "(a)")

  + Show that the following conditions are equivalent for a topological space $X$:
    #set enum(numbering: "(i)")
    + $X$ is Noetherian.
    + Every nonempty family of closed subsets has a minimal element.
    + $X$ satisfies the ascending chain condition for open subsets.
    + Every nonempty family of open subsets has a maximal element.

  + A Noetherian topological space is #emph[Quasi-compact], i.e. every open cover has a finite subcover.

  + Any subset of a Noetherian topological space is Noetherian in its induced topology.
  + A Noetherian space which is also Hausdorff must be a finite set with the discrete topology.
][
  #set enum(numbering: "(a)")
  + 
    (i) $==>$ (ii): Suppose $X$ is Noetherian, then every descending chain of closed subsets stabilizes (i.e. collection of closed subsets satisfying D.C.C.). Now, let $Sigma$ be a nonempty family of closed subsets together with $subset.eq$ being its partial order. 
  
    For any chain $C subset.eq Sigma$, we claim that there exists closed set $V_C in C$ that serves as an lower bound of $C$: Suppose the contrary, that for some chain $C$, every closed subset $V in C$ is not a lowe bound of $C$. Then, first pick random $V_0 in C$, there exists $V_1 in C$ such that $V_0 supset.neq V_1$ (since $V_0$ is not a lower bound of $C$). Then, recursively every $k in NN$ one can find $V_k in C$, such that $V_(k-1) supset.neq V_k$. So, we eventually form a strict descending chain $V_0 supset.neq V_1 supset.neq ... supset.neq V_k supset.neq ...$, yet this contradicts the Noetherian Condition of $X$. So, given any chain $C subset.eq Sigma$, one must find some $V_C in C$, that serves as a lower bound of $C$.
    
    Then, since all chain $C subset.eq Sigma$ has a lower bound, by Zorn's Lemma $Sigma$ has a Minimal Element.

    \ 

    (i) $==>$ (iii): Suppose all nonempty family of closed subsets in $X$ has a minimal element. Let $U_1 subset.eq ... subset.eq U_n subset.eq ...$ be an arbitrary ascending chain of open sets in $X$. 
    
    Then, let $V_n=X\\U_n$ be the closed sets for all $n in NN$, one generates $V_1 supset.eq ... supset.eq V_n supset.eq ...$, a descending chain of closed sets. Hence by assumption of (ii), there is a minimal element, say $V_m$ for some $m in NN$. Then, for all index $n>=m$, we have $V_m supset.eq V_n$ by descending chain's property, then by minimality of $V_m$ in the chain, it enforces $V_m=V_n$. Hence, it implies $U_1 subset.eq ... subset.eq U_n subset.eq ...$ also stabilizes for $n>= m$ (since for $n>=m$, one has $X\\U_n = V_n=V_m= X\\U_m$, so $U_n=U_m$). 
    
    Hence, $X$ satisfies Ascending Chain Condition for open subsets.

    \ 

    (iii) $==>$ (iv): Suppose $X$ satisfies the ascending chain condition for open subsets. Let $Theta$ be a nonempty collection of open subsets of $X$, and use $subset.eq$ as its partial order. 

    For any chain $C subset.eq Theta$, we claim that there exists open set $U_C in C$, that serves as an upper bound of $C$: Suppose the contrary, for some chain $C$ every open subset $U in C$ is not an upper bound of $C$. Then, first choose random $U_0 in C$, there exists $U_1 in C$ such that $U_0 subset.neq U_1$ (since $U_0$ is not an upper bound of $C$). Again, recursively every $k in NN$ one can choose $U_k in C$ satisfying $U_(k-1) subset.neq U_k$. So, we form a strict ascending chain of open subsets $U_0 subset.neq U_1 subset.neq ... subset.neq U_i subset.neq ...$, yet this contradicts the ascending chain condition for open subsets. So, given any chain $C subset.eq Theta$, one must find some $U_C in C$ tat serves as an upper bound of $C$.

    Since all chain $C subset.eq Theta$ has an upper bound, by Zorn's Lemma $Theta$ has a Maximal Element.

    \ 

    (iv) $==>$ (i): Suppose every nonempty family of open subsets has a maximal element. To prove that $X$ is Noetherian (space with D.C.C for closed subsets), let $V_1 supset.eq ... supset.eq V_n supset.eq ...$ be an arbitrary descending chain of closed subsets. Let $U_n=X\\V_n$ be the corresponding open subsets, it forms an ascending chain of open subsets $U_1 subset.eq ... subset.eq U_n subset.eq ...$, hence with the asssumption of (iv), there exists $M in NN$ with $U_M$ serving as a maximal element of the chain. Which, for all index $n>=M$, since $U_M subset.eq U_n$ by property of the ascending chain, using the maximality of $U_M$ it enforces $U_M=U_n$. Therefore, it implies $V_1 supset.eq ... supset.eq V_n supset.eq ...$ also stabilizes for $n>=M$ (Since $X\\V_n = U_n=U_M=X\\V_M$ implies $V_n=V_M$). So, closed subsets in $X$ satisfies Descending Chain Condition, showing that $X$ is a Noetherian Topological Space.

    \ 

  + Let $X$ be a Noetherian Topological Space (i.e. its open subsets satisfy A.C.C). Let ${U_i}_(i in I)$ be any open cover of $X$, one has $X=union.big_(i in I)U_i$. We'll prove by contradiction that ${U_i}_(i in I)$ has a finite subcover.

    Suppose ${U_i}_(i in I)$ doesn't induce a finite subcover of $X$, choose arbitrary $U_(i_0)$ for some $i_0 in I$. Since $U_(i_0)$ doesn't form a subcover of $X$, there exists point $x_1 in X\\U_(i_0)$, hence one can find corresponding $i_1 in I$ such that $x_1 in U_(i_1)$ by the open cover condition. Inductively, for each $k in NN$, there exists $x_k in X\\(union.big_(j=0)^(k-1)U_(i_j))$, hence there exists corresponding $i_k in I$, such that $x_k in U_(i_k)$.

    Now, let $W_k = union.big_(j=0)^k U_(i_j)$ be the open subset for each $k in NN$, it satisfies $W_k subset.neq W_(k+1)$ (since $x_(k+1) in X\\(union.big_(j=0)^k U_(i_j)) = X\\W_k$, while $x_(k+1) in U_(k+1) subset.eq W_(k+1)$ by construction), hence $W_1 subset.neq ... subset.neq W_k subset.neq ...$ forms a strict ascending chain of open subsets in $X$. Yet, this contradicts the A.C.C. for open subsets in $X$. So, the assumption is false, ${U_i}_(i in I)$ must induce a finite subcover of $X$. 
    
    With ${U_i}_(i in I)$ being arbitrary, this concludes that $X$ is compact (or Quasi-compact).

    \ 
  
  + Let $X$ be a Noetherian Space, and $A subset.eq X$ be any nonempty subspace equipped with subspace topology from $X$. To check $A$ is Noetherian, let $V_1 supset.eq ... supset.eq V_n supset.eq ...$ be any descending chain of closed subsets in $A$. For each $n in NN$, there exists closed subset $C_n subset.eq X$, such that $V_n=A sect C_n$.

    Notice that one can choose $C_n$ specifically to form a descending chain in $X$: Let $C'_n:=sect.big_(i=1)^n C_i$ for all $n in NN$ (where $C'_n$ as an intersection of closed sets, is closed), the base case $n=1$ satisfies $A sect C'_1=A sect C_1=V_1$. Now, suppose given $n in NN$, it satisfies $A sect C'_n=V_n$, then for the case $(n+1)$, we have the following:
    $ A sect C'_(n+1)=A sect (sect.big_(i=1)^(n+1) C_i) = (A sect (sect.big_(i=1)^n C_i))sect(A sect C_(n+1)) $
    $ = (A sect C'_n) sect V_(n+1) = V_n sect V_(n+1)=V_(n+1) $
    Hence by induction, all $n in NN$ satisfies $A sect C'_n=V_n$. Noice that by definition, each $C'_(n)=sect.big_(i=1)^(n)C_i supset.eq sect.big_(i=1)^n C_i= C'_(n+1)$, hence $C'_1 supset.eq ... supset.eq C'_n supset.eq ...$ forms a descending chain of closed subsets in $X$, which stabilizes for some $k in NN$. Then, for all $n>=k$, since $C'_n=C'_k$, it satisfies $V_n=A sect C'_n=A sect C'_k=V_k$, showing the descending chain of closed subsets $V_1 supset.eq ... supset.eq V_n supset.eq ...$ stabilizes past $k in NN$.

    This concludes that all descending chain of closed subsets in $A$ (under subspace topology) stabilizes, hence $A$ under subspace topology satisfies D.C.C. for its closed subsets, showing $A$ is a Noetherian subspace.

    \ 

  + Let $X$ be a Noetherian and Hausdorff space. Recall the following lemma from Point Set Topology:
    #lemma[
      A finite topological space is Hausdorff $<==>$ it's equipped with discrete topology.
    ][

      $==>:$ Suppose $X$ a finite topological space is Hausdorff, then all its singletons are closed: For any $x in X$, since for any $y!= x$ in $X$, there exists open neighborhood $U_x in.rev x$ and $U_y in.rev y$ satisfying $U_x sect U_y=emptyset$ (by Hausdorff Property), then $x in.not U_y$, showing that $y in U_y subset.eq X\\{x}$. This shows that $X\\{x}$ is open (since all point $y in X\\{x}$, or $y!= x$ has an open neighborhood fully contained in $X\\{x}$). Then, since singletons are closed, any finite union of singletons are also closed. However, since $X$ is finite, any subset of $X$ is finite union of singletons, hence closed. With all subsets of $X$ being closed, $X$ is endowed with discrete topology.

      \ 

      $<==:$ Any set equipped with discrete topology is automatically Hausdorff, since for any $x!=y$, ${x} sect {y} = emptyset$, so ${x},{y}$ are open neighborhoods of $x,y$ respectively that're disjoint, showing the space is Hausdorff. 
    ]
    Now, using the above lemma, if $X$ is finite it is automatically with discrete topology. So, it suffices to show $X$ is finite.

    \ 

    For our purpose, we'll consider another lemma:
    #lemma[
      For a Hausdorff Space, singletons are closed. As a consequence, any nonempty irreducible closed subset of $X$ must be singletons.
    ][
      For all $x in X$, given any $y in X\\{x}$, there exists open neighborhoods $U_x in.rev x$ and $U_y in.rev y$, such that $U_x sect U_y = emptyset$ by Hausdorff property. Hence, $x in.not U_y$, showing $y in U_y subset.eq X\\{x}$. This proves that $X\\{x}$ is open (since all element in $X\\{x}$ has an open neighborhood fully contained in $X\\{x}$), or ${x}$ is closed.

      \ 

      To show the consequence, given any closed sets $V subset.eq X$ with distinct elements $x,y in V$, by Hausdorff Property there exists open neighborhood $U_x in.rev x$ and $U_y in.rev y$ such that $U_x sect U_y = emptyset$, then it implies the inclusion  $y in U_y subset.eq X\\U_x$, showing that $y in (X\\U_x)^degree$ (the interior). Hence, $y in.not overline(U_x)$ (since $overline(U_x) = X\\(X\\U_x)^degree$). 
    
      So, if we take $overline(U_x)$ and $X\\U_x$ as two closed sets, we have: 
      $ (V sect overline(U_x)) union (V sect (X\\U_x)) = V sect (overline(U_x) union (X\\U_x)) = V sect X=V $
      while $(V sect overline(U_x)), (V sect (X\\U_x)) subset.neq V$ (since $y in.not overline(U_x)$, showing $y in V \\ (overline(U_x))$, while $x in.not X\\U_x$, showing $x in V\\(X\\U_x)$). So, $V$ can be expressed as intersections of two proper closed sets, showing $V$ is a reducible closed subset of $X$. So, if $V$ is a closed irreducible subset, it cannot contain more than $1$ element, hence if $V$ is nonempty, it's automatically a singleton.
    ]
    Then, Given $X$ as a Noetherian Hausdorff Space, since any closed subset $V$ can be decomposed into finite nonempty irreducible closed subsets (#text(weight: "bold")[Proposition 1.5] in Hartshorne). In particular $X = Y_1 union ... union Y_n$ where each $Y_n$ is an irreducible closed subset. Then with $X$ being Hausdorff, the above lemma guarantees each $Y_i$ to be singleton. Hence, $X$ as finite union of singletons must be finite, and this finishes the proof.
]

#pagebreak()

= (a) ND//3
#problem[
  Hartshorne 3.2:

  A morphism whose undelying map on the topological spaces is a homeomorphism need not be an isomorphism.
  #set enum(numbering: "(a)")
  + For example, let $phi:AA^1 arrow.r AA^2$ be defined by $t mapsto (t^2,t^3)$. Show that $phi$ defines a bijective bicontinuous morphism of $AA^1$ onto the curve $y^2=x^3$, but that $phi$ is not an isomorphism.
  + For another example, let the characteristic of the base field $k$ be $p>0$, and define a map $phi:AA^1 arrow.r AA^1$ by $t arrow.r t^p$. Show that $phi$ is bijective and bicontinuous but not an isomorphism. This is called the #emph[Frobenius morphism].
][
  #set enum(numbering: "(a)")

  + First to verify $phi$ is bijective, for all $(x,y)$ on the curve $y^2=x^3$, if $(x,y)=(0,0)$ the $phi(0)=(0^2,0^3)$ does the job. Else if $x!=0$ or $y!=0$ (which since     $x^2=y^3$ and $k$ is a field, the two must happen together), let $t=y/x$, it satisfies:
    $ phi(t)=(t^2,t^3)=(y^2/x^2,y^3/x^3)=(x^3/x^2,y^3/y^2)=(x,y) $
    This proves that $y$ is surjective. 

    To show injectivity, if $t,t'$ both gets map to $(0,0)$, then it's clear that $t^2,t'^2=0$, hence $t=t'=0$. Else, if $t,t'$ gets mapped to $(x,y)!=(0,0)$, as said before $x,y!=0$, hence they satisfy $t^2=t'^2=x$ and $t^3=t'^3=y$. Hence, $t = t^3/t^2=y/x=t'^3/t'^2=t'$, showing $phi$ is injective everywhere.

    To show bicontinuity, it suffices to show that $phi$ is both a closed map (or the inverse is continuous) and itself is continuous. Let $V subset.eq AA^1$ be closed, which if $V=emptyset $ or $V=AA^1$ the image under $phi$ is $emptyset$ or the whole curve $y^2=x^3$, hence closed; else if $V!=emptyset, AA^1$, then $V$ must be a finite set, hence $phi(V)$ is also a finite set, which is again closed. So, $phi$ is a closed map.

    $phi$ is continuous, since for all $V' subset.eq AA^2$ that's closed, so is $V' sect Y$ (where $Y$ represents the curve $y^2=x^3$). Then, if consider $phi^(-1)(V)$, $t in phi^(-1)(V) <==> phi(t)=(t^2,t^3) in V'$, which for all coresponding polynomial $f_1,...,f_n in k[x,y]$ for $V$, $t in phi^(-1)(V)$ iff it satisfies $f_1(t^2,t^3)=0$, for all index $i$. Hence, this shows that $phi^(-1)(V)$ is also algebraic, which is closed. Hence, $phi$ is continuous since preimage of closed set is closed.

    \ 

    However, even if $phi$ is bijective and bicontinuous, it's not an isomorphism, and it can be seen from the induced morphism between coordinate ring: Let $Y$ represents the curve $y^2=x^3$, then $Y=Z(y^2-x^3)$. We'll first claim that $I(Y)=(y^2-x^3)$, which suffices to claim that $y^2-x^3$ is irreducible (or its principal ideal is prime). Suppose the contrary that it is reducible, then it can either be reduced in the form of $(y-f_1(x))(y-f_2(x))$

    \ 

  + To show that Frobenious morphism is bijective, given any $l in k$, since $k$ is algebraically closed, then the equation $t^p=l$, or $t^p-l=0$ has a solution. Let $q in k$ be a solution for it, then it satisfies $q^p=l$, hence $t^p-l=t^p-q^p = (t-q)^p$ is the unique factorization of $t^p-l in k[t]$, hence showing that $q$ is the unique solution to $t^p-l=0$. So, since all $l in k=AA^1$ has a unique $q in k=AA^1$ such that $phi(q)=q^p=l$, hence $phi$ is bijective.

    To show it's bicontinuous, it suffices to check it's both closed and continuous. However, since in $AA^1$ besices $emptyset$ and $AA^1$ as special closed sets, other nonempty proper closed sets are finite. Hence, if closed set $V != emptyset,AA^1$, it has $phi(V)$ and $phi^(-1)(V)$ both being finite (which is closed in $AA^1$), while $emptyset = phi(emptyset) = phi^(-1)(emptyset)$ and $AA^1=phi(AA^1)=phi^(-1)(AA^1)$, this shows that $phi$ is both closed and continuous, hence bicontinuous.

    \ 

    Finally, to show it's not an isomorphism, it suffices to check it doesn't induce an isomorphism on the coordinate ring (which for $AA^1$ since its corresponding ideal is $(0)$, then the coordinate ring $k[AA^1]=k[t]$ the polynomial ring).

    Since $phi:AA^1 arrow.r AA^1$ is given by $phi(t)=t^p$, then its induced morphism on coordinate ring $phi^*:k[t] arrow.r k[t]$ is given by $phi^*(f) = f compose phi(t) = f(t^p)$. However, notice that $phi^*$ is not surjective, since for all $g in im(phi^*)$, $g = f(t^p)$ for some $f in k[t]$, then $deg(g)$ is divisible by $p$. Which, choose $t in k[t]$, it has degree $1!=p$, hence not divisible by $p$, showing that $t in.not im(phi^*)$, or $phi^*$ is not surjective. Hence, it doesn't induce an isomorphism on coordinate ring, which implies itself is not an isomorphism.
]

= ND //4
#problem[
  Hartshorne 3.15 (a)(b):

  #emph[Products of Affine Varieties]. Let $X subset.eq AA^n$ and $Y subset.eq AA^m$ be affine varieties.

  #set enum(numbering: "(a)")
  + Show that $X times Y subset.eq AA^(n+m)$ with its induced topology is irreducible.
  + Show that $k[X times Y] tilde.equiv k[X] times.circle_k k[Y]$.
][]

#pagebreak()

= D //5
#problem[
  Hartshorne 3.19 (a):

  #emph[Automorphisms of $AA^n$]. Let $phi:AA^n arrow.r AA^n$ be a morphsim of $AA^n$ to $AA^n$ given by $n$ polynomials $f_1,...,f_n$ of $n$ variables $x_1,...,x_n$. Let $J=det|(partial f_i)/(partial x_j)|$ be the #emph[Jacobian polynomial] of $phi$.

  #set enum(numbering: "(a)")
  + If $phi$ is an isomorphism (in which case we call $phi$ an automorphism of $AA^n$), show that $J$ is a onzero constant polynomial.
][
  First, we'll observe the case for identity: If $phi=id_(AA^n)$, then each $f_i = x_i$ as polynomial (since $phi(t_1,...,t_n) = (f_1,...,f_n)=(t_1,...,t_n)$ for all $(t_1,...,t_n) in AA^n$). Then, $(partial f_i)/(partial x_j) = delta_(i j)$. Hence, express in matrix form we get $((partial f_i)/(partial x_j))_(1<=i,j<=n) = id in M_n (k)$. So, $det|(partial f_i)/(partial x_j)| = 1$, which is a nonzero constant polynomial.

  \ 

  Then, recall that #emph[Chain Rule] also applies in differential calculus for polynomial ring over a field, hence given $g, f_1,...,f_n in k[x_1,...,x_n]$, it satisfies:
  $ forall j in {1,...,n}, quad (partial)/(partial x_j)g(f_1,...,f_n) = sum_(i=1)^n (partial g(f_1,...,f_n))/(partial f_i)(partial f_i)/(partial x_j) $
  Hence, given $phi$ as an isomorphism, it equips with $phi^(-1)$ also as an isomorphism that's represented by $g_1,...,g_n$. Which, $g compose f = id_(AA^n)$ is represented by $g_i (f_1,...,f_n) = x_i$. Hence, we get the following:
  $ delta_(i k)=(partial x_i)/(partial x_k)= partial/(partial x_k)g_i (f_1,...,f_n)=sum_(j=1)^n (partial g_i (f_1,...,f_n))/(partial f_j) (partial f_j)/(partial x_k) $
  Then, express in matrix form, we get:
  $ id=(delta_(i k))_(1<=i,k<=n) = ((partial g_i)/(partial x_j))_(1<=i,j<=n\ x_j = f_j) ((partial f_j)/(partial x_k))_(1<=j,k<=n) $
  So, we get that $1=det|id| = det|(partial g_i (f_1,...,f_n))/(partial f_j)| dot det|(partial f_j)/(partial x_k)|$, hence showing that $det|(partial f_j)/(partial f_k)| in k[x_1,...,x_n]$ is invertible. Yet, recall that $(k[x_1,...,x_n])^times = k^times$, hence $det|(partial f_j)/(partial f_k)|$ (the Jacobian Polynomial of $f$) is a nonzero constant polynomial.
]

#pagebreak()

= D//6
#problem[Hartshorne 3.21 (a)(b):
  
  #emph[Group Varieties]. A group variety consists of a variety $Y$ together with a morphism $mu:Y times Y arrow Y$, such that the set of points of $Y$ with the operation given by $mu$ is a group, and such that the inverse map $y arrow y^(-1)$ is also a morphism of $Y arrow Y$.
  + The #emph[additive group] $G_a$ is given by the variety $AA^1$ and the morphism $mu:AA^2 arrow AA^1$ defined by $mu(a,b)=a+b$. Show it is a group variety.
  + The #emph[multiplicative group] $G_m$ is given by the variety $AA^1-{(0)}$ and the morphism $mu(a,b)=a b$. Show it is a group variety.
][

  + To show that the inverse map of the morphism $mu:AA^1 times AA^1 arrow AA^1$ by $mu(a,b)=a+b$, since for al $y in k=AA^1$, the inverse under this morphism is $-y in AA^1$. Hence, the inverse map $iota:AA^1 arrow AA^1$ is $iota(y)=-y$, which is a morphism (since it's given by a polynomial). Hence, $G_a$ the additive group is a group variety.

  + To show that the inverse map of $mu:AA^1\\{(0)} times AA^1\\{(0)} arrow.r AA^1\\{(0)}$ by $mu(a,b)=a b$ defines a group variety (or verify its inverse is continuous), one needs to do extra work, converting $AA^1\\{(0)}$ into some variety in higher dimension affine space.

    Consider the affine space $AA^2$ together with the algebraic set $Y:= Z(x y-1)$ (where it's over the polynomial ring $k[x,y]$). Notice that $x y-1$ has degree of $y$ being $1$, hence it's automatically irreducible inside $(k[x])[y]$, showing $(x y-1)$ is prime, or $Y$ is an affine variety. 

    To show that $Y$ has a 1-to-1 correspondance with $AA^1\\{(0)}$, notice that every $(x,y) in Y$ satisfies $x y-1=0$, or $x y=1$, hence $x,y!=0$, and $y=x^(-1)$. So, define a set function $Y arrow AA^(-1)\\{(0)}$ by $(x,x^(-1)) mapsto x$ (which is also a morphism onto closure of $AA^1\\{(0)}$), it is bijective, since all $x in AA^1\\{(0)}$ has $(x,x^(-1)) mapsto x$ (which is surjective), while if $(x,y), (x',y') mapsto x'' in AA^1\\{(0)}$, we must have $x=x'=x''$, hence $y=x^(-1)=(x')^(-1)=y'$, showing the map is also injective.

    Hence, there's no ambiguity identifying $AA^1\\{(0)}$ as $Y$, where the morphism $mu$ corresponds to another morphism $mu':Y times Y arrow Y$ by $mu'((x,x^(-1)), (y,y^(-1)))= (x y, x^(-1)y^(-1))$ (since $(x,x^(-1))$ projects to $x$, $(y,y^(-1))$ projects to $y$, while $(x y, x^(-1)y^(-1))$ projects to $x y$, so each input corresponds to the $mu$'s action on the projection $mu(x,y)=x y$).

    Which, in this variety the inverse map of $mu'$ is given by $iota(x,x^(-1)) = (x^(-1),x)$, which for all $(x,y) in Y$, $iota(x,y)=(y,x)$ is a morphism, hence showing that the corresponding structure on $Y$ forms a group variety, hence it defines a group variety on $AA^1\\{(0)}$.
]