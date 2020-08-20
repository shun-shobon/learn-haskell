import Data.IORef

counter = do
    c <- newIORef 0
    return $ do
        c' <- readIORef c
        writeIORef c $ c' + 1
        readIORef c

main :: IO ()
main = do
    f <- counter
    print =<< f
    print =<< f
    print =<< f

