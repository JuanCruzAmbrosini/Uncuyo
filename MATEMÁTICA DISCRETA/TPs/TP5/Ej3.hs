-- 3. Definir una función multiplicacion que tome dos enteros y devuelva su producto.
main :: IO ()
main = do 

    putStrLn "Ingrese el primer operando: "
    x <- getLine

    putStrLn "Ingrese el segundo operando: "
    y <- getLine

    let res = producto (read x :: Int) (read y :: Int)
    putStrLn ("El resultado es igual a: " ++ show res)

producto :: Int -> Int -> Int
producto x y = x*y
