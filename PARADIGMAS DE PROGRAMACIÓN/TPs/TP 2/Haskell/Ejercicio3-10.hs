divisores :: Int -> [Int]
divisores n = buscarDivisores n n

buscarDivisores :: Int -> Int -> [Int]
buscarDivisores _ 0 = []
buscarDivisores n c 
 | mod n c == 0 = [c] ++ [-c] ++ (buscarDivisores n (c-1)) 
 | otherwise = buscarDivisores n (c-1)

divisores2 :: Int -> [Int]
divisores2 n = [x | x <- [-n..n], x /= 0, mod n x == 0 ]

divisores3 :: Int -> [Int]
divisores3 n = filter(\x -> x/=0 && mod n x == 0) [-n..n] 


































