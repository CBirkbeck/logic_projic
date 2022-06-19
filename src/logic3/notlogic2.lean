
import tactic --hide

lemma not_iff_imp_false (P : Prop) : ¬ P ↔ P → false := iff.rfl -- hide
lemma contra (P Q : Prop) : (P ∧ ¬ P) → Q := by {cc} --hide

/-
We proved earlier that `(P → Q) → (¬ Q → ¬ P)`. The converse,
that `(¬ Q → ¬ P) → (P → Q)` is certainly true, but trying to prove
it using what we've learnt so far is impossible (because it is not provable in
constructive logic). For example, after
```
intro h,
intro p,
repeat {rw not_iff_imp_false at h},
```
in the below, you are left with
```
P Q : Prop,
h : (Q → false) → P → false
p : P
⊢ Q
```
The tools you have are not sufficient to continue. But you can just
prove this, and any other basic lemmas of this form like `¬ ¬ P → P`,
using the `by_cases` tactic. Instead of starting with all the `intro`s,
try this instead:
`by_cases p : P; by_cases q : Q,`
**Note the semicolon**! It means "do the next tactic to all the goals, not just the top one".
After it, there are four goals, one for each of the four possibilities PQ=TT, TF, FT, FF.
You can see that `p` is a proof of `P` in some of the goals, and a proof of `¬ P` in others.
Similar comments apply to `q`. 

Note that using `by_cases` is the same as doing a truth table for the result you want to prove.

You may also want to use some of the previous results we have used, for example the `contra` lemma we proved
in the previous level. To use this try something like `apply contra P Q`. Alternatively, there is a tactic 
`contradiction` that will look at your assumptions and try and close the goal for you.


-/

/-Hint : Hint
Along with `by_cases p : P; by_cases q : Q,` you may also want to use `apply contra P false`
-/


/- Lemma : no-side-bar
If $P$ and $Q$ are true/false statements, then
$$(\lnot Q\implies \lnot P)\implies(P\implies Q).$$ 
-/
lemma contrapositive2 (P Q : Prop) : (¬ Q → ¬ P) → (P → Q) :=
begin
  by_cases p : P; by_cases q : Q,
  intros h hh,
  exact q,
  intros h hh,
  exfalso,
  apply contra P false,
  split,
  exact hh,
  apply h,
  exact q,
  intros h hh,
  exact q,
  intros h hh,
  exfalso,
  apply contra P false,
  split,
  exact hh,
  apply h,
  exact q,


end

/-
This approach assumed that `P ∨ ¬ P` was true; the `by_cases` tactic just does `cases` on
this result. This is called the law of the excluded middle, and it cannot be proved just
using tactics such as `intro` and `apply`.
-/

/-Tactic : by_cases

All propositional logic problems can in theory be solved by just throwing a truth table at them. 
The ``by_cases`` tactic is a simple truth table tactic: ``by_cases P`` turns one goal into two goals, 
with ``P`` is assumed in the first, and ``Â¬P`` in the second.

Examples
--------

1) If ``P`` is a proposition, then ``by_cases P`` turns your goal into two goals, 
and in each of your new tactic states you have one extra hypothesis. 
In the first one you have a new hypothesis ``h : P`` and in the second you have a new hypothesis ``h : ¬P``.

2) If you already have a hypothesis ``h`` then this can get a bit confusing, 
so you can also do ``by_cases hP : P``; then your new hypotheses will be ``hP : P`` and ``hP : ¬P``.
-/