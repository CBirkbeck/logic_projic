import tactic --hide

-- Level name : Super Boss

/-
Now go against the super boss.
-/

/-Lemma
Lets prove that $(P \implies Q) ∧ (Q \implies R)$ is equivalent to 
  $(P \implies R) ∧ ((P \iff Q) ∨ (R \iff Q))$
-/
lemma and_impl_equiv (P Q R : Prop) : (P  → Q) ∧ (Q → R) ↔ (P → R) ∧ ((P ↔ Q) ∨ (R ↔ Q)) :=
begin
  tauto!,
  

end

/-Hint : Cheat code
Lean has more advanced tactics that can solve all of the levels very quickly. For example,
using the `tauto!` tactic should allow you to solve the whole game! (but what's the fun in that?)
-/