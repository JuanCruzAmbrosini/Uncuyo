diferentesTres :: (Ord a, Num a) => a -> a -> a -> Bool
diferentesTres x y z 
 |x /= z && x /= y && z /= y = True
 |otherwise = False
