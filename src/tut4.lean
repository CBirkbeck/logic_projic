import tactic --hide


/-Lemma
Now try the following one: 
-/
lemma implications_two (P Q R : Prop) (h1 : P → Q) (h2 : Q → R) (p : P) : R :=
begin
  exact h2 (h1 (p)),


end