//
//  PaymentController.swift
//  AppHome_1
//
//  Created by Xuan Huy on 11/29/19.
//  Copyright © 2019 Xuan Huy. All rights reserved.
//

import Foundation
import UIKit

class PaymentController: knTabController {
    override func setupView() {
        let transfer = knTabBarItem(icon: #imageLiteral(resourceName: "home32"), title: "Transfer")
        let utilities = knTabBarItem(icon: #imageLiteral(resourceName: "bell96"), title: "Utilities")
        let pay = knTabBarItem(icon: #imageLiteral(resourceName: "CameraTab"), title: "")
        pay.lock = true
        pay.itemHeight = 66
        
        let merchants = knTabBarItem(icon: #imageLiteral(resourceName: "personfull"), title: "Merchants")
        let profile = knTabBarItem(icon: #imageLiteral(resourceName: "like32"), title: "Me")
        
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
        
        setTabBar(items: [transfer, utilities, pay, merchants, profile])
        viewControllers = [red, green, blue, yellow, gray]
    }}
