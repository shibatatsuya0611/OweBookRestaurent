//
//  ViewController.swift
//  Bai9
//
//  Created by Xuan Huy on 11/6/19.
//  Copyright © 2019 Xuan Huy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lblDate: UILabel?
    @IBOutlet weak var lblTime: UILabel?
    @IBOutlet weak var datePicker: UIDatePicker?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        datePicker?.datePickerMode = .dateAndTime
        datePicker?.minimumDate = Date.calculateDate(day: 1, month: 1, year: 2017, hour: 0, minited: 0)
        datePicker?.maximumDate = Date.calculateDate(day: 31, month: 1, year: 2020, hour: 0, minited: 0)
    }
    @IBAction func valueChanged(sender: UIDatePicker, forEvent event: UIEvent)
    {
        lblDate?.text = "Day: \(sender.date.getNgayThangNamGioPhutGiay().day), month: \(sender.date.getNgayThangNamGioPhutGiay().month), year: \(sender.date.getNgayThangNamGioPhutGiay().year)"
        lblTime?.text = "Hour: \(sender.date.getNgayThangNamGioPhutGiay().hour), minuted: \(sender.date.getNgayThangNamGioPhutGiay().minited), \(sender.date.getNgayThangNamGioPhutGiay().sec) giay"
    }

}

