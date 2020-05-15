//
//  Database.swift
//  GhiNoProject
//
//  Created by Xuan Huy on 3/24/20.
//  Copyright © 2020 Xuan Huy. All rights reserved.
//

import Foundation
import SQLite

class Database
{
    static let share = Database()
    public let connection: Connection?
    public let databaseFileName = "GhiNoProject.sqlite3"
    
    private init()
    {
        let dbPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first as String?
        do
        {
            connection = try Connection("\(dbPath!)/(databaseFileName)")
        }
        catch
        {
            connection = nil
            let nserror = error as NSError
            print("Can't connect to Database. Error is : \(nserror),\(nserror.userInfo)")
        }
    }
}
