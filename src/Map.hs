import Data.Map qualified as Map

values :: Map.Map String Integer
values = Map.fromList [("z", 3), ("a", 6)]

nv :: Map.Map String Integer
nv = Map.insert "x" 7 values

nvv = Map.insert "y" 10 $ Map.insert "m" 0 values 

main :: IO ()
main = do
  print (Map.lookup "z" values)
  print (Map.lookup "i" values)
  print (Map.lookup "m" nvv)