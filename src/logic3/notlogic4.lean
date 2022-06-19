import tactic --hide

lemma not_iff_imp_false (P : Prop) : ¬ P ↔ P → false := iff.rfl -- hide
lemma contra (P Q : Prop) : (P ∧ ¬ P) → Q := by {cc} --hide


-- Level name : De Morgan's laws, Final Boss

/-Lemma
Not $P$ and $Q$ is equivalent to $¬ P$ or $¬Q$.
-/

lemma DeMorgan_two (P Q : Prop) :  ¬ (P ∧ Q) ↔ ¬ P ∨ ¬ Q :=
begin
  split,
  { intro h,
    by_cases hP : P,
    { right,
      intro hQ,
      apply h,
      exact ⟨hP, hQ⟩ },
    { left,
      exact hP } },
  { rintro (hnP | hnQ) ⟨hP, hQ⟩,
    { apply contra P false,
      split,
      exact hP,
      exact hnP, },
    { apply hnQ, exact hQ } }
end