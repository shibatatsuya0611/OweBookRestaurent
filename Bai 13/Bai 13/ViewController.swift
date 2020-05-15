//
//  ViewController.swift
//  Bai 13
//
//  Created by Xuan Huy on 11/7/19.
//  Copyright © 2019 Xuan Huy. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func btnAddData(sender: UIButton)
    {
        let department = DepartmentMO.insertNewDepartment(address: "USA", city: "Thai 's Nguyen", name: "Sladar", zipcoze: 123456)
        var employees = Set<EmployeeMO>()
        if let employee1 = EmployeeMO.insertNewEmployee(dateOfBirth: NSDate.caculateDate(day: 1, month: 1, year: 1990), name: "Employee 1", hireDate: NSDate(), indentifier: "A001", isManager: false, title: "Sale manager 1")
        {
            employee1.department = department
            employees.insert(employee1)
        }
        if let employee2 = EmployeeMO.insertNewEmployee(dateOfBirth: NSDate.caculateDate(day: 2, month: 2, year: 2010), name: "Employee 2", hireDate: NSDate(), indentifier: "A002", isManager: false, title: "Sale manager 2")
        {
            employee2.department = department
            employees.insert(employee2)
        }
        if let employee3 = EmployeeMO.insertNewEmployee(dateOfBirth: NSDate.caculateDate(day: 3, month: 3, year: 2000), name: "Employee 3", hireDate: NSDate(), indentifier: "A0005", isManager: true, title: "Sale manger 3")
        {
            employee3.department = department
            employees.insert(employee3)
        }
        department?.addToEmployees(employees as NSSet)
    }
    
    @IBAction func btnFecthData(sender: UIButton)
    {
        let employees = EmployeeMO.getAllEmployee()
        if employees.count == 0
        {
            print("Khong co employee nao")
            return
        }
        for employee in employees
        {
            print("Employee's name : \(employee.name ?? "")")
        }
        
    }

    @IBAction func btnDeleteAllEmployees(sender: UIButton)
    {
        EmployeeMO.deleteAllEmployee()
    }
}

