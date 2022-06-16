import tactic --hide

universe u --hide

-- Level name : intro

/-

Lets look at an example that needs the `intro` tactic: 

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

/- Tactic : intro

## The `intro` tactic.

If your goal is

```
⊢ P → Q
```

then the tactic

`intro hP,`

will turn your tactic state into

```
hP : P
⊢ Q
```

Variant: `intros` can be used to introduce
more than one assumption at once. Don't forget
to name your hypotheses, e.g. `intros hP hQ` if your goal is `P → Q → <something else>`.

-/