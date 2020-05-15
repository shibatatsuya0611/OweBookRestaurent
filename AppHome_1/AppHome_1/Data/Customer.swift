//
//  customer.swift
//  AppHome_1
//
//  Created by Xuan Huy on 4/9/20.
//  Copyright © 2020 Xuan Huy. All rights reserved.
//

import Foundation

class customer
{
    var key: String
    var name: String
    var address: String
    var phone: String
    var note: String?
    var totalowe: Int
    var date: String
    
    init(dictionary: [String: AnyObject], key: String)
    {
        self.key = key
        self.name = dictionary["name"] as! String
        self.address = dictionary["address"] as! String
        self.phone = dictionary["phone"] as! String
        self.note = dictionary["note"] as? String
        self.totalowe = Int(dictionary["totalowe"] as! String) ?? 0
        self.date = dictionary["date"] as! String
    }
}
