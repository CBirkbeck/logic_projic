import tactic --hide

-- Level name : absorpsion laws pt 1

/-Lemma
Lets try and prove that $P ∧ (P ∨ Q)$ is equivalent to $P$
-/
lemma absorption_one (P Q : Prop) : P ∧ (P ∨ Q) ↔ P :=
begin
  split,
  intro h,
  cases h with hP hPQ,
  exact hP,
  intro h,
  split,
  exact h,
  left,
  exact h,  
end
