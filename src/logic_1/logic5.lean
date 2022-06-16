import tactic -- hide


/- Lemma  
If we know `P`, and we also know `P → Q`, we can deduce `Q`. 
This is called "Modus Ponens" by logicians.
-/
lemma Modus_Ponens (P Q : Prop) : P → (P → Q) → Q :=
begin
  intros hP hPQ,
  apply hPQ,
  exact hP,



end