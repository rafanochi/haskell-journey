newtype Sum a = Sum a

newtype Product a = Product a

class SemiGroup a where
  (<<>>) :: a -> a -> a

instance SemiGroup [a] where
  (<<>>) = (++)

instance (Num a) => SemiGroup (Sum a) where
  Sum a <<>> Sum b = Sum $ a + b

instance (Num a) => SemiGroup (Product a) where
  Product x <<>> Product y = Product $ x * y

class (SemiGroup a) => MonoiD a where
  empty :: a

  moncat :: (MonoiD a) => [a] -> a
  moncat = foldr (<<>>) empty

instance MonoiD [a] where
  empty = []

instance (Num a) => MonoiD (Sum a) where
  empty = Sum 0

instance (Num a) => MonoiD (Product a) where
  empty = Product 0
