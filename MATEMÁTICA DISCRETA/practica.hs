coloresCodigo :: Int -> String
coloresCodigo codigo
    | codigo == 1 = "verde"
    | codigo == 2 = "azul"
    | codigo == 3 = "amarillo"
    | codigo == 4 = "blanco"
    | codigo == 5 = "naranja"
    | otherwise = "Sin especificar"

main :: IO ()
main = do
    putStrLn "Ingrese un codigo y se le devolvera un color"
    codigoS <- getLine
    let codigo = read codigoS :: Int
    print("Su color es: " ++ coloresCodigo codigo )