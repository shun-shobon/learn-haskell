fib :: Int -> IO Int
fib 0 = return 0
fib 1 = return 1
fib n | n > 1 = (+) <$> fib (n - 2) <*> fib (n - 1)

main :: IO ()
main = do
    print =<< fib 10

