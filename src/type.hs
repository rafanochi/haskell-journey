data LinkedList = Empty | Node Int LinkedList

ihead :: LinkedList -> Int
ihead (Node x _) = x

itail :: LinkedList -> Int
itail (Node x Empty) = x
itail (Node _ xs) = itail xs
