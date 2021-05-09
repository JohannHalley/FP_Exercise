--a)
data List a = Nil | Cons a (List a) deriving Show
instance Eq a => Eq (List a) where
    Nil == Nil = True
    Cons x rest_list_x == Cons y rest_list_y = (x == y && rest_list_x == rest_list_y)
    _ == _ = False

--b)
class Eq a => Mono a where
    binOp :: a -> a -> a
    one :: a
    pow :: Word -> a -> a
    pow 0 x = one
    pow n x = binOp x (pow (n-1) x)

--c)
instance Mono Integer where
    binOp x y = x * y
    one = 1

instance Eq a => Mono (List a) where
    binOp (Cons x rest_list_x) list_y = Cons x (binOp rest_list_x list_y)
    binOp Nil list_y = list_y
    one = Nil

{-
binOp (-3) 2 == -6 
pow 4 (-1) == 1
binOp (Cons 'a' Nil) (Cons 'b' (Cons'c' Nil)) == Cons 'a' (Cons 'b' (Cons 'c' Nil)) 
pow 2 (Cons 'd' Nil) == Cons 'd' (Cons ’d’ Nil)
-}

--d)
multiply::Mono a => [(Word,a)] -> a
multiply ((n,x):rest_list) = binOp (pow n x) (multiply rest_list)
multiply [] = one

{-
multiply [(3,Cons 'a' Nil),(0,Cons 'b' Nil),(2,Cons 'c' (Cons 'd' Nil))] == Cons 'a' (Cons 'a' (Cons 'a' (Cons 'c' (Cons 'd' (Cons 'c' (Cons 'd' Nil))))))
-}