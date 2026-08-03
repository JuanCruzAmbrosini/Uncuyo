igualesTres :: (Ord a, Num a) => a -> a -> a -> Bool
igualesTres x y z
 | x == y && y == z = True
 | otherwise = False
