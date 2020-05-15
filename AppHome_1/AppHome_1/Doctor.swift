//
//  Doctor.swift
//  AppHome_1
//
//  Created by Xuan Huy on 11/29/19.
//  Copyright © 2019 Xuan Huy. All rights reserved.
//

import Foundation
import UIKit

class DoctorController: knTabController {

    override func setupView() {
        let home = knTabBarItem(icon: #imageLiteral(resourceName: "home32"), title: "Home")
        let appointment = knTabBarItem(icon: #imageLiteral(resourceName: "bell96"), title: "Appointment")
        let add = knTabBarItem(icon: #imageLiteral(resourceName: "CameraTab"), title: "")
        add.lock = true
        add.itemHeight = 66
        let doctors = knTabBarItem(icon: #imageLiteral(resourceName: "personfull"), title: "Doctors")
        let porfolio = knTabBarItem(icon: #imageLiteral(resourceName: "bell96"), title: "Porfolio")

        let red = UIViewController()
        red.view.backgroundColor = .red
        let green = UIViewController()
        green.view.backgroundColor = .green
        let blue = UIViewController()
        blue.view.backgroundColor = .white
        let yellow = UIViewController()
        yellow.view.backgroundColor = .yellow
        let gray = UIViewController()
        gray.view.backgroundColor = .gray

        setTabBar(items: [home, appointment, add, doctors, porfolio])
        viewControllers = [red, green, blue, yellow, gray]
        normalColor = .red
    }
}
