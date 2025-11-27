{-# LANGUAGE ForeignFunctionInterface #-}

module Bessel (besselJn) where

import Foreign 
import Foreign.Ptr
import Foreign.C.String
import Foreign.C.Types

#include <gsl/gsl_sf_result.h>

data GslSfResult = GslSfResult {gsl_val:: CDouble, gsl_err: CDouble}

instance Storable GslSfResult where
  sizeOf _ = (#size gsl_sf_result)
  alignment _ = alignment (undefined: CDouble)
