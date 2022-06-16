import tactic --hide

universe u --hide

-- Level name : apply tactic

/-
Lets look at using the apply tactic:

Here's an example we have already done, but try and do it using the apply tactic:

-/


/- Lemma
Lets try and prove that if `P` implies `Q` (which is written ` P → Q`) and we have a proof of `P` 
(i.e. we have `p : P`). Then `Q` is true (i.e. we have a proof of `Q`)
-/

lemma implications_one_again (P Q : Prop) (h : P → Q) (p : P) : Q :=
begin
  apply h,
  exact p,



end

/- Tactic : apply

## The `apply` tactic

If your tactic state is

```
hPQ : P → Q
⊢ Q
```

then the tactic

`apply hPQ,`

will change it to

```
hPQ : P → Q
⊢ P
```

The `apply` tactic is useful for *arguing backwards*. It reduces the goal to a potentially easier 
goal, without changing any hypotheses.
-/