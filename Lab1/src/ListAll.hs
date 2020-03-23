{-# LANGUAGE OverloadedStrings #-}

module ListAll where

import           Database.MySQL.Base
import qualified System.IO.Streams   as Streams
import           Utils

class ListAll a where
  listAll :: a -> MySQLConn -> IO ([ColumnDef], Streams.InputStream [MySQLValue])

instance ListAll TableName where
  listAll Teachers conn     = query_ conn "select * from teachers"
  listAll Sections conn     = query_ conn "select * from sections"
  listAll Students conn     = query_ conn "select * from students"
  listAll Schedule conn     = query_ conn "select * from schedule"
  listAll Competitions conn = query_ conn "select * from competitions"

listAllManager :: TableName -> MySQLConn -> IO ()
listAllManager tableName conn = do
  putStrLn ""
  (defs, is) <- listAll tableName conn
  print ("id" : tableColumns tableName)
  mapM_ print =<< Streams.toList is

