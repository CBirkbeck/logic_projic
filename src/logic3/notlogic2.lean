
import tactic --hide

lemma not_iff_imp_false (P : Prop) : ¬ P ↔ P → false := iff.rfl -- hide
lemma contra (P Q : Prop) : (P ∧ ¬ P) → Q := by {cc} --hide
lemma P_not_P_false (P : Prop) : P ∧ ¬ P → false := by {cc} --hide

/-
We proved earlier that `(P → Q) → (¬ Q → ¬ P)`. The converse,
that `(¬ Q → ¬ P) → (P → Q)` is certainly true, but trying to prove
it using the tactics we've learnt so far is impossible. 
-/

/-Hint : Why is this impossible?
 
Suppose we tried to prove this with the tactics we have seen so far, then our proof might look 
something like:
```
intro h,
intro p,
rw not_iff_imp_false at h,
rw not_iff_imp_false at h,
```
You are then left with the following state:
```
P Q : Prop,
h : (Q → false) → P → false
p : P
⊢ Q
```
and now we are stuck. In fact, using tactics such as `intro` and `apply` you will never be able to 
prove this lemma as this is not provable in "constructive logic". The key in proving this is to use 
Lean's version of a truth table!

-/

/-
In order to continue we need a new tactic.

## The `by_cases` tactic

Instead of starting with all the `intro`s, try this instead: <mark style ="background-color : #ebdef0 ">`by_cases hp : P; by_cases hq : Q,`</mark>


**Note the semicolon**! It means "do the next tactic to all the goals, not just the first".
After doing this in the lemma below, you will see there are four goals, one for each of the four 
possibilities for `P,Q`, i.e., `P Q = true true`, `true false`, `false true`, `false false`.
You can see that `hp` is a proof of `P` in some of the goals, and a proof of `¬ P` in others.
Similarly with `hq`. 

Note that using `by_cases` is Lean's version of a truth table, where each row of a truth table corresponds
to a new goal.

-/


/- Lemma :
If $P$ and $Q$ are true/false statements, then
$(\lnot Q\implies \lnot P)\implies(P\implies Q).$
-/
lemma contrapositive_2 (P Q : Prop) : (¬ Q → ¬ P) → (P → Q) :=
begin
  by_cases p : P; by_cases q : Q,
  intros h hh,
  exact q,
  intros h hh,
  exfalso,
  rw not_iff_imp_false at h,
  rw not_iff_imp_false at h,
  rw not_iff_imp_false at q,
  apply h,
  exact q,
  apply p,
  intros h hh,
  exact q,
  intros h hh,
  exfalso,
  apply P_not_P_false P,
  split,
  exact hh,
  apply h,
  exact q,


end

/-Hint : Why does this work?
This approach assumed that `P ∨ ¬ P` was true; then `by_cases` tactic just does `cases` on
this result. `P ∨ ¬ P` being true is called the law of the excluded middle, and it cannot be proved just
using tactics such as `intro` and `apply`.
-/

/-Tactic : by_cases
 
The ``by_cases`` tactic is a simple truth table tactic: ``by_cases P`` turns one goal into two goals, 
with ``P`` is assumed in the first, and ``¬P`` in the second.

Examples
--------

1) If ``P`` is a proposition, then ``by_cases P`` turns your goal into two goals, 
and in each of your new tactic states you have one extra hypothesis. 
In the first one you have a new hypothesis ``h : P`` and in the second you have a new hypothesis ``h : ¬P``.

2) If you already have a hypothesis ``h`` then this can get a bit confusing, 
so you can also do ``by_cases hP : P``; then your new hypotheses will be ``hP : P`` and ``hP : ¬P``.
-/