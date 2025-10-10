(~) :: Int -> Int -> Int
x ~ y
  | x > y = x
  | otherwise = y

maxi :: [Int] -> Int
maxi [x] = x
maxi (x:xs) = x ~ maxi xs

main::IO()
main = do
    print(maxi[5,2,4,9])