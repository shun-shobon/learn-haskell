main :: IO ()
main = do
    let loop i s | i <= 100 = loop (i + 1) (s + i)
        loop _ s = s
    print $ loop 1 0

