reverse' = foldl (flip (:)) []
maximum' (x:xs) = foldl max x xs
minimum' (x:xs) = foldl min x xs

main :: IO ()
main = do
    let src = [-5..5]
    print $ reverse' src
    print $ maximum' src
    print $ minimum' src

