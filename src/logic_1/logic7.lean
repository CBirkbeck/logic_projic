import tactic --hide


/-
For the next one you might need to note the following:

If we have the assumption `h : P → Q → R` with goal `⊢ R` and you `apply h`, then you'll get
two goals! 

Note that tactics operate on only the first goal. So you'll have to first prove the 
first goal and then move onto the second. 

Tip:  If you have multiple goals and you want to work on one that isnt the first one you can 
write `sorry,` to skip a proving a goal (although you will need to come back to it 
eventually to complete the proof!)
-/

/-Lemma 
Prove $(P \implies Q \implies R) \implies ((P \implies Q) \implies (P \implies R)$
-/
lemma lemma5 (P Q R : Prop) : (P → Q → R) → (P → Q) → (P → R) :=
begin
  intros hPQR hPQ hP,
  apply hPQR,
  { exact hP },
  { apply hPQ,
    exact hP }



end