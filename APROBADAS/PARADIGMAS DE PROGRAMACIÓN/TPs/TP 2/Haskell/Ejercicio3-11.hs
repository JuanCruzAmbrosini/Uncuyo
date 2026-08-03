horasMinSeg ::  Int -> Maybe [Int]
horasMinSeg seg 
  | seg < 0 = Nothing
  | otherwise = Just [horas, minutos, segundos]
  where 
    horas = div seg 3600
    resto = mod seg 3600

    minutos = div resto 60
    segundos = mod resto 60


















































