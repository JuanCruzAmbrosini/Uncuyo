{-15. Definir una función areaTriangulo que tome la base y la altura de un triángulo y devuelva
su área. -}
main :: IO ()
main = do

    putStrLn "Ingrese la base del tríangulo: "
    base <- getLine

    putStrLn "Ingrese la altura del triángulo: "
    altura <- getLine

    let res = areaTriangulo (read base :: Float) (read altura :: Float)
    putStrLn ("El área del triángulo es de: " ++ show res)

areaTriangulo :: Float -> Float -> Float
areaTriangulo base altura = (base * altura)/2

