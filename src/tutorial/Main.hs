module Main where

import Server (app1)
import Network.Wai.Handler.Warp

main :: IO ()
main = run 8081 app1
  
