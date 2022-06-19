import tactic --hide

/-
Lets start with something easy. Lets prove that $P ∧ Q$ iff $Q ∧ P$
-/

/-Lemma
Proving `∧` is symmetric
-/
lemma and_symmetric (P Q : Prop) : P ∧ Q ↔ Q ∧ P :=
begin
  split,
  intro h,
  cases h,
  split,
  exact h_right,
  exact h_left,
  intro h,
  split,
  exact h.2,
  exact h.1,

  
end