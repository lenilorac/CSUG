{- liuca Caroline Liu -}
module Ex02 where
import Data.List ((\\))


-- Datatypes -------------------------------------------------------------------

-- do not change anything in this section !

type Id = String

data Expr
  = Val Double
  | Add Expr Expr
  | Mul Expr Expr
  | Sub Expr Expr
  | Dvd Expr Expr
  | Var Id
  | Def Id Expr Expr
  deriving (Eq, Show)

type Dict k d  =  [(k,d)]

define :: Dict k d -> k -> d -> Dict k d
define d s v = (s,v):d

find :: Eq k => Dict k d -> k -> Maybe d
find []             _                 =  Nothing
find ( (s,v) : ds ) name | name == s  =  Just v
                         | otherwise  =  find ds name

type EDict = Dict String Double

v42 = Val 42 ; j42 = Just v42

-- Part 1 : Evaluating Expressions -- (60 test marks, worth 15 Exercise Marks) -

-- Implement the following function so all 'eval' tests pass.

-- eval should return Nothing if:
  -- (1) a divide by zero operation was going to be performed;
  -- (2) the expression contains a variable not in the dictionary.

eval :: EDict -> Expr -> Maybe Double
eval d (Var e) = find d e
eval _ (Val e) = Just e
eval _ (Dvd e(Val 0)) = Nothing

eval d (Add x y) = case (eval d x, eval d y) of 
	(Just a, Just b) -> Just (a + b) 
	_		 -> Nothing

eval d (Sub x y) = case (eval d x, eval d y) of
	(Just a, Just b) -> Just (a - b)
	_		 -> Nothing

eval d (Mul x y) = case (eval d x, eval d y) of 
	(Just a, Just b) -> Just (a * b)
	_ 		 -> Nothing

eval d (Dvd x y) = case (eval d x, eval d y) of
	(Just a, Just b) -> Just (a / b)
	_		 -> Nothing

eval d (Def x y z) = case eval d y of 
	Just a -> eval (define d x a) z
	_ 	-> Nothing

eval d e = Just 1e-99

-- Part 1 : Expression Laws -- (15 test marks, worth 15 Exercise Marks) --------

{-

There are many, many laws of algebra that apply to our expressions, e.g.,

  x + y            =  y + z         Law 1
  x + (y + z)      =  (x + y) + z   Law 2
  x - (y + z)      =  (x - y) - z   Law 3
  (x + y)*(x - y)  =  x*x - y*y     Law 4
  ...

  We can implement these directly in Haskell using Expr

  Function LawN takes an expression:
    If it matches the "shape" of the law lefthand-side,
    it replaces it with the corresponding righthand "shape".
    If it does not match, it returns Nothing

    Implement Laws 1 through 4 above
-}


law1 :: Expr -> Maybe Expr
law1 e = case (e) of 
	(Add x y) -> Just (Add y x)
	_ 	  -> Nothing

law2 :: Expr -> Maybe Expr
law2 e = case (e) of
	(Add x (Add y z)) -> Just (Add (Add x y) z)
	_		  -> Nothing

law3 :: Expr -> Maybe Expr
law3 e = case (e) of 
	(Sub x (Add y z)) -> Just (Sub (Sub x y) z)
	_		  -> Nothing

law4 :: Expr -> Maybe Expr
law4 e = case (e) of
	(Mul (Add x y) (Sub a b)) -> if x == a && y == b then Just (Sub (Mul x x) (Mul y y))
				     else Nothing
	_			  -> Nothing
