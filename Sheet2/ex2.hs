data List a = Nil | Cons a (List a) deriving Show


{-
a) Consider the type List a from the lecture that is defined as follows:
data List a = Nil | Cons a (List a) deriving Show
Declare List a as an instance of the type class Eq whenever a is an instance of Eq. Implement the method (==) such that it computes equality between lists entrywise.
-}
{- Tests
:l ex2.hs
Nil == Nil
Cons 2 (Cons 2 Nil) == Nil
Cons 2 (Cons 2 Nil) == Cons 1 (Cons 1 Nil)
Cons 2 (Cons 2 Nil) == Cons 2 (Cons 2 Nil)

-}
instance Eq a => Eq (List a) where
    Nil == Nil = True
    _ == Nil = False
    Nil == _ = False
    Cons x xs == Cons y ys = x == y && xs == ys


{-
b) Give a declaration for a type class Mono for monoids as a subclass of Eq such that for every type a of the
type class Mono there are the following methods:
• binOp :: a -> a -> a (for “binary operation”).
• one :: a (the neutral element of the monoid).
• pow :: Word -> a -> a (for “power”). Word is the predefined type for non-negative integers.
Here, for an object x of type a and a number n :: Word the expression pow n x should stand for
binOp x (binOp x ...(binOp x one)) with n occurrences of binOp. So pow 0 x == one.
The class declaration should contain a default implementation for pow. In contrast, the functions binOp
and one have to be implemented in the instances of the type class Mono.
-}
class Eq a => Mono a where
    binOp :: a -> a -> a
    one :: a
    pow :: Word -> a -> a 
    pow 0 _ = one
    pow n x = binOp x (pow (n - 1) x)


{-
c) Declare the built-in type Integer1 and List a from a) as instances of the type class Mono for as many
types a as possible. For Integer the binary operation should be (*) and the neutral element is 1. For
List a the binary operation is concatenation of the lists where the empty list is the neutral element.
For example binOp (-3) 2 == -6 and pow 4 (-1) == 1, and binOp (Cons ’a’ Nil) (Cons ’b’ (Cons
’c’ Nil)) == Cons ’a’ (Cons ’b’ (Cons ’c’ Nil)) and pow 2 (Cons ’d’ Nil) == Cons ’d’ (Cons
’d’ Nil).
-}
--not Int?
instance Mono Integer where
    binOp = (*)
    one = 1

instance Eq a => Mono (List a) where
    binOp Nil x = x
    binOp (Cons x xs) ys = Cons x (binOp xs ys)
    one = Nil


{-
d) For any monoid a, implement a function multiply that given a list of type [(Word,a)] multiplies the
powers of the pairs from the list, i.e., multiply [(x1,y1),(x2,y2),...,(xn,yn)] == binOp (pow x1
y1) (binOp (pow x2 y2) (binOp ...(binOp (pow xn yn) one))). The empty product multiply []
is defined to be the neutral element of the monoid a.
-}
{-
test:
:l ex2.hs
multiply [(3,Cons 'a' Nil),(0,Cons 'b' Nil),(2,Cons 'c' (Cons 'd' Nil))]

output:
Cons ’a’ (Cons ’a’ (Cons ’a’ (Cons ’c’ (Cons ’d’ (Cons ’c’ (Cons ’d’ Nil))))))
-}
multiply :: Mono a => [(Word, a)] -> a
multiply [] = one
multiply ((n,x):xs) = binOp (pow n x) (multiply xs)


{-Tets
:l ex2.hs
binOp 2 3
one
pow 3 (-1)
pow 4 2
multiply [(3,Cons 'a' Nil),(0,Cons 'b' Nil),(2,Cons 'c' (Cons 'd' Nil))]

-}