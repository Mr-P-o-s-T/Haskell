{-# LANGUAGE OverloadedStrings #-}

module Update where

import           Data.List
import           Data.Text.Conversions
import           Database.MySQL.Base
import           Utils

class Update a where
  updateRow :: a -> String -> String -> String -> MySQLConn -> IO OK

instance Update TableName where
  updateRow Teachers "name" value index conn =
    execute conn "update teachers set name=? where id=?" [MySQLText (toText value), MySQLInt32 (toNum index)]
  updateRow Teachers "surname" value index conn =
    execute conn "update teachers set surname=? where id=?" [MySQLText (toText value), MySQLInt32 (toNum index)]
  updateRow Sections "name" value index conn =
    execute conn "update sections set name=? where id=?" [MySQLText (toText value), MySQLInt32 (toNum index)]
  updateRow Sections "teacherID" value index conn =
    execute conn "update sections set teacherID=? where id=?" [MySQLInt32 (toNum value), MySQLInt32 (toNum index)]
  updateRow Students "name" value index conn =
    execute conn "update students set name=? where id=?" [MySQLText (toText value), MySQLInt32 (toNum index)]
  updateRow Students "surname" value index conn =
    execute conn "update students set surname=? where id=?" [MySQLText (toText value), MySQLInt32 (toNum index)]
  updateRow Students "sectionID" value index conn =
    execute conn "update students set sectionID=? where id=?" [MySQLInt32 (toNum value), MySQLInt32 (toNum index)]
  updateRow Schedule "sectionID" value index conn =
    execute conn "update schedule set sectionID=? where id=?" [MySQLInt32 (toNum value), MySQLInt32 (toNum index)]
  updateRow Schedule "beginDay" value index conn =
    execute conn "update schedule set beginDay=? where id=?" [MySQLText (toText value), MySQLInt32 (toNum index)]
  updateRow Schedule "beginTime" value index conn =
    execute conn "update schedule set beginTime=? where id=?" [MySQLTime 0 (toTime value), MySQLInt32 (toNum index)]
  updateRow Schedule "endTime" value index conn =
    execute conn "update schedule set endTime=? where id=?" [MySQLTime 0 (toTime value), MySQLInt32 (toNum index)]
  updateRow Competitions "sectionID" value index conn =
    execute conn "update competitions set sectionID=? where id=?" [MySQLInt32 (toNum value), MySQLInt32 (toNum index)]
  updateRow Competitions "beginTime" value index conn =
    execute
      conn
      "update competitions set beginTime=? where id=?"
      [MySQLDateTime (toDate value), MySQLInt32 (toNum index)]
  updateRow Competitions "endTime" value index conn =
    execute conn "update competitions set endTime=? where id=?" [MySQLDateTime (toDate value), MySQLInt32 (toNum index)]

updateRowManager :: String -> MySQLConn -> IO ()
updateRowManager name conn = do
  putStrLn ""
  putStrLn "Enter row id: "
  index <- getLine
  putStrLn "Choose field you want to update from the list: "
  putStrLn (intercalate "\n" (updatableTableColumns name))
  field <- getLine
  if checkUpdatableColumns name field
    then do
      putStrLn "Enter new value: "
      value <- getLine
      updateRow (getTableName name) field value index conn
      putStrLn "--- Updated ---"
    else putStrLn "--- Wrong input ---"
