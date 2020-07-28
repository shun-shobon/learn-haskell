main :: IO ()
main = do
    print [(a, b, c)
        | a <- [1..20], b <- [a..20], c <- [b..20],
        a * a + b * b == c * c]

