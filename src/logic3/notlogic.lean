/- Axiom : not_iff_imp_false (P : Prop) :
¬ P ↔ P → false
-/

/-
There is a false proposition `false`, with no proof. It is
easy to check that $\lnot Q$ is equivalent to $Q\implies {\tt false}$. Lets call this

`not_iff_imp_false (P : Prop) : ¬ P ↔ (P → false)`

-/
lemma not_iff_imp_false (P : Prop) : ¬ P ↔ P → false := iff.rfl -- hide
/-

In order to use it, lets look at a new tactic.

## The `rw` tactic

The `rw` tactic or ``rewrite`` is a tactic that allows you to substitute in things. For example, if we have the
assumption `h: P ↔ Q`, then `rw h` will replace the `P`'s in the goal with `Q`'s. If instead you would like to 
turn all of the `Q`'s in your goal to `P`'s then using `rw ←h` will do this. (To get the `←` arrow, type `\l`)


(This also works for equalities, but we won't see them in this game).


Using `rw` and `not_iff_imp_false`, try to prove the following:

-/

/- Hint : using rw
 Start by using `rw not_iff_imp_false,` and see what changes.
-/


/- Lemma 
If $P$ and $Q$ are propositions, and $P\implies Q$, then
$\lnot Q\implies \lnot P$. 
-/
lemma contrapositive (P Q : Prop) : (P → Q) → (¬ Q → ¬ P) :=
begin
  rw not_iff_imp_false,
  rw not_iff_imp_false,
  intro f,
  intro h,
  intro p,
  apply h,
  apply f,
  exact p,


end

/-


-/


/- Tactic : rw 

The `rw` tactic or ``rewrite`` is a tactic that allows you to substitute in things. For example, if we have the
assumption `h: P ↔ Q`, then `rw h` will replace the `P`'s in the goal with `Q`'s. If instead you would like to 
turn all of the `Q`'s in your goal to `P`'s then using `rw ←h` will do this. (To get the `←` arrow, type `\l`)

-/