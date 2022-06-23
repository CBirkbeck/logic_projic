import tactic --hide


/-Lemma
Lets prove that $(P \implies Q) ∧ (Q \implies R)$ is equivalent to 
  $(P \implies R) ∧ ((P ↔ Q) ∨ (R ↔ Q))$
-/
lemma and_impl_equiv (P Q R : Prop) : (P  → Q) ∧ (Q → R) ↔ (P → R) ∧ ((P ↔ Q) ∨ (R ↔ Q)) :=
begin
  
  --by_cases hp : P; by_cases hq: Q; by_cases hr : R,
split,
  intro h,
  split,
  intro p,
  apply h.2,
  apply h.1,
  exact p,
  by_cases hp : P; by_cases hq : Q; by_cases hr: R,
  repeat{ cc},
  intro h,
  by_cases hp : P; by_cases hq : Q; by_cases hr: R,
  repeat {cc},
end