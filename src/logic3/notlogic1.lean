
import tactic --hide

lemma not_iff_imp_false (P : Prop) : ¬ P ↔ P → false := iff.rfl -- hide

/-
##  `exfalso` and proof by contradiction. 
It's certainly true that $P\land(\lnot P)\implies Q$ for any propositions $P$
and $Q$, because the left hand side of the implication is false. But how do
we prove that `false` implies any proposition $Q$? A cheap way of doing it in
Lean is using the `exfalso` tactic, which changes any goal at all to `false`. 
You might think this is a step backwards, but if you have a hypothesis `h : ¬ P`
then after `rw not_iff_imp_false at h,` you can `apply h,` to make progress. 
Try solving this level using `exfalso.
-/



/- Lemma 
If $P$ and $Q$ are true/false statements, then
$$(P\land(\lnot P))\implies Q.$$
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

/-Tactic : exofalso
This changes any goal to `false`.
-/