(***) :: Int -> Int -> Int
a *** b = a^2 + (b-a)^3

cdl :: [Int] -> [Int] -> [Int]
cdl la lb = [x *** y | x <- la , y <- lb]

main :: IO ()
main = do
    let la = [1,2]
    let lb = [3,4]
    print (cdl la lb)
