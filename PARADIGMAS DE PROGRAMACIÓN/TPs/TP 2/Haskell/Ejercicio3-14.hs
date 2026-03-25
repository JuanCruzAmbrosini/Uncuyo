ocurrencias :: Int -> [Int] -> Int
ocurrencias _ [] = 0
ocurrencias n (h:t)
 | n == h = (ocurrencias n t) + 1
 | otherwise = ocurrencias n t 
  
ocurrencias2 :: Int -> [Int] -> Int
ocurrencias2 n lista = length [x | x <- lista, x == n ]






























