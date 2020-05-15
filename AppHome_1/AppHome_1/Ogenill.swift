//
//  Ogenill.swift
//  AppHome_1
//
//  Created by Xuan Huy on 11/29/19.
//  Copyright © 2019 Xuan Huy. All rights reserved.
//

import Foundation
import UIKit
class OgeniiController: knTabController {
    
    
    override func setupView() {
        let discover = knTabBarItem(icon: #imageLiteral(resourceName: "home32"), title: "Discover")
        let learn = knTabBarItem(icon: #imageLiteral(resourceName: "CameraTab"), title: "Learn")
        learn.lock = true
        let setting = knTabBarItem(icon: #imageLiteral(resourceName: "personfull"), title: "Settings")
        let notification = knTabBarItem(icon: #imageLiteral(resourceName: "like32"), title: "Notification")

        let red = UIViewController()
        red.view.backgroundColor = .red
        let green = UIViewController()
        green.view.backgroundColor = .green
        let blue = UIViewController()
        blue.view.backgroundColor = .blue
        let yellow = UIViewController()
        yellow.view.backgroundColor = .white

        setTabBar(items: [discover, learn, notification, setting])
        viewControllers = [red, green, blue, yellow]
    }
}
