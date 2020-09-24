y f = f (y f)

main :: IO ()
main = do
    print $ flip y 10 $
        \fib n -> case n of
            0 -> 0
            1 -> 1
            n | n > 1 -> fib (n - 2) + fib (n - 1)

