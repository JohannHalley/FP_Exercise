{-
a) Implement a function conjunction :: [Bool] -> Bool.
For an input list [b1; b2; : : : ; bn], conjunction returns True if all of the values [b1; b2; : : : ; bn] are True, i.e., if b1 ^ b2 ^ : : : ^ bn is true.

Test:
:l ex3
conjunction []
conjunction [True,True,True]
conjunction [True,False,True]

-}
conjunction :: [Bool] -> Bool
conjunction [] = False
conjunction xs = foldr (&&) True xs

{-
b) Implement a function universalQ :: (a -> Bool) -> [a] -> Bool that determines whether the property
encoded by the first argument holds for all elements of the list passed as second argument. For
example, universalQ even list should yield True if all elements of list are even numbers.

Test:
:l ex3
universalQ even []
universalQ even [2,3]
universalQ even [2,4]

-}
universalQ :: (a -> Bool) -> [a] -> Bool
universalQ f = conjunction.(map f)

{-
Test:
:l ex3
conjunction []
conjunction [True,True,True]
conjunction [True,False,True]
universalQ even []
universalQ even [2,3]
universalQ even [2,4]

-}