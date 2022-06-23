import tactic --hide

-- Level name : absorpsion laws pt 1

/-
Lets try and prove that $P ∧ (P ∨ Q)$ is equivalent to $P$
-/

/-Lemma
If $P,Q$ are logical statements then $P ∧ (P ∨ Q)$ is true if and only if $P$ is true.
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
