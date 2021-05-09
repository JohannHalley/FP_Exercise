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


t1 = MultNode 8 [t1_subtree_0,t1_subtree_1]
t1_subtree_0 = MultNode 3 [t1_leaf_0,t1_leaf_1,t1_leaf_2]
t1_subtree_1 = MultNode 4 [t1_leaf_3]
t1_leaf_0 =  MultNode (-56) []
t1_leaf_1 =  MultNode 4 []
t1_leaf_2 =  MultNode 987 []
t1_leaf_3 =  MultNode 6 []

t2 = MultNode (-2) [t2_subtree_0,t2_subtree_1]
t2_subtree_0 = MultNode 5 [t2_leaf_0,t2_leaf_1]
t2_subtree_1 = MultNode (-9) [t2_leaf_2, t2_leaf_3]
t2_leaf_0 =  MultNode 16 []
t2_leaf_1 =  MultNode 7 []
t2_leaf_2 =  MultNode 1 []
t2_leaf_3 =  MultNode 5 []

{-Test
:l ex4
zipWithMult (+) t1 t2

-}