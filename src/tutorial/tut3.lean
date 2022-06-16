import tactic --hide 

/-

#Combining logical statements

Now, we can take these statements and create new ones. For example if we have two statements 
`P Q : Prop` we can write ` P → Q` to mean $P$ implies $Q$. Similarly, we can write `¬P` for the 
statement "Not $P$". 

Say we have the following lemma:

```
P Q : Prop
h : P → Q
p : P
⊢ Q
```
This asks us to prove: If $P$ implies $Q$ (which is written ` P → Q`) and we have a proof of $P$ 
(i.e. we have `p : P`). Then $Q$ is true (i.e. we have a proof of `Q`). 

Here we have given the name $h$ to the implication ` P → Q`. We think of $h$ as a map between 
statements in `Prop` world. 

Now this lemma is asking us to take a proof of $P$ and turn it into a proof of $Q$. Since we know 
that $P$ implies $Q$ then we know that if $P$ is true then so is $Q$. So we can use our map in 
`Prop` world to transform our proof of $P$ into a proof of $Q$. 

If we write `exact h(p)` below we get what we want.

Note that it has to be lower case $p$, since $P$ is the logical statement, but what we want to 
transform is the proof.



-/

/- Lemma
If $P$ implies $Q$ (which is written ` P → Q`) and we have a proof of $P$ (i.e. we have `p : P`). 
Then $Q$ is true (i.e. we have a proof of `Q`)
-/
lemma implications_one (P Q : Prop) (h : P → Q) (p : P) : Q :=
begin
  exact h(p),



end