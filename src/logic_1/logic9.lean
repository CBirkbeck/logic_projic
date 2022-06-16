import tactic --hide

/-Lemma 
More nested implications:
-/
lemma lemma7 (P Q: Prop) : (P → Q) → ((P → Q) → P) → Q :=
begin
  intros hPQ hPQP,
  apply hPQ,
  apply hPQP,
  exact hPQ,



end