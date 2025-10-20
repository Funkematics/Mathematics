import LeanTest.Basic
import Mathlib.Data.Set.Basic
import Mathlib.Data.Real.Basic
import Lean.Elab.Command

theorem and_commutative (p q : Prop) : p ∧ q → q ∧ p :=
  fun hpq : p ∧ q =>                  --Suppose we have h(pq) such that p ^ q
  have hp : p := And.left hpq
  have hq : q := And.right hpq
  show q ∧ p from And.intro hq hp

-- First example in book
--Evals and def tests below
#eval 5 * 4
#eval 10 * 40
#eval 4/3         --Note, spits out 1 because Natural Numbers

def m : ℕ := 2
def n : ℕ := 0

def z : ℚ := 1/2    --Real numbers are uncomputable in Lean, but rationals are computable

def b : Bool := true
def c : Bool := false

#eval m + n
#eval z + m

#check m

#check m + 0

#check z + n

#check b

#check b || c

#check Nat → Nat

#check ℕ → ℚ

#eval Nat.succ 2

#check (5,0,2).1

def α : Type := ℕ
def β : Type := Bool
def F : Type → Type := List
def G : Type → Type → Type := Prod

#check α
#check F α
#check F ℕ
#check G α

universe u

#check Prop
#check Prod
#check max

#check fun (x : ℕ) => x + 5
#check λ (x : ℕ) => x + 5  -- Lambda and fun are the same, lambda is deprecated as syntax though

#eval (fun x : ℕ => x + 5) 10 --function application and evaluation

#check fun x : ℕ => fun y : Bool => if not y then x + 1 else x + 2
#check fun (x : ℕ) (y : Bool) => if not y then x + 1 else x + 2
#check fun x y => if (!y) = true then x + 1 else x + 2

--These three above are logically equivalent statements

#check let y := 2 + 2; y * y
#eval let y := 2 + 2; y * y

def twice_double (x : ℕ) : ℕ :=
  let y := x + x; y * y

#eval twice_double 10

#check let y := 2 + 2; let z := y + y; z * z
#eval let y := 2 + 2; let z := y + y; z * z

#check let a := 2 + 2
  let b := a + a
  b * b

#eval let a := 2 + 2
  let b := a + a
  b * b

def t (x : ℕ) : ℕ :=
  let y := x + x
  y * y

#eval t 3

--Variables and Sections

def compose (α β γ : Type) (g : β → γ) (f : α → β) (x : α) : γ :=
  g (f x)

def doTwice (h : α → α) (x : α) : α :=
  h (h x)

def doThrice (h : α → α) (x : α) : α :=
  h (h (h x))

variable (α β γ : Type)
variable (g : β → γ) (f : α → β) (h : α → α)
variable (x : α)

def compose_1 := g ( f x)
def doTwice_1 := h ( h x)
def doThrice_1 := h (h (h x))

#print compose_1


--Section can limit scope/private stuff

section useful

variable (α β γ : Type)
variable (g : β → γ) (f : α → β) (h : α → α)
variable (x : α)

def compose_2 := g (f x)
def doTwice_2 := h (h x)
def doThrice_2 := h (h (h x))

end useful

namespace Foo
  def a_1 : ℕ := 5
  def f_1 (x : ℕ) : ℕ := x + 7
end Foo

#check List.nil
#check List.cons
#check List.map
