posSublistSums :: [Int] -> [Int]
posSublistSums x:xs | x < 0 = res ++ posSublistSums xs
                    | otherwise res ++ (last(res) + x) ++ posSublistSums xs
    where res :: [Int]
          res = 