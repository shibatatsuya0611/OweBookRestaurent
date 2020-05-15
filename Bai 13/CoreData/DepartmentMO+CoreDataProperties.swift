//
//  DepartmentMO+CoreDataProperties.swift
//  Bai 13
//
//  Created by Xuan Huy on 11/7/19.
//  Copyright © 2019 Xuan Huy. All rights reserved.
//
//

import Foundation
import CoreData


extension DepartmentMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DepartmentMO> {
        return NSFetchRequest<DepartmentMO>(entityName: "Department")
    }

    @NSManaged public var address: String?
    @NSManaged public var name: String?
    @NSManaged public var zipCode: Int32
    @NSManaged public var city: String?
    @NSManaged public var employees: NSSet?

}

// MARK: Generated accessors for employees
extension DepartmentMO {

    @objc(addEmployeesObject:)
    @NSManaged public func addToEmployees(_ value: EmployeeMO)

    @objc(removeEmployeesObject:)
    @NSManaged public func removeFromEmployees(_ value: EmployeeMO)

    @objc(addEmployees:)
    @NSManaged public func addToEmployees(_ values: NSSet)

    @objc(removeEmployees:)
    @NSManaged public func removeFromEmployees(_ values: NSSet)


    static func insertNewDepartment(address: String, city: String, name: String, zipcoze: Int32) -> DepartmentMO?
    {
        let department = NSEntityDescription.insertNewObject(forEntityName: "Department", into: AppDelegate.manageObjectContext!) as! DepartmentMO
        department.address = address
        department.city = city
        department.name = name
        department.zipCode = zipcoze
        do {
            try AppDelegate.manageObjectContext?.save()
            }
            catch
            {
                let nserro = error as NSError
                print("Khong the them Department, Error is: \(nserro), \(nserro.userInfo)")
                return nil
            }
        print("Them department voi ten: \(department.name ?? "") thanh cong")
        return department
    }
    static func fetchDepartmentsWithFilter(nameContains: String?, nameExactly: String?) -> [DepartmentMO]
    {
        var result = [DepartmentMO]()
        let moc = AppDelegate.manageObjectContext
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = DepartmentMO.fetchRequest()
        var subPredicates = [NSPredicate]()
        if nameContains != nil
        {
            let predicate1 = NSPredicate(format: "name contains[cd] %@", nameContains!)
            // cd = Case and diacritic insensitive look ups
            subPredicates.append(predicate1)
        }
        if nameExactly != nil
        {
            let predicate2 = NSPredicate(format: "name == %@", nameExactly!)
            subPredicates.append(predicate2)
        }
        if subPredicates.count > 0
        {
            let compoundPredicate = NSCompoundPredicate.init(type: .and, subpredicates: subPredicates)
            fetchRequest.predicate = compoundPredicate
        }
        do
        {
            result = try moc!.fetch(fetchRequest) as! [DepartmentMO]
        } catch
        {
            print("Cannot fetch employees. Error \(error)")
            return result
        }
        return result
    }
    func toString()
    {
        print("Department's details. Name: \(name ?? ""), address: \(address ?? ""), city: \(city ?? ""), zipcode: \(zipCode)")
        if let employeeList = self.employees
        {
            if employeeList.count == 0
            {
                return
            }
            print("Department's employees datail: ")
            for eachEmployee in employeeList
            {
                (eachEmployee as! EmployeeMO).toString()
            }
        }
    }
}
