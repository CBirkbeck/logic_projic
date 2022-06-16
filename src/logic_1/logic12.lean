import tactic --hide

/-Lemma
How hard could it be?
-/
lemma lemma10 (P Q : Prop) : (((P → Q) → Q) → Q) → (P → Q) :=
begin
  intros h1 hP,
  apply h1,
  intro hPQ,
  exact hPQ hP,



end