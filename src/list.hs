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
unzipp [] = ([], [])
unzipp ((x, y) : xys) = ([x], [y]) +~ unzipp xys

incAll :: [Int] -> [Int] -- increase elements by 1
incAll = map (+ 1)

onlyBig :: [Int] -> [Int] -- keep only elements >10
onlyBig = filter (> 10)

sumSquares :: [Int] -> Int -- sum of squares of all numbers
sumSquares [] = 0
sumSquares (x : xs) = x^2 + sum xs

countPos :: [Int] -> Int
countPos xs = length (filter (> 0) xs)

-- Combine them: “sum of squares of numbers > 10”
combineThem :: [Int] -> Int
combineThem = sumSquares . onlyBig

main :: IO ()
main = do
  print (maxi [5, 2, 4, 9])
  print (sumi [5, 2, 4, 9])
  print (zipp [1, 2, 3] [True, False, False])
  print (unzipp [(1, True), (2, False), (3, False)])
  print (incAll [1, 3, 5])
  print (onlyBig [1, 3, 5, 15])
  print (sumSquares [1, 1, 1])
  print (countPos [1, 3, 5, -1, -5, -2])
  print (combineThem [1, 1, 1, 22])
