import tactic --hide

-- Level name : Distributive laws 1

/-Lemma
Lets prove that $P ∨ (Q ∧ R)$ is equivalent to $(P ∨ Q) ∧ (P ∨ R)$
-/
lemma distributivity_two (P Q R : Prop) : P ∨ (Q ∧ R) ↔ (P ∨ Q) ∧ (P ∨ R) :=
begin
  split,
  intro h,
  cases h,
  split,
  left,
  exact h,
  left,
  exact h,
  split,
  right,
  exact h.1,
  right,
  exact h.2,
  intro h,
  cases h,
  cases h_left with h1 h2,
  left,
  exact h1,
  cases h_right with h4 h5,
  left,
  exact h4,
  right,
  split,
  exact h2,
  exact h5,
end