//
//  Khach.swift
//  AppHome_1
//
//  Created by Xuan Huy on 3/30/20.
//  Copyright © 2020 Xuan Huy. All rights reserved.
//

import Foundation

class Khach
{
    var id: Int = 0
    var name: String = ""
    var address: String = ""
    var phone: String = ""
    var oweMonney: Int = 0
    var note: String = ""
    var oweDate: Date = Date()
    
    init(id: Int, name: String, address: String,phone: String, oweMonney: Int, note: String, oweDate: Date)
    {
        self.id = id
        self.name = name
        self.address = address
        self.phone = phone
        self.oweMonney = oweMonney
        self.note = note
        self.oweDate = oweDate
    }
}
