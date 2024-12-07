
import Data.List (delete)

parseLine:: String -> [Int]
parseLine line = map read (words line)

parseFile:: String -> [[Int]]
parseFile content = map parseLine (lines content)

isSafe :: [Int] -> Bool
isSafe levels = isIncreasing levels || isDecreasing levels
  where
    isIncreasing (x:y:xs) = (y - x >= 1 && y - x <= 3) && isIncreasing (y:xs)
    isIncreasing _        = True
    isDecreasing (x:y:xs) = (x - y >= 1 && x - y <= 3) && isDecreasing (y:xs)
    isDecreasing _        = True

canBeSafeWithOneRemoval :: [Int] -> Bool
canBeSafeWithOneRemoval levels = any isSafe (removeOne levels)
  where
    removeOne :: [Int] -> [[Int]]
    removeOne xs = [delete x xs | x <- xs]

isSafeWithDampener :: [Int] -> Bool
isSafeWithDampener levels = isSafe levels || canBeSafeWithOneRemoval levels

countSafeReports :: [[Int]] -> Int
countSafeReports reports = length (filter isSafeWithDampener reports)

main:: IO()
main = do
    content <- readFile "input/day_2.txt"

    let parsedData = parseFile content

    putStrLn $ show (countSafeReports parsedData)