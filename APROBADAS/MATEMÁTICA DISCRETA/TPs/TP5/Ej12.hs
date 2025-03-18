-- 12 Definir una función absValue que tome un número y devuelva su valor absoluto.
main :: IO ()
main = do

    putStrLn "Ingrese el número del que desea el valor absoluto: "
    x <- getLine 

    let res = absValue (read x :: Int)
    putStrLn ("El valor absoluto del número ingresado es: " ++ show res)

absValue :: Int -> Int
absValue x = if (x >= 0) then x else -x