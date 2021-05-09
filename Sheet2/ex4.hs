data MultTree a = MultNode a [MultTree a] deriving Show
{-
Consider the following data type which represents non-empty trees whose nodes may have arbitrary many
children:
data MultTree a = MultNode a [MultTree a] deriving Show
Write a function
zipWithMult :: (a -> b -> c) -> MultTree a -> MultTree b -> MultTree c 
that behaves similar to the function zipWith for lists, i.e., it combines the two input trees using the given function of type a -> b -> c. Nodes that have no corresponding node in the other tree are dropped. In this way, a new
MultTree c is constructed.
-}
zipWithMult f (MultNode x xs) (MultNode y ys) = MultNode (f x y) (zipWith (zipWithMult f) xs ys)

