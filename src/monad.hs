{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
import GHC.Internal.TH.Lib (safe)

{-# HLINT ignore "Replace case with maybe" #-}
{-# HLINT ignore "Replace case with fromMaybe" #-}
{-# HLINT ignore "Use join" #-}
{-# HLINT ignore "Use const" #-}
{-# HLINT ignore "Avoid lambda" #-}
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

{- evalM :: Expr -> Maybe Int
evalM (Val x) = Just x
evalM (Div a b) = evalM  h -}

flatMap :: Maybe a -> (a -> Maybe b) -> Maybe b
flatMap m f = case m of
  Nothing -> Nothing
  Just x -> f x

evalM :: Expr -> Maybe Int
evalM (Val x) = Just x
evalM (Div a b) = flatMap (evalM a) 
  (\m -> flatMap (evalM b) (safediv m) )   


main :: IO ()
main = do
  print (eval (Div (Val 4) (Val 2)))
  print (evalM (Div (Val 4) (Val 2)))