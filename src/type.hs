data LinkedList a = Empty | Node a (LinkedList a)

ihead :: LinkedList a -> a
ihead (Node x _) = x

itail :: LinkedList a -> a
itail (Node x Empty) = x
itail (Node _ xs) = itail xs
