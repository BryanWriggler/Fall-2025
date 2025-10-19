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
  title: "Math 231A HW 4",
  authors: ("Zih-Yu Hsieh",),
  date: datetime.today().display("[month repr:long] [day], [year]"),
)

#set enum(numbering: "(1)")

= ND//1
#problem[
  Etingof Problem Sets 3.5:

  + Prove that $RR^3$ with the commutator given by the cross-product is a Lie algebra. Show that this Lie algebra is isomorphic to $so(3,RR)$.
  + Let $phi:so(3,RR) arrow.r RR^3$ be the isomorphism of part (1). Prove that under this isomorphism, the standard action of $so(3,RR)$ on $RR^3$ is identified with the action of $RR^3$ on itself given by the cross-product:
  $ a dot overline(v) = phi(a) times overline(v), quad a in so(3,RR), overline(v) in RR^3 $
  where $a dot overline(v)$ is the usual multiplication of a matrix by a vector.
][

  + It's well-known that cross product is skew-symmetric, hence to check that $(RR^3, times)$ forms a Lie Algebra, it remains to check Jacobi's Identity.
   
    Recall that for standard basis ${be_1,be_2,be_3} subset RR^3$ it satisfies the cyclic relation, where $be_1 times be_2=be_3$, $be_2 times be_3 = be_1$, and $be_3 times be_1=be_2$. Then, 
]

= ND//2
#problem[

][
  
]

= ND//3
#problem[

][
  
]

= ND//4
#problem[

][
  
]

= ND//5
#problem[

][
  
]