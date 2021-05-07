--a)
data IndexedTree a = Node [(IndexedTree a,a)] | Leaf [a]

--b)
treeToList :: IndexedTree a -> [a]
treeToList (Leaf xs) = xs
treeToList (Node []) = []
treeToList (Node ((child,index):rest_children)) = (treeToList child) ++ (treeToList (Node rest_children))

--c)
contains :: Ord a => a -> IndexedTree a -> Bool
contains x (Node ((child_0,index_0):(child_1,index_1):rest_Children)) | x < index_0 = False
                                                                      | x < index_1 = (contains x child_0)
                                                                      | otherwise = (contains x (Node ((child_1,index_1):rest_Children)))
contains x (Node ((child,index):[])) = contains x child   
contains x (Node []) = False
contains x (Leaf xs) | x > last xs = False
                     | otherwise = elem x xs 

-- the tree shown in Figure 1
node_head = Node [(node_2,3),(node_3, 32)]
node_2 = Node [(node_4, 3),(node_5, 12),(node_6, 26)]
node_3 = Node [(node_7, 32),(node_8, 101)]
node_4 = Leaf [3,7,8]
node_5 = Leaf [12,23]
node_6 = Leaf [26]
node_7 = Leaf [32,43,98]
node_8 = Leaf [101]
