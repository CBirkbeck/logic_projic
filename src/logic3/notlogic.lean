/- Axiom : not_iff_imp_false (P : Prop) :
¬ P ↔ P → false
-/

/-
By definition $\lnot Q$ is equivalent to $Q\implies {\tt false}$. Lets call this result

`not_iff_imp_false (P : Prop) : ¬ P ↔ (P → false)`

-/
lemma not_iff_imp_false (P : Prop) : ¬ P ↔ P → false := iff.rfl -- hide
/-

In order to use it, lets look at a new tactic.

## The `rw` tactic

The  <mark style ="background-color : #ebdef0 ">`rw`</mark>  tactic (short for `rewrite`) is a tactic 
that allows you to substitute in things. For example, if we have the
assumption `h : P ↔ Q`, then `rw h` will replace the `P`'s in the goal with `Q`'s. If instead you would like to 
turn all of the `Q`'s in your goal to `P`'s then using `rw ←h` will do this. (To get the `←` arrow, type `\l`).

Combining `rw` and `not_iff_imp_false`, try to prove the following:

-/

/- Hint : Hint
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

/-Hint : Tip
If you want to use the `rw` tactic at one of your assumptions then you can type `rw h1 at h2`. 
If, for example, we had `h1 : P ↔ Q` then this would change all the `P`'s in the assumption `h2` to `Q`'s.   

-/


/- Tactic : rw 

The `rw` tactic is a tactic that allows you to substitute in things. For example, if we have the
assumption `h: P ↔ Q`, then `rw h` will replace the `P`'s in the goal with `Q`'s. If instead you would like to 
turn all of the `Q`'s in your goal to `P`'s then using `rw ←h` will do this. (To get the `←` arrow, type `\l`).

If you want to use the `rw` tactic at one of your assumptions then you can type `rw h1 at h2`. 
If we had `h1 : P ↔ Q` then this would change all the `P`'s in the assumption `h2` to `Q`'s.

-/