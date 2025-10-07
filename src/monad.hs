{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Replace case with maybe" #-}
safediv :: Int -> Int -> Maybe Int
safediv _ 0 = Nothing
safediv m n = Just $ m `div` n

data Expr = Val Int | Div Expr Expr

eval :: Expr -> Maybe Int
eval (Val x) = Just x
eval (Div a b) = case eval a of
  Nothing -> Nothing
  Just m -> case eval b of
    Nothing -> Nothing
    Just n -> safediv m n

(<<=) :: Maybe a -> (a -> Maybe b) -> Maybe b
m <<= f = case m of
  Nothing -> Nothing
  Just x -> f x

evalM :: Expr -> Maybe Int
evalM (Val x) = Just x
evalM (Div a b) = evalM a <<=
    ((evalM b) <<= safediv)

main :: IO ()
main = do
  print (eval (Div (Val 1) (Val 2)))