{-
a) Consider the type List a from the lecture that is defined as follows:
data List a = Nil | Cons a (List a) deriving Show
Declare List a as an instance of the type class Eq whenever a is an instance of Eq. Implement the method (==) such that it computes equality between lists entrywise.
-}
asd

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

{-
c) Declare the built-in type Integer1 and List a from a) as instances of the type class Mono for as many
types a as possible. For Integer the binary operation should be (*) and the neutral element is 1. For
List a the binary operation is concatenation of the lists where the empty list is the neutral element.
For example binOp (-3) 2 == -6 and pow 4 (-1) == 1, and binOp (Cons ’a’ Nil) (Cons ’b’ (Cons
’c’ Nil)) == Cons ’a’ (Cons ’b’ (Cons ’c’ Nil)) and pow 2 (Cons ’d’ Nil) == Cons ’d’ (Cons
’d’ Nil).
-}

{-
d) For any monoid a, implement a function multiply that given a list of type [(Word,a)] multiplies the
powers of the pairs from the list, i.e., multiply [(x1,y1),(x2,y2),...,(xn,yn)] == binOp (pow x1
y1) (binOp (pow x2 y2) (binOp ...(binOp (pow xn yn) one))). The empty product multiply []
is defined to be the neutral element of the monoid a.
-}
--test: multiply [(3,Cons ’a’ Nil),(0,Cons ’b’ Nil),(2,Cons ’c’ (Cons ’d’ Nil))]
--output: Cons ’a’ (Cons ’a’ (Cons ’a’ (Cons ’c’ (Cons ’d’ (Cons ’c’ (Cons ’d’ Nil))))))