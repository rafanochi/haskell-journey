{-# LANGUAGE ForeignFunctionInterface #-}

import Foreign
import Foreign.C.Types
import GHC.IO (unsafePerformIO)

foreign import ccall unsafe "math.h sin"
  c_sin :: CDouble -> CDouble

foreign import ccall unsafe "stdlib.h rand"
  c_rand :: IO CUInt

foreign import ccall unsafe "stdlib.h srand"
  c_srand :: CUInt -> IO ()

foreign import ccall unsafe "math.h frexp"
  c_frexp :: CDouble -> Ptr CInt -> IO CDouble

fastsin :: Double -> Double
fastsin x = realToFrac (c_sin (realToFrac x))

frexp :: Double -> (Double, Int)
frexp x =
  unsafePerformIO $
    alloca $
      \e -> do
        frac <- c_frexp (realToFrac x) e
        exp <- peek e
        return (realToFrac frac, fromIntegral exp)
