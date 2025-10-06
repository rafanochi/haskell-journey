data Nat = Zero | Succ Nat

instance Num Nat where
  (+) :: Nat -> Nat -> Nat
  Zero + b = b
  Succ (a) + b = Succ (a + b)
