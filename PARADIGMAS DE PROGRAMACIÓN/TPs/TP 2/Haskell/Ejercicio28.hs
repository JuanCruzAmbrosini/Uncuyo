esBisiesto :: Int -> Maybe Bool
esBisiesto y
 | y < 0 = Nothing
 | y `mod` 400 == 0 = Just True
 | y `mod` 100 == 0 = Just False
 | y `mod` 4 == 0 = Just True
 | otherwise = Just False
