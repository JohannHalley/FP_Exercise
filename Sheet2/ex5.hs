{-
a) Provide a list comprehension for the list of all leap years. A year is a leap year if it is dividable by 4 but not by 100, or if it is dividable by 400. The first leap year was 1584 since the Gregorian calendar was
introduced in 1582.
-}
{-Test
takeWhile ( < 2021) leapYears

-}
leapYears :: [Int]
leapYears = [y | y <- [1582..], y `mod` 4 == 0 , y `mod` 400 == 0 || y `mod` 100 /= 0]

{-
b) Implement a function range :: [a] -> Int -> Int -> [a]. The expression range xs m n should yield the sublist of xs starting from the first element with an index >= m and ending with the last entry at an index <= n. The first entry has index 0, the last one has (length xs) - 1. For example, range
[3,4,5] 1 2 == [4,5], range [3,4,5] (-7) 2 == [3,4,5] and range [3,4,5] 10 7 == [].
-}
--range :: [a] -> Int -> Int -> [a]