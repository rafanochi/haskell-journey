{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeOperators #-}

module Main where

import Prelude.Compat
import Prelude ()

import Control.Monad.Except
import Control.Monad.Reader
import Data.Aeson
import Data.Aeson.Types
import Data.Attoparsec.ByteString
import Data.ByteString (ByteString)
import Data.List
import Data.Maybe
import Data.String.Conversions
import Data.Time
import Data.Time.Calendar
import GHC.Generics
import Lucid
import Network.HTTP.Media ((//), (/:))
import Network.Wai
import Network.Wai.Handler.Warp
import Servant
import Servant.Types.SourceT (source)
import System.Directory
import Text.Blaze
import qualified Text.Blaze.Html
import Text.Blaze.Html.Renderer.Utf8

data SortBy = Age | Name

data Child = Child {chname :: String, chage :: Int}
    deriving (Eq, Show, Generic)
instance ToJSON Child

data Waifu = Waifu
    { name :: String
    , age :: Int
    , pregnant :: Bool
    , children :: [Child]
    , registration :: Day
    }
    deriving (Eq, Show, Generic)
instance ToJSON Waifu

waifues :: [Waifu]
waifues =
    [ Waifu "Reze" 18 False [] (fromGregorian 2008 3 13)
    , Waifu "Asuna" 18 True [] (fromGregorian 2008 30 10)
    ]

-- Add a header
-- type WaifuId =
--     "waifues"
--         :> Header "User-Agent" String
--         :> Capture "waifuid" Integer
--         :> ReqBody '[JSON] Waifu

type WaifuAPI1 = "waifus" :> Get '[JSON] [Waifu]

-- :> QueryParam "sortby" SortBy
-- :> Get '[JSON] [Waifu]
-- :<|> "waifues" :> QueryFlag "pregnant" :> Get '[JSON] [Waifu]
-- :<|> "waifues" :> QueryParams "children" Child :> Get '[JSON] [Waifu]
-- -- /waifues/:waifuid
-- :<|> WaifuId :> Get '[JSON] Waifu
-- :<|> WaifuId :> Post '[JSON] Waifu
-- :<|> WaifuId :> Put '[JSON] Waifu
-- :<|> WaifuId :> DeleteNoContent

server :: Server WaifuAPI1
server = return waifues

waifuAPI :: Proxy WaifuAPI1
waifuAPI = Proxy

app :: Application
app = serve waifuAPI server

main :: IO ()
main = run 8081 app
