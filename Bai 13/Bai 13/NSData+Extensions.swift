//
//  NSData+Extensions.swift
//  Bai 13
//
//  Created by Xuan Huy on 11/7/19.
//  Copyright © 2019 Xuan Huy. All rights reserved.
//

import Foundation

extension NSDate
{
    static func caculateDate(day: Int, month: Int, year: Int) -> NSDate {
        let formatter = DateFormatter()
        
        formatter.dateFormat = "yyy/MM//dd HH:mm"
        
        formatter.locale = Locale(identifier: "en_US_POSIX")
        
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        
        let caculatedDate = formatter.date(from: "\(year) / \(month) / \(day) 0:0 ") as NSDate?
        
        return caculatedDate!
    }
}
