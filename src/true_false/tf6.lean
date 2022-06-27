import tactic --hide

/-Lemma
If $P$ is a logical statement then $\mathrm{false}$ implies $P$.
-/
lemma false_imp_P (P : Prop) : false → P :=
begin
  intro f,
  exfalso,
  exact f,



  
end

/-Hint : Challenge
Try to prove this without using the `exfalso` tactic.

-/