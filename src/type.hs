data LinkedList a = Empty | Node a (LinkedList a)

ihead :: LinkedList a -> a
ihead (Node x _) = x

itail :: LinkedList a -> a
itail (Node x Empty) = x
itail (Node _ xs) = itail xs

inull :: LinkedList a -> Bool
inull Empty = True
inull _ = False

ilength :: LinkedList a -> Int
ilength Empty = 0
ilength (Node x xs) = ilength xs + 1 
