-- 6. Definir una función maximo que tome dos enteros y devuelva el mayor de los dos.
main :: IO ()
main = do

    putStrLn "Ingrese el primer entero a comparar: "
    x <- getLine

    putStrLn "ingrese el segundo entero a comparar: "
    y <- getLine

    let res = mayorEntero (read x :: Int) (read y :: Int)

    putStrLn ("El número más grande es: " ++ show res)

mayorEntero :: Int -> Int -> Int
mayorEntero x y = if (x > y) then x else y
