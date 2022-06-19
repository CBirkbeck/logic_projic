import tactic --hide

lemma not_iff_imp_false (P : Prop) : ¬ P ↔ P → false := iff.rfl -- hide
lemma contra (P Q : Prop) : (P ∧ ¬ P) → Q := by {cc} --hide

-- Level name : De Morgan's laws, First Boss

/-
Ok time to use everything we have leaned to prove the first of De Morgans laws.

-/

/-Hint : First hint

You can do this only using `split`, `intro`, `apply`, `left`, `right`.

-/

/- Hint : Second hint

Note that if you have a goal `¬P` then `intro h` will turn your goal into `false`.

-/

/- Hint : Last hint

Note that if you have a goal `false` and an assumption `h : ¬P`, then `apply h` will turn your goal into `P`.

-/

/-Lemma
Not $P$ or $Q$ is equivalent to $¬ P$ and $¬Q$.
-/

lemma DeMorgan_one (P Q : Prop) : ¬ (P ∨ Q) ↔ ¬ P ∧ ¬ Q :=
begin
  split,
  { intro h,
    split,
    { intro hP,
      apply h,
      left, 
      exact hP },
    { intro hQ,
      apply h,
      right,
      exact hQ } },
  { rintro ⟨hnP, hnQ⟩ (hP | hQ),
    { apply hnP, exact hP },
    { exact hnQ hQ } }
end
