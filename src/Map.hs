import Data.Map qualified as Map

values :: Map.Map String Integer
values = Map.fromList [("z", 3), ("a", 6)]

nv :: Map.Map String Integer
nv = Map.insert "x" 7 values

nvv :: Map.Map String Integer
nvv = Map.insert "y" 10 $ Map.insert "m" 0 values

cnvv = Map.insert "y" 100000 nvv

withdraw :: String -> Int -> Map.Map String Int -> Maybe (Map.Map String Int)
withdraw account amount database =
  Map.lookup account database >>= (\x -> Just (Map.insert account (x - amount) database))

main :: IO ()
main = do
  print (Map.lookup "z" values)
  print (Map.lookup "i" values)
  print (Map.lookup "m" nvv)
  print (Map.lookup "x" cnvv)