(~) :: Int -> Int -> Int
x ~ y
  | x > y = x
  | otherwise = y

maxi :: [Int] -> Int
maxi [x] = x
maxi (x : xs) = x ~ maxi xs

sumi :: [Int] -> Int
sumi [x] = x
sumi (x : xs) = x + sum xs

zipp :: [a] -> [b] -> [(a, b)]
zipp [] [] = []
zipp (x : xs) (y : ys) = (x, y) : zipp xs ys

main :: IO ()
main = do
  print (maxi [5, 2, 4, 9])
  print (sumi [5, 2, 4, 9])
  print (zipp [1, 2, 3] [True, False, False])