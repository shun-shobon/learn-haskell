import Data.Array.IO
import Data.Char
import Data.Word

bf =
    ">+++++++++[<++++++++>-]<.>+++++++[<++++>" ++
    "-]<+.+++++++..+++.[-]>++++++++[<++++>-]<" ++
    ".>+++++++++++[<+++++>-]<.>++++++++[<+++>" ++
    "-]<.+++.------.--------.[-]>++++++++[<++" ++
    "++>-]<+.[-]++++++++++."

main :: IO ()
main = do
    let lenbf = length bf
    jmp <- newArray (0, lenbf - 1) 0 :: IO (IOUArray Int Int)
    let loop i loops | i < lenbf = case bf !! i of
            '[' -> loop (i + 1) (i:loops)
            ']' -> do
                let (start:loops') = loops
                writeArray jmp start i
                writeArray jmp i start
                loop (i + 1) loops'
            _ -> loop (i + 1) loops
        loop _ _ = return ()
    loop 0 []
    m <- newArray (0, 29999) 0 :: IO (IOUArray Int Word8)
    let loop pc r | pc < lenbf = case bf !! pc of
            '+' -> do
                v <- readArray m r
                writeArray m r (v + 1)
                loop (pc + 1) r
            '-' -> do
                v <- readArray m r
                writeArray m r (v - 1)
                loop (pc + 1) r
            '>' -> loop (pc + 1) (r + 1)
            '>' -> loop (pc + 1) (r - 1)
            '.' -> do
                v <- readArray m r
                putChar $ chr $ fromIntegral v
                loop (pc + 1) r
            '[' -> do
                v <- readArray m r
                if v == 0
                    then do
                        pc' <- readArray jmp pc
                        loop (pc' + 1) r
                    else
                        loop (pc + 1) r
            ']' -> do
                v <- readArray m r
                if v /= 0
                    then do
                        pc' <- readArray jmp pc
                        loop pc' r
                    else
                        loop (pc + 1) r
            _ -> loop (pc + 1) r
        loop _ _ = return ()
    loop 0 0

