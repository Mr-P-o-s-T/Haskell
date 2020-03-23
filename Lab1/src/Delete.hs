{-# LANGUAGE OverloadedStrings #-}

module Delete where

import           Database.MySQL.Base
import           Utils

class Delete a where
  deleteRow :: a -> String -> MySQLConn -> IO OK

instance Delete TableName where
  deleteRow Teachers index conn = execute conn "delete from teachers where id=?" [MySQLInt32 (toNum index)]
  deleteRow Sections index conn = execute conn "delete from sections where id=?" [MySQLInt32 (toNum index)]
  deleteRow Students index conn = execute conn "delete from students where id=?" [MySQLInt32 (toNum index)]
  deleteRow Schedule index conn = execute conn "delete from schedule where id=?" [MySQLInt32 (toNum index)]
  deleteRow Competitions index conn = execute conn "delete from competitions where id=?" [MySQLInt32 (toNum index)]

deleteRowManager :: TableName -> MySQLConn -> IO ()
deleteRowManager tableName conn = do
  putStrLn ""
  putStrLn "Enter id: "
  index <- getLine
  deleteRow tableName index conn
  putStrLn "--- Deleted ---"
