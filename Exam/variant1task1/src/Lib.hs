module Lib
    ( someFunc
    ) where

data Tree a = Leaf a | Node (Tree a) a (Tree a)
  deriving (Show)

evenTreeElementsToList :: (Integral a) => Tree a -> [a]
evenTreeElementsToList (Leaf x)
  | mod x 2 == 0 = [x]
  | otherwise = []
evenTreeElementsToList (Node l x r) = evenTreeElementsToList l ++ isEvenElement ++ evenTreeElementsToList r
  where
  isEvenElement
    | mod x 2 == 0 = [x]
    | otherwise = []

treeExample :: Tree Integer
treeExample =
  Node (Node (Node (Leaf 1) 2 (Leaf 3)) 4 (Leaf 5)) 6 (Node (Node (Leaf 7) 8 (Node (Leaf 9) 10 (Leaf 11))) 12 (Leaf 13))

someFunc :: IO ()
someFunc = print $ evenTreeElementsToList treeExample
