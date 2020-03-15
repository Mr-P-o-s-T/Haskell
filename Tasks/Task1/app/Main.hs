module Main where

import           Lib

-- Two integers in range [1, 8] separated by space, which are expected here, represent the cell on the given 8x8 chess board
-- Example: 4 7
main :: IO ()
main = do
  point <- readStart
  putStrLn $ maybe "No solution" printDesk $ go [point]
