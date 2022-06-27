
import tactic --hide

lemma not_iff_imp_false (P : Prop) : ¬ P ↔ P → false := iff.rfl -- hide

/-
##  Proof by contradiction. 

In this level we want to prove that ` P ∧ (¬ P) → Q` is true for any propositions `P`
and `Q`. One way to see that this is true is to note that left hand side is `false` and in the 
previous level we saw that `false → Q` is always true.

Try solving this level using the `exfalso` tactic from the previous level.
-/

/- Lemma 
If $P$ and $Q$ are true/false statements, then
$(P\land(\lnot P))\implies Q.$
-/
lemma contra (P Q : Prop) : (P ∧ ¬ P) → Q :=
begin
  intro h,
  cases h with p np,
  rw not_iff_imp_false at np,
  exfalso,
  apply np,
  exact p,


end

/-Hint : Tip
If you want to use to use this result later on then you can type `apply (contra P Q)` where `P,Q` are
the assumptions you want to use. You can also use the tactics `by_contra` and
`contradiction` to achieve similar results. 

-/

