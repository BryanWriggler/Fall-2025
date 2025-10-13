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
  
]

= ND//2
#problem[
  Etingof Problem Set 2.13:

  Using Gram-Schmidt orthogonalization process, show that $GL(n,RR)\/O(n,RR)$ is diffeomorphic to the space of upper-triangular matrices with positive entries on the diagonal. Deduce from this that $GL(n,RR)$ is homotopic (as a topological space) to $O(n,RR)$.
][
  
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