data Rect = Rect {
    x :: Int,
    y :: Int,
    w :: Int,
    h :: Int
} deriving Show

data Point = Point {
    px :: Int,
    py :: Int
} deriving Show

contains :: Rect -> Point -> Bool
contains rect point =
    (x rect) <= (px point) && (px point) < (x rect) + (w rect) &&
    (y rect) <= (py point) && (py point) < (y rect) + (h rect)

main :: IO ()
main = do
    print $ contains Rect { x = 2, y = 2, w = 3, h = 3 } Point { px = 1, py = 1 }
    print $ contains Rect { x = 2, y = 2, w = 3, h = 3 } Point { px = 2, py = 2 }
    print $ contains Rect { x = 2, y = 2, w = 3, h = 3 } Point { px = 3, py = 3 }
    print $ contains Rect { x = 2, y = 2, w = 3, h = 3 } Point { px = 4, py = 4 }
    print $ contains Rect { x = 2, y = 2, w = 3, h = 3 } Point { px = 5, py = 5 }

