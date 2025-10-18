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

(+~) :: ([a], [b]) -> ([a], [b]) -> ([a], [b])
(xs, ys) +~ (as, bs) = (xs ++ as, ys ++ bs)

unzipp :: [(a, b)] -> ([a], [b])
unzipp [] = ([],[])
unzipp ((x, y) : xys) = ([x], [y]) +~ unzipp xys

incAll :: [Int] -> [Int] -- increase elements by 1
incAll = map (+1)

main :: IO ()
main = do
  print (maxi [5, 2, 4, 9])
  print (sumi [5, 2, 4, 9])
  print (zipp [1, 2, 3] [True, False, False])
  print (unzipp [(1, True), (2, False), (3, False)])