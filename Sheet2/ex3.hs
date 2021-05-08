--a)
conjunction :: [Bool] -> Bool
conjunction [] = True
conjunction (x:xs) | x = conjunction xs
                   | otherwise = False

--b)
universalQ :: (a -> Bool) -> [a] -> Bool
universalQ f [] = True  
universalQ f (x:xs) | (f x) = universalQ f xs
                    | otherwise = False
          