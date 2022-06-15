import tactic --hide

universe u --hide

-- Level name : More propositions

/-
Lets look at some other logical statements



-/


/- Lemma
Lets try and prove that if `P` implies `Q` (which is written ` P → Q`) and we have a proof of `P` (i.e. we have `p : P`). Then `Q` is
true (i.e. we have a proof of `Q`)
-/

lemma l2 (P Q : Prop) : P ∧ Q → Q ∧ P :=
begin
  intro h ,
  rw and_comm,
  exact h,
end
