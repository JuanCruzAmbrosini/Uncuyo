{- 9. Definir una función esImpar que tome un entero y devuelva True si es impar y False si
es par -}
main :: IO ()
main = do

    putStrLn "Ingrese el número a evaluar: "
    x <- getLine

    let res = esImpar (read x :: Int)
    
    if (res) then putStrLn "El número ingresado es un número impar." else putStrLn "El número ingresado NO es un número impar."

esImpar :: Int -> Bool
esImpar x = if (mod x 2 /= 0) then True else False    
