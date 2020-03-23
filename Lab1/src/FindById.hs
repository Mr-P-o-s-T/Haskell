{-# LANGUAGE OverloadedStrings #-}

module FindById where

import           Database.MySQL.Base
import qualified System.IO.Streams   as Streams
import           Utils

class FindById a where
  findById :: a -> String -> MySQLConn -> IO ([ColumnDef], Streams.InputStream [MySQLValue])

instance FindById TableName where
  findById Teachers index conn = query conn "select * from teachers where id=?" [MySQLInt32 (toNum index)]
  findById Sections index conn = query conn "select * from sections where id=?" [MySQLInt32 (toNum index)]
  findById Students index conn = query conn "select * from students where id=?" [MySQLInt32 (toNum index)]
  findById Schedule index conn = query conn "select * from schedule where id=?" [MySQLInt32 (toNum index)]
  findById Competitions index conn = query conn "select * from competitions where id=?" [MySQLInt32 (toNum index)]

findByManager :: TableName -> MySQLConn -> IO ()
findByManager tableName conn = do
  putStrLn ""
  putStrLn "Enter id: "
  index <- getLine
  (defs, is) <- findById tableName index conn
  print ("id" : tableColumns tableName)
  print =<< Streams.toList is
