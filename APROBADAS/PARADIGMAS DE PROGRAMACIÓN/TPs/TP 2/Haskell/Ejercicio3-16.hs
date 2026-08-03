reversa :: [Int] -> [Int]
reversa [] = []
reversa (h:t) = reversa(t) ++ [h]
