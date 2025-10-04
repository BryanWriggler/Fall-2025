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

= ND//1
#problem[Statement][
  
  Proof
]
#pagebreak()

= ND//2
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

    (iv) $==>$ (i): Suppose every nonempty family of open subsets has a maximal element. To prove that $X$ is Noetherian (space with D.C.C for closed subsets), let $V_1 supset.eq ... supset.eq V_n supset.eq ...$ be an arbitrary descending chain of closed subsets. Let $U_n=X\\V_n$ be the corresponding open subsets, it forms an ascending chain of open subsets $U_1 subset.eq ... subset.eq U_n subset.eq ...$, hence with the asssumption of (iv), there exists $M in NN$ with $U_M$ serving as a maximal element of the chain. Which, for all index $n>=M$, since $U_M subset.eq U_n$ by property of the ascending chain, using the maximality of $U_M$ it enforces $U_M=U_n$. Therefore, it implies $V_1 supset.eq ... supset.eq V_n supset.eq ...$ also stabilizes
]