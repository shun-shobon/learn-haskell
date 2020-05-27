fib :: Int -> Integer
fib n
    | n == 0    = 0
    | n == 1    = 1
    | otherwise = fib (n - 2) + fib (n - 1)

main :: IO ()
main = do
    print $ fib 20

