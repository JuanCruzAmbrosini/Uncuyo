esPrimo :: Int -> Bool
esPrimo n = null [x | x <- [2..n-1], mod n x == 0]

primos :: Int -> Maybe [Int]
primos n 
 | n >= 0 = Just [x|x <- [2..n], esPrimo x ]
 | otherwise = Nothing
