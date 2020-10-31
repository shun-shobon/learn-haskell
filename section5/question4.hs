import Control.Monad
import System.Random

rand :: IO Double
rand = getStdRandom $ randomR (0.0, 1.0)

main :: IO ()
main = do
    r <- replicateM 100 $ do
        rands <- replicateM 12 rand
        return $ truncate (sum rands + 0.5) - 6
    forM_ [-3..3] $ \i -> do
        let c = length $ filter (== i) r
            i' = show i
            n = replicate (2 - length i') ' ' ++ i'
        putStrLn $ n ++ ": " ++ replicate c '*'

