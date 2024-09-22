main :: IO ()
main = do
        putStrLn "Ingrese el primer sumando: "
        x <- getLine

        putStrLn "Ingrese el segundo sumando: "
        y <- getLine

        let res = suma (read x :: Int) (read y :: Int)
        putStrLn ("El resultado es " ++ show res)

suma :: Int -> Int -> Int 
suma x y = x + y