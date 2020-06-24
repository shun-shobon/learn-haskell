sum' :: [Integer] -> Integer
sum' []     = 0
sum' (x:xs) = x + sum' xs

product' :: [Integer] -> Integer
product' []     = 1
product' (x:xs) = x * product' xs

take' :: Int -> [Integer] -> [Integer]
take' _ []        = []
take' n _ | n < 1 = []
take' n (x:xs)    = x : take' (n - 1) xs

drop' :: Int -> [Integer] -> [Integer]
drop' _ []         = []
drop' n xs | n < 1 = xs
drop' n (_:xs)     = drop' (n - 1) xs

reverse' :: [Integer] -> [Integer]
reverse' []     = []
reverse' (x:xs) = reverse' xs ++ [x]

main :: IO ()
main = do
    print $ sum'     [1..10]
    print $ product' [1..10]
    print $ take' 5  [1..10]
    print $ drop' 5  [1..10]
    print $ reverse' [1..10]

