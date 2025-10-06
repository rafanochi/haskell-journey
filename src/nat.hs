data Nat = Zero | Succ Nat

instance Num Nat where
  (+) :: Nat -> Nat -> Nat
  Zero + b = b
  Succ a + b = Succ (a + b)

  (*) :: Nat -> Nat -> Nat
  Zero * _ = Zero
  Succ a * b = Succ (a * b)

  (-) :: Nat -> Nat -> Nat
  Zero - _ = Zero
  m - Zero = m
  Succ a - Succ b = a - b

  abs :: Nat -> Nat
  abs n = n
