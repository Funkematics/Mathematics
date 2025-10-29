import LogicProofs.Basic
import Mathlib.Data.Nat.Basic

#check And
#check Or
#check Not

variable (p q r : Prop)

#check And p q
#check Or (And p q) r

def Implies (P Q : Prop) : Prop := P → Q
--Wrapper for arrow, tutorial uses it but doesn't
--define it weirdly enough, so we define it here

variable (P Q : Prop)
#check Implies

#check Implies (And p q) (And q p)
#check (And p  q) → (And q  p)
--Logically equivalent statements above
