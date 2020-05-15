//
//  User.swift
//  GhiNoProject
//
//  Created by Xuan Huy on 3/24/20.
//  Copyright © 2020 Xuan Huy. All rights reserved.
//

import Foundation
import SQLite

class User
{
    static let share = User()
    
    private let tblUser = Table("user")
    
    private let idUser = Expression<Int64>("iduser")
    private let username = Expression<String>("username")
    private let pass = Expression<String>("password")
    private let level = Expression<Int64>("level")
    
    private init()
    {
        //Creat Table if not exosts
        do
        {
            if let connection = Database.share.connection
            {
                try connection.run(tblUser.create(temporary: false, ifNotExists: true, withoutRowid: false, block: {(table) in
                    table.column(self.idUser, primaryKey: true)
                    table.column(self.username)
                    table.column(self.pass)
                    table.column(self.level)
                    }))
                print("Creat table User successfully")
            }
            else
            {
                print("Create Table User Fail")
            }
        }
        catch
        {
            let nserror = error as NSError
            print("Create tale user fale. Error is: \(nserror), \(nserror.userInfo)")
        }
    }
    func login(username: String, passw: String) -> AnySequence<Row>?
    {
        do
        {
            let finlterCondition = self.username.like(username) && self.pass.like(passw)
            
            return try Database.share.connection?.prepare(self.tblUser.filter(finlterCondition))
        }
        catch
        {
            let nserror = error as NSError
            print("Can't Not Login. Error is: \(nserror), \(nserror.userInfo)")
            return nil
        }
    }
    func insert(username: String, password:String, level: Int64?) -> Int64?
    {
        do
        {
            let insert = tblUser.insert(self.username <- username,
                                        self.pass <- pass,
                                        self.level <- level ?? 0)
            let insertId = try Database.share.connection!.run(insert)
            return insertId
        }
        catch
        {
            let nserror = error as NSError
            print("Can't insert new User. Error is: \(nserror),\(nserror.userInfo)")
            return nil
        }
    }
    
//     show all records in table
    func queryAll() -> AnySequence<Row>?
    {
        do
        {
            return try Database.share.connection?.prepare(self.tblUser)
        }
        catch
        {
            let nserror = error as NSError
            print("Cannot query list all tbDepartment. Error is: \(nserror), \(nserror.userInfo)")
            return nil
        }
    }
    
    func toString(user: Row)
    {
        print("""
            User detail.
            id = \(user[self.idUser])
            username = \(user[self.username]),\n
            password = \(user[self.pass]),
            level = \(user[self.level])
            """)
    }
    
}
