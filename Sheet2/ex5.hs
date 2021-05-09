--a)
leap_years = [ y | y <-[1582..], mod y 4 == 0, mod y 400 == 0 || mod y 100 /= 0]

--b)
range :: [a] -> Int -> Int -> [a]
range list low high | low < 0 = [list !! n | n <- [0 .. high] ]
                    | high > (length(list)-1) = [list !! n | n <- [low .. (length(list)-1)] ]
                    | otherwise = [list !! n | n <- [low .. high] ]
{-
:l ex5
takeWhile (<2021) leap_years
range [3,4,5] 1 2 == [4,5]
range [3,4,5] (-7) 2 == [3,4,5] 
range [3,4,5] 10 7 == []

-}