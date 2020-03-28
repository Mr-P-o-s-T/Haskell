module Lib ( singleThreaded, shortestPaths ) where

import System.Environment
import qualified Data.IntMap.Strict as Map
import Data.IntMap.Strict (IntMap)
import System.Random
import Data.List
import SparseGraph

shortestPaths :: [Vertex] -> Graph -> Graph
shortestPaths vs g = foldl' update g vs            
 where
  update g k = Map.mapWithKey shortmap g          
   where
     shortmap :: Vertex -> IntMap Weight -> IntMap Weight
     shortmap i jmap = foldr shortest Map.empty vs
        where shortest j m =
                case (old,new) of
                   (Nothing, Nothing) -> m
                   (Nothing, Just w ) -> Map.insert j w m
                   (Just w,  Nothing) -> Map.insert j w m
                   (Just w1, Just w2) -> Map.insert j (min w1 w2) m
                where
                  old = Map.lookup j jmap
                  new = do w1 <- weight g i k
                           w2 <- weight g k j
                           return (w1+w2)

singleThreaded :: IO ()
singleThreaded = do
  [h, n] <- fmap (fmap read) getArgs
  let g = mkStdGen 9999
  let (mat, vs) = randomGraph g h 100 n
  printMatrix 20 (fromAdjMatrix (toAdjMatrix h (shortestPaths vs mat)))
