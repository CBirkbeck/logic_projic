import tactic --hide

/-

#Logical statements 

You've seen logical statements already, these are statements that can be true or false, for example: 

-The sum of two odd numbers is an even number

-$36$ is divisible by $3$

-$x > 2$


Lets see how one does this a computer, specifically in lean. In lean, logical staments live in a 
world called `Prop`. So for example if we write `P : Prop` we mean "$P$ is a logical statement." 
Think of the `:` symbol as saying $P$  is a resident of `Prop` world (in maths this would be denoted
by something like `P ∈ Prop`).

#Truth Values

The truth value of a logical statement (i.e. some `P : Prop`) is whether the statement is true or 
false.  For example, the truth value of the statement: "For all integers $x ∈ ℤ$,  $0 ≤ x^2$" 
is *true* while  "For all integers $x ∈ ℤ$,  $0 ≤ x^3$" is *false*. 

In lean we assign truth values as follows: We first think of a proposition $P$ as a set with 
*at most* one element.  If this set is empty, then we say `P` is *false*. Otherwise, if this set has 
an element, lets call it $p$ (we will usually use upper case letters for logical statements, 
and lower case for their proofs), then this  statement is *true* and $p$ is the proof. 

So to recap, if $P$ is the true/false statement (the statement of proposition), and $p$ is its proof.
It's like thinking $P$ being the set and $p$ being the element. Just as above, where we had 
`P : Prop` to mean $P$  is a proposition, we write `p : P` to mean "$p$ is a proof of $P$".

The aim of this game is to learn how to manipulate logical statements and their proofs. 
Lets start with a super basic example of how a lemma looks like in lean.

This is where the window on the right will come into play. If you delete the *sorry* below, 
on the right you will  see the following: 

```
P : Prop,
p : P,
⊢ P
```

Here the first two lines are our assumptions and the thing after the `⊢` symbol is what we are 
being asked to prove. 

Now, in this game our "moves" or, as we call them in lean, *Tactics*, are what will allow us to 
manipulate our statement and produce proofs.

The first tactic we will look at is called *exact* and what it does is, if you need to prove a 
statement $P$ and you have proof of it, say, `p: P`, then `exact p` will prove it. 

Note that at the end of each line we write we need to have a comma `,` to tell lean that this is the 
end of our move. 

So if below you change the `sorry` for "`exact p,`" (don't forget the comma!) you'll see that on the 
right it will change to say `Proof complete!`. 

-/


/- Lemma
Lets try and prove that if $P$ is a logical stament (i.e. `P : Prop`) and $p$ is a proof of $P$ 
(i.e. `p : P`) then $P$ is true.
-/
lemma example1 (P : Prop) (p : P) : P :=
begin
  exact p,


end

/- Tactic : exact
## Summary 
If the goal is `⊢ P` then `exact p` will close the goal if
and only if `p` is a proof of `P` (i.e. `p : P`) 
## Details
Say $P$, $Q$ and $R$ are logical staments
and the local context looks like this: 
```
p : P,
h : P → Q,
j : Q → R
⊢ R
```
If you can spot how to make a term of type `R`, then you
can just make it and say you're done using the `exact` tactic
together with the formula you have spotted. For example the
above goal could be solved with
`exact j(h(p)),`
because $j(h(p))$ is easily checked to be a term of type $R$
(i.e., an element of the set $R$, or a proof of the proposition $R$).
-/