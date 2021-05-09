posSublistSums :: [Int] -> [Int]

posSublistSums = subListSums.getPos

subListSums :: [Int] -> [Int]
subListSums (x:y:xs) = x:subListSums((x + y):xs)
subListSums x = x

getPos :: [Int] -> [Int]
getPos = filter (\x -> x >= 0)

{-
:l ex6
posSublistSums [1,-2,3,-4,5]

-}