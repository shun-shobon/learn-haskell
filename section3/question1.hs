import System.Random

randAlpha :: IO (Char)
randAlpha = randomRIO ('a', 'z')

main :: IO ()
main = do
    alpha <- randAlpha
    print alpha
    if alpha == 'z' then
        print "END"
    else
        main

