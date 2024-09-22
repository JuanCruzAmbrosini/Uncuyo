{- 8. Definir una función esPar que tome un entero y devuelva True si es par y False si es
impar. -}
main :: IO ()
main = do

    putStrLn "Ingrese el número que desea comparar: "
    x <- getLine

    let res = parOImpar (read x :: Int)

    if (res) then putStrLn "El número ingresado es par." else putStrLn "El número ingresado NO es par."

parOImpar :: Int -> Bool
parOImpar x = if (mod x 2 == 0) then True else False