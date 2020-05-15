//
//  DataKhach.swift
//  AppHome_1
//
//  Created by Xuan Huy on 3/30/20.
//  Copyright © 2020 Xuan Huy. All rights reserved.
//

import Foundation

class khachData
{
    static var share: khachData = khachData()
    
    var khachList =
    [
        Khach(id: 1, name: "Nguyen Van A", address: "TN",phone: "091231746", oweMonney: 200000, note: "no note", oweDate: Date()),
        Khach(id: 2, name: "Nguyen Van B", address: "HN",phone: "09426681237", oweMonney: 390599, note: "no note", oweDate: Date()),
        Khach(id: 3, name: "Nguyen Van C", address: "BG",phone: "095617272", oweMonney: 205120000, note: "no note", oweDate: Date()),
        Khach(id: 4, name: "Nguyen Van D", address: "LS",phone: "012394726", oweMonney: 572324, note: "no note", oweDate: Date()),
        Khach(id: 5, name: "Nguyen Van E", address: "TB",phone: "0427372638", oweMonney: 13523412, note: "no note", oweDate: Date())
    ]
    
    class func getkhachList() -> [Khach]
    {
        let khachList =
        [
            Khach(id: 1, name: "Nguyen Van A", address: "TN",phone: "091231746", oweMonney: 200000, note: "no note", oweDate: Date()),
            Khach(id: 2, name: "Nguyen Van B", address: "HN",phone: "09426681237", oweMonney: 390599, note: "no note", oweDate: Date()),
            Khach(id: 3, name: "Nguyen Van C", address: "BG",phone: "095617272", oweMonney: 205120000, note: "no note", oweDate: Date()),
            Khach(id: 4, name: "Nguyen Van D", address: "LS",phone: "012394726", oweMonney: 572324, note: "no note", oweDate: Date()),
            Khach(id: 5, name: "Nguyen Van E", address: "TB",phone: "0427372638", oweMonney: 13523412, note: "no note", oweDate: Date())
        ]
        
        return khachList
    }
}
