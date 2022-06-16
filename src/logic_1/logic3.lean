import tactic -- hide

/-Lemma
Assume `Q` is true. Prove that `P → Q`. 
-/
lemma lemma1 (P Q : Prop) (hQ : Q) : P → Q :=
begin
  intro fish,
  exact hQ,




end