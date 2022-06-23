import tactic --hide

-- Level name : Associative laws pt 1

/-
Lets prove that $P ∧ (Q ∧ R)$ is equivalent to $(P ∧ Q) ∧ R$. We call this *associativity* of `∧`.
-/

/-Lemma
If $P,Q,R$ are logical statements, then $P ∧ (Q ∧ R)$ is true iff $(P ∧ Q) ∧ R$ is true.
-/
lemma associativity_one (P Q R : Prop) : P ∧ (Q ∧ R) ↔ (P ∧ Q) ∧ R :=
begin
  split,
  intro h,
  split,
  cases h with hl hr,
  split,
  exact hl,
  cases hr,
  exact hr_left,
  cases h with h1 h2,
  cases h2 with h2 h3,
  exact h3,
  intro h,
  split,
  cases h,
  exact h_left.1,
  split,
  exact h.1.2,
  exact h.2,
end