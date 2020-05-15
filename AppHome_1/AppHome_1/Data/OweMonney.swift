//
//  OweMonney.swift
//  GhiNoProject
//
//  Created by Xuan Huy on 3/24/20.
//  Copyright © 2020 Xuan Huy. All rights reserved.
//

import Foundation
import SQLite

class OweMonney
{
    static let share = OweMonney()
    
    private let tblOweMonney = Table("owemonney")
    
    private let id = Expression<Int64>("id")
    private let owemonney = Expression<Int>("owemonney")
    private let owedate = Expression<Date>("owedate")
    private let note = Expression<String>("note")
    
    private let customerId = Expression<Int64>("customerId")
    
    private init()
    {
        // Creat table if not exosts
        do
        {
            if let connection = Database.share.connection
            {
                try connection.run(tblOweMonney.create(temporary: false, ifNotExists: true, withoutRowid: false, block: {(table) in
                    table.column(self.id, primaryKey: true)
                    table.column(self.owemonney)
                    table.column(self.owedate)
                    table.column(self.note)
                    table.column(self.customerId)
                }))
                print("Creat table OweMonner successfully")
            }
            else
            {
                print("Creat table OwemONNEY fAIL")
            }
        }
        catch
        {
            let nserror = error as NSError
            print("Creat table OweMonney Fail. Error is: \(nserror), \(nserror.userInfo)")
        }
    }
    //Insert a record to table
    func insert(owemonney: Int, owedate: Date, note: String?, customerId: Int64?) -> Int64?
    {
        do
        {
            let insert = tblOweMonney.insert(self.owemonney <- owemonney,
                                             self.owedate <- owedate,
                                             self.note <- note ?? "",
                                             self.customerId <- customerId ?? 0)
            let insertedId = try Database.share.connection!.run(insert)
            return insertedId
        }
        catch
        {
            let nserror = error as NSError
            print("Can't insert new value. Error is: \(nserror), \(nserror.userInfo)")
            return nil
        }
    }
    // find all records
    //     show all records in table
    func queryAll() -> AnySequence<Row>?
    {
        do
        {
            return try Database.share.connection?.prepare(self.tblOweMonney)
        }
        catch
        {
            let nserror = error as NSError
            print("Cannot query list all tbDepartment. Error is: \(nserror), \(nserror.userInfo)")
            return nil
        }
    }
    func toString(owemonney: Row)
    {
        print("""
            OweMonney detail.
            id = \(owemonney[self.id]),
            owemonney = \(owemonney[self.owemonney]),\n
            owedate = \(owemonney[self.owedate]),
            note = \(owemonney[self.note]),
            customerId = \(owemonney[self.customerId])
            """)
    }
}
