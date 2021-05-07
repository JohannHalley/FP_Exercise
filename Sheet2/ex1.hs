{-
Consider a tree-like data structure which has the following properties:
(1) All elements are stored in the leaves of the tree.
(2) The elements are stored in a sorted way, i.e.,
• for each inner node with m children, all elements stored in the subtree rooted by its n
th child are
smaller than all elements stored in the subtree rooted by its (n + 1)th child if 0 < n < m and
• for each leaf l with m elements, the n
th element stored within l is smaller than the (n + 1)th element
stored within l if 0 < n < m.
(3) Each leaf can store arbitrary many elements.
(4) Each inner node can have arbitrary many children but has at least one child.
(5) Each inner node stores its children as pairs (child, index), where index is the smallest element which
is stored within the tree rooted by child.
-}


{-
a) Give a definition for a data type IndexedTree a that is suitable to implement the data structure explained 
above. The elements stored in the leaves of the tree should have the arbitrary type a. Use the data constructors 
Leaf and Node.
-}



{-
b) Write a function treeToList :: IndexedTree a -> [a] that computes a list of all elements stored in
the input tree. The list should contain the elements in the same order as the input tree. For example,
the tree shown in Figure 1 should result in the list [3,7,8,12,23,26,32,43,98,101]. You may use the
function (++).
-}


{-
c) Write a function contains :: Ord a => a -> IndexedTree a -> Bool that checks whether the given
element of type a is contained in the input tree, where you can assume that the tree has the properties
(1)–(5). For the sake of efficiency, this function should exploit the indices of the inner nodes of the input
tree. For example, the evaluation of the expression contains 22 n1, where n1 is the root of the tree
shown in Figure 1, must not require more than two recursive calls (one for n2 and one for n5).
-}
--test: takeWhile even [2,4,3,6,8]
--output: [2,4]