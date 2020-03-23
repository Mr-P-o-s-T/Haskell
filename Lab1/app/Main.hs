{-# LANGUAGE OverloadedStrings #-}

import           Create
import           Data.List
import           Database.MySQL.Base
import           Delete
import           FindById
import           ListAll
import           System.Exit
import           Update
import           Utils

main = do
  conn <- connect defaultConnectInfo {ciUser = "root", ciPassword = "root", ciDatabase = "sport_on_faculty"}
  putStrLn "\nChoose a table from the list for interaction:"
  putStrLn (intercalate "\n" tableNames)
  putStrLn "else: quit"
  name <- getLine
  putStrLn ""
  if checkTableName name
    then do
      putStrLn
        "\nChoose an operation from the list:"
      putStrLn
        "l: list all"
      putStrLn
        "f: find by id"
      putStrLn
        "c: create"
      putStrLn
        "u: update"
      putStrLn
        "d: delete"
      putStr
        "else: go back"
      x <- getLine
      putStrLn ""
      case x of
        "l" -> listAllManager (getTableName name) conn
        "f" -> findByManager (getTableName name) conn
        "c" -> createRowManager (getTableName name) conn
        "u" -> updateRowManager name conn
        "d" -> deleteRowManager (getTableName name) conn
        _   -> putStrLn "--- Going back ---"
    else do
      putStrLn "--- Finished ---"
      close conn
      exitSuccess
  close conn
  main
