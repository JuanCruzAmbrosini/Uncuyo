binario :: Int -> [Int]
binario n
 | div n 2 == 0 = [1]
 | n >= 0 = binario (div n 2) ++ [mod n 2] 
 | otherwise = []

