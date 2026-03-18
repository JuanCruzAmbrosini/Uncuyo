negacion :: Bool -> Bool
negacion True = False
negacion False = True

conjuncion :: Bool -> Bool -> Bool
conjuncion True True = True
conjuncion True False = False
conjuncion False True = False
conjuncion False False = False

disyuncion :: Bool -> Bool -> Bool
disyuncion True True = True
disyuncion True False = True
disyuncion False True = True
disyuncion False False = False
