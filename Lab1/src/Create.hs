{-# LANGUAGE OverloadedStrings #-}

module Create where

import           Data.List
import           Data.Text.Conversions
import           Database.MySQL.Base
import           Utils

class Create a where
  createRow :: a -> [String] -> MySQLConn -> IO OK

instance Create TableName where
  createRow Teachers params conn =
    execute
      conn
      "insert into teachers (name,surname) values(?,?)"
      [MySQLText (toText (head params)), MySQLText (toText (params !! 1))]
  createRow Sections params conn =
    execute
      conn
      "insert into sections (name,teacherID) values(?,?)"
      [MySQLText (toText (head params)), MySQLInt32 (toNum (params !! 1))]
  createRow Students params conn =
    execute
      conn
      "insert into students (name,surname,sectionID) values(?,?,?)"
      [MySQLText (toText (head params)), MySQLText (toText (params !! 1)), MySQLInt32 (toNum (params !! 2))]
  createRow Schedule params conn =
    execute
      conn
      "insert into schedule (sectionID,beginDay,beginTime,endTime) values(?,?,?,?)"
      [ MySQLInt32 (toNum (head params))
      , MySQLText (toText (params !! 1))
      , MySQLTime 0 (toTime (params !! 2))
      , MySQLTime 0 (toTime (params !! 3))
      ]
  createRow Competitions params conn =
    execute
      conn
      "insert into competitions (sectionID,beginTime,endTime) values(?,?,?)"
      [MySQLInt32 (toNum (head params)), MySQLDateTime (toDate (params !! 1)), MySQLDateTime (toDate (params !! 2))]

createRowManager :: TableName -> MySQLConn -> IO ()
createRowManager tableName conn = do
  putStrLn ""
  putStrLn "Enter these values:"
  putStrLn (intercalate "\n" (tableColumns tableName))
  case tableName of
    Teachers -> do
      name <- getLine
      surname <- getLine
      createRow tableName [name, surname] conn
    Sections -> do
      name <- getLine
      teacherID <- getLine
      createRow tableName [name, teacherID] conn
    Students -> do
      name <- getLine
      surname <- getLine
      sectionID <- getLine
      createRow tableName [name, surname, sectionID] conn
    Schedule -> do
      sectionID <- getLine
      beginDay <- getLine
      beginTime <- getLine
      endTime <- getLine
      createRow tableName [sectionID, beginDay, beginTime, endTime] conn
    Competitions -> do
      sectionID <- getLine
      beginTime <- getLine
      endTime <- getLine
      createRow tableName [sectionID, beginTime, endTime] conn
  putStrLn "--- Created ---"
