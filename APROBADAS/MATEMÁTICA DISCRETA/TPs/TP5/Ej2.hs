-- 2. Definir una función resta que tome dos enteros y devuelva su diferencia.
main :: IO ()
main = do 

    putStrLn "Ingrese el primer operador: "
    x <- getLine

    putStrLn "Ingrese el segundo operador: "
    y <- getLine

    let res = resta (read x :: Int) (read y :: Int)
    putStrLn ("El resultado es: " ++ show res)

resta :: Int -> Int -> Int
resta x y = x - y