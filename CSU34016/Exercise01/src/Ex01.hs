-- Name: Caroline Liu,  Username: liuca
module Ex01 where
import Data.Char (toUpper) -- needed for Part 1

{- Part 1

Write a function 'raise' that converts a string to uppercase

Function 'toUpper :: Char -> Char' converts a character to uppercase
if it is lowercase. All other characters are unchanged

-}
raise :: String -> String
raise n = map toUpper n

{- Part 2

Write a function 'nth' that returns the nth element of a list

-}
nth :: Int -> [a] -> a
nth x y = y !! (x - 1)

{- Part 3

write a function commonLen that compares two sequences
and reports the length of the prefix they have in common.

-}
commonLen :: Eq a => [a] -> [a] -> Int
--base case
commonLen x y = commonLen2 0 x y
--recursive case
commonLen2 :: Eq a => Int -> [a] -> [a] -> Int
commonLen2 a x y
-- somehow the $ and if-then-else doesn't work
  | a < length x && a < length y && nth (a + 1) x == nth (a + 1) y = commonLen2 (a + 1) x y
  | otherwise = a
