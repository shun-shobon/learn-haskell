fact :: Integer -> Integer
fact n | n > 0 = product [1..n]

main :: IO ()
main = do
    print $ fact 1
    print $ fact 2
    print $ fact 3
    print $ fact 4
    print $ fact 5
    print $ fact 6
    print $ fact 7
    print $ fact 8
    print $ fact 9
    print $ fact 10

