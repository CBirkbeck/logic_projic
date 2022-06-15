import tactic --hide

universe u --hide

-- Level name : Propositions

/-



If your goal is to prove `P → Q` (i.e. that $P\implies Q$)
then `intro p`, meaning "assume $p$ is a proof of $P$", will make progress.
To solve the goal below, you have to come up with a function from
`P` (thought of as the set of proofs of $P$!) to itself. Start with
`intro p,`
(i.e. "let $p$ be a proof of $P$") and note that our
local context now looks like this:
```
P : Prop,
p : P
⊢ P
```
Our job now is to construct a proof of $P$. But $p$ is a proof of $P$.
So
`exact p,`
will close the goal. Note that `exact P` will not work -- don't
confuse a true/false statement (which could be false!) with a proof.
We will stick with the convention of capital letters for propositions
and small letters for proofs.
-/ 


/- Lemma : no-side-bar
If $P$ is a proposition then $P\implies P$.
-/
lemma implies_self (P : Prop) : P → P :=
begin
  intro p,
  exact p,

  
end