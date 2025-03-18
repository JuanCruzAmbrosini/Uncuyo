-- 7. Definir una función minimo que tome dos enteros y devuelva el menor de los dos.
main :: IO ()
main = do 

    putStrLn "Ingrese el primer número a comparar: "
    x <- getLine

    putStrLn "Ingrese el segundo número a comparar: "
    y <- getLine

    let res = menorEntero (read x :: Int) (read y :: Int)
    putStrLn ("El menor de los 2 números ingresados es: " ++ show res)

menorEntero :: Int -> Int -> Int
menorEntero x y = if (x < y) then x else y