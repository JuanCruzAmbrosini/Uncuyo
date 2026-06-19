sumatoria :: Num a => [a] -> a
sumatoria lista = foldr (+) 0 lista

productoria :: Num a => [a] -> a
productoria lista = foldr (*) 1 lista

longitud :: Num b => [a] -> b
longitud lista = foldr (\ _ acc -> acc + 1) 0 lista
