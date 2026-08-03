doubleVal x y = doubleF x + doubleF y
doubleF x = x + x

cuadrado x = x*x

data Figura = Circulo Float Float Float deriving (Show)
