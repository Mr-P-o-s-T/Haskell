module Lib
    ( someFunc
    ) where

startInfiniteList :: (Num a) => [a]
startInfiniteList = 1 : map (+1) startInfiniteList

f :: (Num a) => a -> a
f x = x

getInfList :: (Num a, Num b) => (a -> b) -> Int -> [b]
getInfList f n =  map f $ take n startInfiniteList

summator :: (Num a) => [a] -> a -> [a]
summator acc x
  | null acc = acc ++ [x]
  | otherwise = acc ++ [last acc + x]

getPartSumms :: Num a => [a] -> [a]
getPartSumms = foldl summator []

someFunc :: IO ()
someFunc = print $ getPartSumms $ getInfList f 5
