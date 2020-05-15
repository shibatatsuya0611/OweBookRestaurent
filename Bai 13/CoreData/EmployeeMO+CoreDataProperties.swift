//
//  EmployeeMO+CoreDataProperties.swift
//  Bai 13
//
//  Created by Xuan Huy on 11/7/19.
//  Copyright © 2019 Xuan Huy. All rights reserved.
//
//

import Foundation
import CoreData


extension EmployeeMO
{

    @nonobjc public class func fetchRequest() -> NSFetchRequest<EmployeeMO>
    {
        return NSFetchRequest<EmployeeMO>(entityName: "Employee")
    }

    @NSManaged public var hireDate: NSDate?
    @NSManaged public var identifier: String?
    @NSManaged public var isManager: Bool
    @NSManaged public var title: String?
    @NSManaged public var department: DepartmentMO?

    static func insertNewEmployee(dateOfBirth: NSDate, name: String, hireDate: NSDate, indentifier: String, isManager: Bool, title: String) -> EmployeeMO?
    {
        let employee = NSEntityDescription.insertNewObject(forEntityName: "Employee", into: AppDelegate.manageObjectContext!) as! EmployeeMO
        
        employee.dateOfBirth = dateOfBirth
        employee.name = name
        employee.hireDate = hireDate
        employee.identifier = indentifier
        employee.isManager = isManager
        employee.title = title
        do
            {
                try AppDelegate.manageObjectContext?.save()
            }
            catch
            {
                let nserror = error as NSError
                print("Khong the luu vao Core Data. Error is : \(nserror), \(nserror.userInfo)")
                return nil
            }
        print("Them employee voi ten: \(employee.name ?? "") thanh cong")
        return employee
    }
    static func getAllEmployee() -> [EmployeeMO]
    {
        var result = [EmployeeMO]()
        let moc = AppDelegate.manageObjectContext
        do
        {
            result = try moc!.fetch(EmployeeMO.fetchRequest()) as! [EmployeeMO]
        }
        catch
        {
            print(" Khong the lay duoc du lieu . Error: \(error)")
            return result
        }
        return result
    }
    static func deleteAllEmployee() -> Bool
    {
        let moc = AppDelegate.manageObjectContext
        let employees = EmployeeMO.getAllEmployee()
        for employee in employees
        {
            moc?.delete(employee)
        }
        do
        {
            try AppDelegate.manageObjectContext?.save()
        }
        catch
        {
            let nserror = error as NSError
            print("Khong Xoa duoc. Error is: \(nserror), \(nserror.userInfo)")
            return false
        }
        print("Xoa tat ca employee thanh cong")
        return true
    }
    func toString()
    {
        print("Employee's details. Name = \(name ?? ""), identifier: \(identifier ?? ""), isManager: \(isManager), Title : \(title ?? "")")
    }
}
