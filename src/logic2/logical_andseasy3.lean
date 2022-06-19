import tactic --hide

/-
Let now show that `∧` is transitive
-/

/-Lemma
Proving `∧` is transitive
-/
lemma and_transitive (P Q R: Prop) : (P ∧ Q) → (Q ∧ R) → (P ∧ R)  :=
begin
  rintro ⟨hP, hQ⟩ ⟨-, hR⟩,
  exact ⟨hP, hR⟩,
  
end

