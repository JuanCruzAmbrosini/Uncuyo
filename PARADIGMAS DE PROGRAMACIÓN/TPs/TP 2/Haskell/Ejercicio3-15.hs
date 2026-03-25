filtrarPositivos :: [Int] -> Int
filtrarPositivos lista = length [x | x <- lista, x > 0]
