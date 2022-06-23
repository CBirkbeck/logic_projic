import tactic --hide

/-
Lets try some harder implication statements. 
-/


/-Lemma 
This is a long chain of implications.
-/
lemma lemma_6 (P Q R S T : Prop) : (P → R) → (S → Q) → (R → T) → (Q → R) → S → T :=
begin
  intros hPR hSQ hRT hQR hS,
  apply hRT,
  apply hQR,
  apply hSQ,
  exact hS,



end