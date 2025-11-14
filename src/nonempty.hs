data NonEmpty a = a :| [a]

nonEmpty :: [a] -> Maybe (NonEmpty a)
nonEmpty [] = Nothing
nonEmpty (x : xs) = Just (x :| xs)

toList :: NonEmpty a -> [a]
toList (x :| xs) = x : xs

neHead :: NonEmpty a -> a
neHead (x :| _) = x

neLast :: NonEmpty a -> a
neLast (x :| []) = x
neLast (x :| xs) = last xs
