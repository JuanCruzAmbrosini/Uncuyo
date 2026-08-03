data Grito = Grito {onomatopeya :: String, intensidad :: Int, mojado :: Bool} deriving (Show, Eq)
data Nino = Nino {nombre :: String, edad :: Int, altura :: Double} deriving (Show, Eq)

nivelDeTerror :: Grito -> Int
nivelDeTerror x = length(onomatopeya x)

energia :: Grito -> Int
energia x 
 |mojado x == True = (nivelDeTerror(x) * intensidad x) ^ 2
 |otherwise = nivelDeTerror(x) * 3 + intensidad x

type Monstruo = Nino -> Grito

chuckNorris :: Monstruo
chuckNorris _ = Grito ['a'..'z'] 1000 True

randal :: Monstruo
randal n
 | altura n > 0.8 && altura n < 1.2 = Grito "Mamadera!" (length [c | c <- nombre n, c `elem` "AEIOUaeiou"]) True
 | otherwise                        = Grito "Mamadera!" (length [c | c <- nombre n, c `elem` "AEIOUaeiou"]) False