--a)
conjunction :: [Bool] -> Bool
conjunction = foldr (\x acc -> x && acc) True 

--b)
universalQ :: (a -> Bool) -> [a] -> Bool
universalQ prop = foldr (\x acc-> prop x && acc) True
