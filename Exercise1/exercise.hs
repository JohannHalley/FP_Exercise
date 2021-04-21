--computes the digit sum of a natural number
--digitSum 140
digitSum :: Int -> Int
digitSum x  | x >= 0 = if x >= 10 then (mod x 10) + (digitSum (div x 10)) else x
            | otherwise = digitSum y
                where y = -x


--computes the intersection of two unsorted lists
--intersect [0,-1] [9,0,3,-1]
--intersect [4,3,7] [5,3,4]
intersect :: [Int] -> [Int] -> [Int]
intersect (a:[]) (b:[]) = if a == b then [a] else [] 
intersect [] _ = []
intersect _ [] = []
intersect [a] (b:c:cs) = intersect [a] (c:cs) ++ intersect [a] [b]
intersect (a:b:bs) c = intersect (b:bs) c ++ intersect [a] c


--computes the intersection of two sorted and duplicate-free lists
--intersect [3,7] [3,4]
sortedIntersect :: [Int] -> [ Int] -> [Int ]
sortedIntersect [a] [b] = if a ==b then [a] else []
sortedIntersect (a:b:bs) [c] = sortedIntersect [a] [b] ++ sortedIntersect (b:bs) [c]
sortedIntersect [a] (b:c:cs) = sortedIntersect (b:c:cs) [a]
sortedIntersect (a:b:bs) (c:d:ds) = sortedIntersect [a] (c:d:ds) ++ sortedIntersect (b:bs) (c:d:ds)


--1 \leq i \leq n
--dropOddInds [True,False,True,False]
--dropOddInds [[],[1],[2,3]]
dropOddInds :: [a] -> [a]
dropOddInds [] = []
dropOddInds [a] = [a]
dropOddInds (a:b:bs) = a: dropOddInds bs


-- [l1, l2, l3] >- l
--["foo", "bar", "baf"] >- ", "
(>-) :: [[a]] -> [a] -> [a]
(>-) [[]] [] = []
(>-) ((a:as):[]) (d:ds) = (a:as)
(>-) ((a:as):(b:bs):cs) (d:ds) = (a:as) ++ (d:ds) ++ (>-) ((b:bs):cs) (d:ds)

infixr 6 >-
