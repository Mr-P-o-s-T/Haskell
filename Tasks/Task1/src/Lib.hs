module Lib where

import           Data.List
import           Data.Maybe
import           System.Random
import           Text.Printf

deskSize = 8

-- Checks interval for chess board
valid :: Int -> Bool
valid num = (0 <= num) && (num < deskSize)

-- Gets valid user input and return tuple of two integers representing chess board starting coordinates
readStart :: IO (Int, Int)
-- User input is split by spaces (if present) and put into list
readStart = do
  ints <- fmap (map read . words) getLine
  -- If user input doesn't consist of two valid integers
  if length ints /= 2 || not (all valid (map (\x -> x - 1) ints))
    then do
      putStrLn "Incorrect input... Try again"
      readStart
    else return (head ints - 1, ints !! 1 - 1)

-- Coded Г-moves of knight
moves :: [(Int, Int)]
moves = [(1, 2), (-1, 2), (1, -2), (-1, -2), (2, 1), (-2, 1), (2, -1), (-2, -1)]

-- Calculates available moves for knight
countStatus :: [(Int, Int)] -> [(Int, Int)]
countStatus visited =
  let (x, y) = last visited
      ways = map (\(x0, y0) -> (x + x0, y + y0)) moves
      correctWays = filter (\(x, y) -> valid x && valid y) ways
      available = (correctWays \\ visited)
   in available

-- Simulates knight's moves
go :: [(Int, Int)] -> Maybe [(Int, Int)]
-- List of tuples consisting of coordinates for possible moves
go saved =
  let choose = countStatus saved
      sortedC = sortOn (\x -> length $ countStatus (saved ++ [x])) choose
      -- Square of chess board
      square = deskSize * deskSize
      -- Builds correct chain of knight's moves
      getGood :: Maybe [(Int, Int)] -> (Int, Int) -> Maybe [(Int, Int)]
      getGood acc point =
        let chain = go (saved ++ [point])
         in if isNothing acc
              then chain
              else acc
   -- If all deskSize * deskSize (64) slots were visited then finish
   in if length saved == square
        then Just saved
        else foldl getGood Nothing sortedC

-- Slices given list in fixed range
slice from to xs = take (to - from + 1) (drop from xs)

-- Converts integer from chess board cell to string
cellToString :: Maybe Int -> String
cellToString (Just x) = show (x + 1)
cellToString Nothing  = "-"

-- Converts list of movement coordinates to string
printDesk :: [(Int, Int)] -> String
printDesk arr = output
    -- List of coordinates converted to list of numbers in order of knight's movement
  where
    numbered = [elemIndex (i, j) arr | i <- [0 .. deskSize - 1], j <- [0 .. deskSize - 1]] :: [Maybe Int]
    -- Numbered list divided into 8 smaller lists
    slicedNumbers = [slice (i * deskSize) ((i + 1) * deskSize - 1) numbered | i <- [0 .. deskSize - 1]] :: [[Maybe Int]]
    -- String consisting of 8 lines of numbers from smaller lists
    output = intercalate "\n" $ map (intercalate "\t" . map cellToString) slicedNumbers
