import tactic --hide

/-Lemma
Even more nested implications
-/
lemma lemma8 (P Q R : Prop) : ((P → Q) → R) → ((Q → R) → P) → ((R → P) → Q) → P :=
begin
  intros h1 h2 h3,
  apply h2,
  intro hQ,
  apply h1,
  intro hP,
  exact hQ,



end