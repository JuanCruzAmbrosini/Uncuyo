zipSort :: [Int] -> [Int] -> [(Int, Int)]
zipSort lista1 lista2 = zipWith ordenar lista1 lista2

ordenar :: Int -> Int -> (Int, Int)
ordenar x y 
 | x >= y = (y, x)
 | otherwise = (x, y)
