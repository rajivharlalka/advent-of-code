-- import Data.List (sort)

-- main :: IO ()
-- main = do
--     -- Read the file
--     content <- readFile "day_1.txt"
    
--     -- Parse the content into two lists
--     let numbers = map (\line -> let [a, b] = map read (words line) in (a, b)) (lines content)
--         leftList = map fst numbers
--         rightList = map snd numbers
    
--     -- Sort both lists
--         sortedLeft = sort leftList
--         sortedRight = sort rightList
    
--     -- Calculate distances and total distance
--         distances = zipWith (\x y -> abs (x - y)) sortedLeft sortedRight
--         totalDistance = sum distances
    
--     -- Output results
--     putStrLn $ "Sorted left list: " ++ show sortedLeft
--     putStrLn $ "Sorted right list: " ++ show sortedRight
--     putStrLn $ "Distances: " ++ show distances
--     putStrLn $ "Total distance: " ++ show totalDistance

import Data.List (group, sort)

main :: IO ()
main = do
    -- Read the file
    content <- readFile "day_1.txt"
    
    let numbers = map (\line -> let [a, b] = map read (words line) in (a, b)) (lines content)
        leftList = map fst numbers
        rightList = map snd numbers

        rightCounts = countOccurrences rightList
    
        similarityScore = sum [x * countOccurrencesOf x rightCounts | x <- leftList]
    putStrLn $ "Left list: " ++ show leftList
    putStrLn $ "Right list: " ++ show rightList
    putStrLn $ "Similarity score: " ++ show similarityScore

countOccurrences :: [Int] -> [(Int, Int)]
countOccurrences xs = map (\g -> (head g, length g)) (group (sort xs))

countOccurrencesOf :: Int -> [(Int, Int)] -> Int
countOccurrencesOf x counts = case lookup x counts of
    Just count -> count
    Nothing -> 0
