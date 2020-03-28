import Test.HUnit
import Lib_threaded
import SparseGraph

testMatrix :: [[Int]]
testMatrix  = [[  0, 999, 999,  13, 999, 999],
                [999,   0, 999, 999,   4,   9],
                [ 11, 999,   0, 999, 999, 999],
                [999,   3, 999,   0, 999,   7],
                [ 15,   5, 999,   1,   0, 999],
                [ 11, 999, 999,  14, 999,   0]]

resultMatrix :: [[Int]]
resultMatrix  = [[0,  16, 999, 13, 20, 20],
                 [19,  0, 999,  5,  4,  9],
                 [11, 27,   0, 24, 31, 31],
                 [18,  3, 999,  0,  7,  7],
                 [15,  4, 999,  1,  0,  8],
                 [11, 17, 999, 14, 21,  0]]

test2 :: Test
test2 =
  test
    [ "test_threaded" ~: "fromAdjMatrix (toAdjMatrix 5 (shortestPaths [0..5] (mkGraph testMatrix)))" ~: resultMatrix ~=?
      fromAdjMatrix (toAdjMatrix 5 (shortestPaths [0 .. 5] (mkGraph testMatrix)))
    ]

main :: IO Counts
main = runTestTT test2
