class Teng a where
  (====) :: a -> a -> Bool
  (/===) :: a -> a -> Bool

instance Teng Int where
  a ==== b = True
  a /=== b = False
