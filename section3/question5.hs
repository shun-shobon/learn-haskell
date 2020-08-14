import System.Random

dice :: IO Int
dice = randomRIO (1, 6)

showDice :: IO Int
showDice = do
    ret <- dice
    print ret
    return ret

main :: IO ()
main = do
    showDice
    showDice
    print =<< showDice

