esPrimo :: Int -> Bool
esPrimo n 
 | n <= 1 = False
 | otherwise = null [x | x <- [2.. limite], n `mod` x == 0]
 where limite = floor(sqrt(fromIntegral(n))) 
