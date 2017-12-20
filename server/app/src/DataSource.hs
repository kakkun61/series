{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE TemplateHaskell #-}

module DataSource
  ( connectDB
  , defineTable
  ) where

import Database.HDBC.Query.TH (defineTableFromDB')
import Database.HDBC.MySQL
import Database.HDBC.Schema.MySQL (driverMySQL)
import Database.Relational.Query (identifierQuotation, IdentifierQuotation (..))
import Database.Relational.Schema.MySQLInfo.Config (config)
import Language.Haskell.TH (Q, Dec)
import System.IO (IO)
import Data.String (String)
import Text.Read (read)
import Text.Show (Show)
import Data.Maybe (Maybe (Nothing), fromMaybe)
import System.Environment (getEnv, lookupEnv)
import Control.Applicative ((<$>))
import GHC.Generics

connectDB :: IO Connection
connectDB = do
  let mysqlGroup = Nothing
  mysqlHost       <- getEnv "SERIES_MYSQL_HOST"
  mysqlPort       <- maybe 0 read <$> lookupEnv "SERIES_MYSQL_PORT"
  mysqlUnixSocket <- fromMaybe "" <$> lookupEnv "SERIES_MYSQL_SOCKET"
  mysqlDatabase   <- getEnv "SERIES_MYSQL_DATABASE"
  mysqlUser       <- getEnv "SERIES_MYSQL_USER"
  mysqlPassword   <- getEnv "SERIES_MYSQL_PASSWORD"
  connectMySQL MySQLConnectInfo {..}

connectDB' :: IO Connection
connectDB' = do
    let mysqlUser = "root"
        mysqlDatabase = "INFORMATION_SCHEMA"
        mysqlGroup = Nothing
    mysqlHost       <- getEnv "SERIES_MYSQL_HOST"
    mysqlPort       <- read <$> getEnv "SERIES_MYSQL_PORT"
    mysqlUnixSocket <- fromMaybe "" <$> lookupEnv "SERIES_MYSQL_SOCKET"
    mysqlPassword   <- getEnv "MYSQL_PASSWORD"
    connectMySQL MySQLConnectInfo { .. }

defineTable :: String -> Q [Dec]
defineTable tableName =
    defineTableFromDB'
        connectDB'
        (config { identifierQuotation = Quotation '`' })
        driverMySQL
        "series"
        tableName
        [''Show,  ''Generic]
