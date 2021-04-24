digitSum :: Int -> Int
digitSum x | x<10 = x
           | otherwise  = (mod x 10) + digitSum(div x 10)

intersect :: [Int] -> [Int] -> [Int]
intersect [] y = []
intersect x [] = []
intersect (x:xs) (y:ys) = search (x:xs) (y:ys) ++ intersect (x:xs) (ys) 
    where search :: [Int] -> [Int] -> [Int]
          search [] (y:ys) = []
          search (x:xs) (y:ys) | x == y = [x] 
                               | otherwise = search xs (y:ys) 

sortedIntersect :: [Int] -> [Int] -> [Int]
sortedIntersect [] y = []
sortedIntersect x [] = []
sortedIntersect (x:xs) (y:ys) | x == y = [x] ++ sortedIntersect (xs) (ys) 
                              | x > y = sortedIntersect (xs) (ys) 
                              | otherwise = sortedIntersect xs (y:ys) 

dropOddInds :: [a] -> [a]
dropOddInds [] = []
dropOddInds (x:[]) = [x]
dropOddInds (x:y:xs) = [x] ++ dropOddInds xs

(>-) :: [[a]] -> [a] -> [a]
[] >- y = []
(x:[]) >- y = x
(x:xs) >- y = x ++ y ++ (xs >- y)
infixr 6 >-






