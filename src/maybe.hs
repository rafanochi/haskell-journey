data Expr = Val Int | Div Expr Expr | Mul Expr Expr | Sub Expr Expr | Add Expr Expr

eval :: Expr -> Maybe Int
eval (Val x) = Just x

eval (Div y z) = case eval y of
  Nothing -> Nothing
  Just a -> case eval z of
    Nothing -> Nothing
    Just b -> Just (a `div` b)

eval (Mul y z) = case eval y of
  Nothing -> Nothing
  Just a -> case eval z of
    Nothing -> Nothing
    Just b -> Just (a * b)

eval (Sub y z) = case eval y of
  Nothing -> Nothing
  Just a -> case eval z of
    Nothing -> Nothing
    Just b -> Just (a - b)

eval (Add y z) = case eval y of
  Nothing -> Nothing
  Just a -> case eval z of
    Nothing -> Nothing
    Just b -> Just (a + b)

main :: IO ()
main = do
  print (eval (Div (Val 1) (Val 1)))
  print (eval (Mul (Val 1) (Val 1)))
  print (eval (Sub (Val 1) (Val 1)))
  print (eval (Add (Val 1) (Val 1)))
