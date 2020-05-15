//
//  users.swift
//  AppHome_1
//
//  Created by Xuan Huy on 4/1/20.
//  Copyright © 2020 Xuan Huy. All rights reserved.
//

import Foundation

class users
{
    var id: Int = 0
    var username: String = ""
    var password: String = ""
    var phone: String = ""
    
    init(id: Int, username: String, pass: String, phone: String)
    {
        self.id = id
        self.username = username
        self.password = pass
        self.phone = phone
    }
}
