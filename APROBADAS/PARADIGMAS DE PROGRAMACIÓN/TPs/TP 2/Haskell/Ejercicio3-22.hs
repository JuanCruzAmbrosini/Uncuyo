--map ::(a ->b) ->[a] ->[b]
--filter ::(a ->Bool) ->[a] ->[a]
--takeWhile ::(a ->Bool) ->[a] ->[a]
--dropWhile ::(a ->Bool) ->[a] ->[a]
--iterate ::(a ->a) ->a ->[a]
--zipWith ::(a ->b ->c) ->[a] ->[b] ->[c]

aplicarAIdem :: (a -> b) -> [a] -> [b]
aplicarAIdem f lista = map f lista

menoresQueCinco :: [Int] -> [Int]
menoresQueCinco lista = filter (< 5) lista

multiplicarPositivos :: [Int] -> Int
multiplicarPositivos lista = foldr (*) 1 (filter (> 0) lista)

concatenaLL :: [[a]] -> [a]
concatenaLL yss = foldr (++) [] yss

filtraUno :: (a -> a) -> (a -> Bool) -> [a] -> [a]
filtraUno f cond xs = map aplicarSi xs
  where
    aplicarSi x | cond x    = f x
                | otherwise = x




