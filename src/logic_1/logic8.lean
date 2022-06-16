import tactic --hide

/-
Lets try some harder ones
-/


/-Lemma 
This isn't so bad
-/
lemma lemma6 (P Q R S T : Prop) : (P → R) → (S → Q) → (R → T) → (Q → R) → S → T :=
begin
  intros hPR hSQ hRT hQR hS,
  apply hRT,
  apply hQR,
  apply hSQ,
  exact hS,



end