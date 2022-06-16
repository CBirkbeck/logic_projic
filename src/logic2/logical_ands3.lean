import tactic --hide

-- Level name : absorpsion laws pt 2

/-Lemma
Lets try and prove that $P ∨ (P ∧ Q)$ is equivalent to $P$
-/
lemma absorption_two (P Q : Prop) : P ∨ (P ∧ Q) ↔ P :=
begin
  split,
  intro h,
  cases h,
  exact h,
  cases h,
  exact h_left,
  intro h,
  left,
  exact h,
end