zipWithMult :: (a -> b -> c) -> MultTree a -> MultTree b -> MultTree c
zipWithMult f (MultNode n_0 []) (MultNode n_1 []) = MultNode (f n_0 n_1) []
zipWithMult f (MultNode n_0 subtrees_0) (MultNode n_1 subtrees_1) = MultNode (f n_0 n_1) (zipWith (zipWithMult f) subtrees_0 subtrees_1)


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
