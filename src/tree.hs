data Tree a = Empty | Node a (Tree a) (Tree a)

example :: Tree Int
example =
  Node
    0
    ( Node
        1
        (Node 2 Empty Empty)
        (Node 3 Empty Empty)
    )
    (Node 4 Empty Empty)

height :: Tree a -> Int
height Empty = 0
height (Node _ l r) = 1 + max (height l) (height r)

-- only works for BST
tlookup :: (Ord a) => Tree a -> a -> Maybe a
tlookup Empty _ = Nothing
tlookup (Node x l r) y
  | x < y = tlookup l y
  | x > y = tlookup r y
  | otherwise = Just x

-- only works for BST
insert :: (Ord a) => Tree a -> a -> Tree a
insert Empty y = Node y Empty Empty
insert (Node x l r) y
  | x < y = Node x (insert l y) r
  | x > y = Node x l (insert r y)
  | otherwise = Node x l r
