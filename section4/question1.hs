fact :: Int -> Int
fact = \n -> case n of
    0         -> 1
    _ | n > 0 -> n *  fact (n - 1)

main :: IO ()
main = do
    print $ fact 5

