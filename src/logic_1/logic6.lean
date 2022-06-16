import tactic --hide

/-Lemma  
Lets show that implications are transitive. That is, if `P → Q` and `Q → R` are true, then
so is `P → R`.
-/
lemma implicationss_are_transitive (P Q R : Prop) : (P → Q) → (Q → R) → (P → R) :=
begin
  intros hPQ hQR hP,
  apply hQR,
  apply hPQ,
  exact hP,



end