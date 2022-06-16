import tactic -- hide

/-
Note that implies `→` is not associative: in general `P → (Q → R)` and `(P → Q) → R`
might not be equivalent. This is like subtraction on numbers -- in general
`a - (b - c)` and `(a - b) - c` might not be equal.
So if we write `P → Q → R` then we'd better know what this means.
The convention in Lean is that it means `P → (Q → R)`. If you think
about it, this means that to deduce `R` you will need to prove both `P`
and `Q`. 

In general to prove `P1 → P2 → P3 → ... Pn` you can assume
`P1`, `P2`,...,`P(n-1)` and then you have to prove `Pn`. 
So the next level is asking you prove that `P → (Q → P)`.
-/

/-Lemma 
Prove $P$ implies $(P \implies Q)$
-/
lemma lemma2 (P Q : Prop) : P → Q → P :=
begin
  intro hP,
  intro hQ,
  exact hP,



end