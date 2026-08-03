data Planeta = Planeta {nombre :: String, periodoOrbital :: Double} deriving (Eq, Show) 
mercurio = Planeta "Mercurio" 0.2408467
venus = Planeta "Venus" 0.61519726
tierra = Planeta "Tierra" 1.0
marte = Planeta "Marte" 1.8808158
jupiter = Planeta "Jupiter" 11.862615
saturno = Planeta "Saturno" 29.447498
urano = Planeta "Urano" 84.016846
neptuno = Planeta "Neptuno" 164.79132

edadPlaneta :: Double -> Planeta -> Double
edadPlaneta segundos planeta = (segundos / 31557600) / periodoOrbital planeta
