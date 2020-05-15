//
//  Date_Extension.swift
//  Bai9
//
//  Created by Xuan Huy on 11/6/19.
//  Copyright © 2019 Xuan Huy. All rights reserved.
//

import Foundation
import UIKit

extension Date {
   static func calculateDate(day: Int, month: Int, year: Int, hour: Int, minited: Int) -> Date {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyy/MM/dd HH:mm"
            formatter.locale = Locale(identifier: "en_US_POSIX")
            formatter.timeZone = TimeZone(secondsFromGMT: 0)
    let caculateDate = formatter.date(from: "\(year) \(month) \(day) \(hour): \(minited)")
    return caculateDate!
        }
    func getNgayThangNamGioPhutGiay() -> (day: Int, month: Int, year: Int, hour: Int, minited: Int, sec: Int)
    {
        let calendar = Calendar.current
        let day = calendar.component(.day, from: self)
        let month = calendar.component(.month, from: self)
        let year = calendar.component(.year, from: self)
        let hour = calendar.component(.hour, from: self)
        let minute = calendar.component(.minute, from: self)
        let second = calendar.component(.second, from: self)
        return (day, month, year, hour, minute, second)
    }
}
